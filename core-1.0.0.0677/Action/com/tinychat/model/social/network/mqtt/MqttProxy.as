package com.tinychat.model.social.network.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.model.utils.array.*;
    import com.tinychat.model.utils.bencode.*;
    import flash.events.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class MqttProxy extends AbstractSocialNetworkProxy implements SocialNetworkFriends
    {
        private var _mqtt:mqtt;
        private var _currentUser:MutableMqttUser;
        private var _friends:IdItemList;
        private var _visibility:MqttVisibility;
        private var _postConnectVisibility:MqttVisibility;
        private var _messageReceived:Signal;
        private var _presenceChange:Signal;
        private var _blockedChange:Signal;
        private static const HOST:String = "im.tinychat.com";
        private static const ID:String = "web-1";
        private static const PORTS:Array = [2810, 2811, 2812, 2813];

        public function MqttProxy()
        {
            this._mqtt = new mqtt();
            this._friends = new IdItemList();
            this._visibility = MqttVisibility.ALL;
            this._messageReceived = new Signal(String, MqttUser);
            this._presenceChange = new Signal(MqttUser, PresenceType);
            this._blockedChange = new Signal(MqttUser, Boolean);
            this._mqtt.addEventListener(mqtt.MQTT_CLOSED, this.closedHandler);
            this._mqtt.addEventListener(mqtt.MQTT_CONNECTED, this.connectedHandler);
            this._mqtt.addEventListener(mqtt.MQTT_MESSAGE, this.messageHandler);
            this._mqtt.addEventListener(mqtt.MQTT_SUBSCRIBED, this.subscribedHandler);
            this._mqtt.addEventListener(mqtt.MQTT_UNSUBSCRIBED, this.unsubscribedHandler);
            return;
        }// end function

        override public function login(param1:Object) : void
        {
            if (!_isLoggingIn)
            {
                if (this._currentUser)
                {
                }
                if (this._currentUser.name != param1.username)
                {
                    this._currentUser = new MutableMqttUser(param1.username, PresenceType.OFFLINE, false, false);
                }
                this._postConnectVisibility = param1.visibility;
                this._mqtt.connect({host:HOST, id:ID, password:param1.password, port:PORTS[getRandomArrayIndex(PORTS)], username:param1.username});
            }
            return;
        }// end function

        override public function logout() : void
        {
            return;
        }// end function

        public function get messageReceived() : Signal
        {
            return this._messageReceived;
        }// end function

        public function get presenceChange() : Signal
        {
            return this._presenceChange;
        }// end function

        public function get blockedChange() : Signal
        {
            return this._blockedChange;
        }// end function

        public function get friends() : IList
        {
            return this._friends;
        }// end function

        public function get visibility() : MqttVisibility
        {
            return this._visibility;
        }// end function

        public function set visibility(param1:MqttVisibility) : void
        {
            if (isLoggedIn)
            {
            }
            if (this._visibility != param1)
            {
                this._visibility = param1;
                this._mqtt.publish("m/" + this._currentUser.name + "/v/" + param1.toString(), "");
            }
            return;
        }// end function

        override public function get currentUser() : SocialNetworkUser
        {
            return this._currentUser;
        }// end function

        public function sendMessage(param1:String, param2:UserIdentity) : void
        {
            var _loc_3:String = null;
            if (isLoggedIn)
            {
                _loc_3 = Bencoder.encode({message:param1});
                this._mqtt.publish("m/" + param2.name + "/", _loc_3);
            }
            return;
        }// end function

        public function subscribeTo(param1:String) : void
        {
            this._mqtt.subscribe("u/" + param1);
            return;
        }// end function

        public function unsubscribeFrom(param1:String) : void
        {
            var _loc_2:MutableMqttUser = null;
            this._mqtt.unsubscribe("u/" + param1);
            if (this._friends.hasItemByIdString(param1))
            {
                _loc_2 = this.getFriend(param1) as MutableMqttUser;
                _loc_2.subscribed = false;
            }
            return;
        }// end function

        public function block(param1:Identity) : void
        {
            if (isLoggedIn)
            {
                this._mqtt.publish("m/" + this.currentUser.name + "/b/" + param1.id, "");
            }
            return;
        }// end function

        public function unblock(param1:Identity) : void
        {
            if (isLoggedIn)
            {
                this._mqtt.publish("m/" + this.currentUser.name + "/ub/" + param1.id, "");
            }
            return;
        }// end function

        public function getFriend(param1:String) : MqttUser
        {
            var _loc_2:MqttUser = null;
            if (this._friends.hasItemByIdString(param1))
            {
                _loc_2 = this._friends.getItemByIdString(param1) as MqttUser;
            }
            else
            {
                _loc_2 = this.createFriend(param1, PresenceType.OFFLINE, false, false);
            }
            return _loc_2;
        }// end function

        private function connectedHandler(event:Event) : void
        {
            _isLoggedIn = true;
            _isLoggingIn = false;
            this._currentUser.presence = PresenceType.ONLINE;
            if (this.visibility != this._postConnectVisibility)
            {
                this.visibility = this._postConnectVisibility;
            }
            _loggedIn.dispatch();
            return;
        }// end function

        private function closedHandler(event:Event) : void
        {
            _isLoggedIn = false;
            _isLoggingIn = false;
            this._currentUser.presence = PresenceType.OFFLINE;
            _loggedOut.dispatch();
            return;
        }// end function

        private function messageHandler(event:Event) : void
        {
            var _loc_2:* = MqttTopicParser.parse(this._mqtt.event_data.topic);
            var _loc_3:* = Bencoder.decode(this._mqtt.event_data.payload);
            switch(_loc_2.type)
            {
                case MqttTopic.MESSAGE_FROM_USER:
                {
                    if (_loc_3)
                    {
                    }
                    if (_loc_3.hasOwnProperty("message"))
                    {
                        this.messageFromUserHandler(_loc_2.args[1], _loc_3.message);
                    }
                    break;
                }
                case MqttTopic.ONLINE_OFFLINE_PRESENCE_UPDATE:
                {
                    if (_loc_3)
                    {
                    }
                    if (_loc_3.hasOwnProperty("online"))
                    {
                        this.batchUpdatePresence(_loc_3.online, PresenceType.ONLINE);
                    }
                    if (_loc_3)
                    {
                    }
                    if (_loc_3.hasOwnProperty("offline"))
                    {
                        this.batchUpdatePresence(_loc_3.offline, PresenceType.OFFLINE);
                    }
                    if (_loc_3)
                    {
                    }
                    if (_loc_3.hasOwnProperty("blocked"))
                    {
                        this.batchUpdateBlocked(_loc_3.blocked, true);
                    }
                    break;
                }
                case MqttTopic.USER_PRESENCE_UPDATE:
                {
                    if (_loc_3 is String)
                    {
                        this.updatePresence(_loc_2.args[0], PresenceType.fromValue(_loc_3 as String));
                    }
                    break;
                }
                case MqttTopic.USER_BLOCKED:
                {
                    if (_loc_3 is String)
                    {
                        this.updateBlocked(_loc_2.args[0], true);
                    }
                    break;
                }
                case MqttTopic.USER_UNBLOCKED:
                {
                    if (_loc_3 is String)
                    {
                        this.updateBlocked(_loc_2.args[0], false);
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function subscribedHandler(event:Event) : void
        {
            var _loc_2:* = MqttTopicParser.parse(this._mqtt.event_data.topic);
            var _loc_3:* = _loc_2.args[0];
            var _loc_4:* = this.getFriend(_loc_2.args[0]) as MutableMqttUser;
            if (_loc_3)
            {
                if (_loc_4)
                {
                    _loc_4.subscribed = true;
                }
                else
                {
                    this.createFriend(_loc_3, PresenceType.OFFLINE, true, false);
                }
            }
            return;
        }// end function

        private function unsubscribedHandler(event:Event) : void
        {
            return;
        }// end function

        private function updatePresence(param1:String, param2:PresenceType) : void
        {
            var _loc_3:MutableMqttUser = null;
            if (this._friends.hasItemByIdString(param1))
            {
                _loc_3 = this.getFriend(param1) as MutableMqttUser;
                _loc_3.presence = param2;
            }
            else
            {
                _loc_3 = this.createFriend(param1, param2, true, false);
            }
            this._presenceChange.dispatch(_loc_3, param2);
            return;
        }// end function

        private function updateBlocked(param1:String, param2:Boolean) : void
        {
            var _loc_3:MutableMqttUser = null;
            if (this._friends.hasItemByIdString(param1))
            {
                _loc_3 = this.getFriend(param1) as MutableMqttUser;
                _loc_3.blocked = param2;
            }
            else
            {
                _loc_3 = this.createFriend(param1, PresenceType.OFFLINE, false, param2);
            }
            this._blockedChange.dispatch(_loc_3, param2);
            return;
        }// end function

        private function batchUpdatePresence(param1:Array, param2:PresenceType) : void
        {
            var _loc_3:String = null;
            for each (_loc_3 in param1)
            {
                
                this.updatePresence(_loc_3, param2);
            }
            return;
        }// end function

        private function batchUpdateBlocked(param1:Array, param2:Boolean) : void
        {
            var _loc_3:String = null;
            for each (_loc_3 in param1)
            {
                
                this.updateBlocked(_loc_3, param2);
            }
            return;
        }// end function

        private function messageFromUserHandler(param1:String, param2:String) : void
        {
            var _loc_3:MqttUser = null;
            if (param2)
            {
            }
            if (this.acceptMessageFrom(param1))
            {
                _loc_3 = this.getFriend(param1);
                this._messageReceived.dispatch(param2, _loc_3);
            }
            return;
        }// end function

        private function acceptMessageFrom(param1:String) : Boolean
        {
            return !this.getFriend(param1).blocked;
        }// end function

        private function createFriend(param1:String, param2:PresenceType, param3:Boolean, param4:Boolean) : MutableMqttUser
        {
            var _loc_5:* = new MutableMqttUser(param1, param2, param3, param4);
            this._friends.addItem(_loc_5);
            return _loc_5;
        }// end function

    }
}
