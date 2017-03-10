package com.tinychat.model.room
{
    import com.tinychat.model.business.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.services.vo.*;
    import org.osflash.signals.*;

    public class RoomSettingsProxy extends Object implements RoomConnectInfo, RoomSettings
    {
        private var flashvars:FlashvarsProxy;
        private var roomConnectionProxy:RoomConnection;
        private var roomServiceProxy:RoomServiceProxy;
        private var javascript:ApplicationJavascript;
        private var flashCookie:FlashCookieProxy;
        private var roomInfo:RoomInfo;
        private var _password:String;
        private var _isPrivateRoom:Boolean;
        private var _topic:String;
        private var _autoOp:String;
        private var _broadcastMode:RoomBroadcastMode;
        private var _promoted:Boolean;
        private var _roomInfoChanged:Signal;
        private var _privateRoomChanged:Signal;
        private var _topicChanged:Signal;
        private var _lurkerChanged:Signal;
        private var _cookie:String;
        private var _lurker:Boolean;
        private var _role:uint;

        public function RoomSettingsProxy(param1:FlashvarsProxy, param2:RoomServiceProxy, param3:RoomConnection, param4:ApplicationJavascript, param5:FlashCookieProxy)
        {
            this.flashvars = param1;
            this.roomConnectionProxy = param3;
            this.roomServiceProxy = param2;
            this.javascript = param4;
            this.flashCookie = param5;
            param2.roomInfoLoaded.add(this.roomInfoLoadedHandler);
            param2.broadcastPasswordChanged.add(this.broadcastPasswordChangedHandler);
            param3.topic.add(this.topicHandler);
            param3.private_room.add(this.privateRoomHandler);
            param3.registered.add(this.registeredHandler);
            this._topic = "";
            this._password = "";
            this._cookie = "";
            this._lurker = false;
            this._roomInfoChanged = new Signal();
            this._privateRoomChanged = new Signal(Boolean);
            this._topicChanged = new Signal(String);
            this._lurkerChanged = new Signal(Boolean);
            return;
        }// end function

        public function get access() : RoomAccess
        {
            return this.roomInfo ? (this.roomInfo.access) : (RoomAccess.UNKNOWN);
        }// end function

        public function get account() : String
        {
            return this.roomInfo.tinychatName ? (this.roomInfo.tinychatName) : (this.flashvars.account);
        }// end function

        public function get autoop() : String
        {
            return this._autoOp ? (this._autoOp) : (this.flashvars.autoop ? (this.flashvars.autoop) : ("none"));
        }// end function

        public function set autoop(param1:String) : void
        {
            this._autoOp = param1;
            return;
        }// end function

        public function get name() : String
        {
            return this.roomInfo ? (this.roomInfo.name) : (this.flashvars.room);
        }// end function

        public function get url() : String
        {
            return this.flashvars.urlsuper != "" ? (this.flashvars.urlsuper) : ("https://tinychat.com/" + this.name);
        }// end function

        public function get isIosRoom() : Boolean
        {
            return this.url.indexOf("/ios/") != -1;
        }// end function

        public function get namespace() : String
        {
            return this.flashvars.key != "" ? (this.flashvars.key) : ("tinychat");
        }// end function

        public function get type() : RoomType
        {
            if (this.roomInfo)
            {
                return this._lurker ? (RoomType.READONLY) : (this.roomInfo.type);
            }
            return RoomType.DEFAULT;
        }// end function

        public function get greenRoomEnabled() : Boolean
        {
            return this.flashvars.greenroom ? (true) : (this.roomInfo ? (this.roomInfo.greenRoom) : (false));
        }// end function

        public function get rtmp() : String
        {
            return this.roomInfo.rtmp;
        }// end function

        public function get tinychatId() : String
        {
            return this.roomInfo ? (this.roomInfo.tinychatId) : ("");
        }// end function

        public function get domainBlock() : String
        {
            return this.roomInfo ? (this.roomInfo.domainBlock) : ("");
        }// end function

        public function get pro() : uint
        {
            return this.flashvars.prohash != "" ? (this._role) : (Roles.FREE);
        }// end function

        public function get isRoomOwner() : Boolean
        {
            if (this.roomInfo)
            {
            }
            return this.roomInfo.isRoomOwner;
        }// end function

        public function get roomLoginRestriction() : RoomLoginRestriction
        {
            return this.flashvars.login.moreRestrictiveThan(this.roomInfo.login) ? (this.flashvars.login) : (this.roomInfo.login);
        }// end function

        public function set roomLoginRestriction(param1:RoomLoginRestriction) : void
        {
            this.roomServiceProxy.setRestriction(this.roomInfo.name, this.roomInfo.namespace, param1);
            this.loadRoomInfo();
            return;
        }// end function

        public function set cookie(param1:String) : void
        {
            this._cookie = param1;
            return;
        }// end function

        public function get cookie() : String
        {
            return this._cookie;
        }// end function

        public function set lurker(param1:Boolean) : void
        {
            if (this._lurker != param1)
            {
                this._lurker = param1;
                this._lurkerChanged.dispatch(this._lurker);
            }
            return;
        }// end function

        public function get lurker() : Boolean
        {
            return this._lurker;
        }// end function

        public function get lurkerChanged() : ISignal
        {
            return this._lurkerChanged;
        }// end function

        public function get version() : String
        {
            return "Desktop " + "1.0.0.0677";
        }// end function

        public function get password() : String
        {
            return this._password;
        }// end function

        public function set password(param1:String) : void
        {
            this._password = param1;
            this.loadRoomInfo();
            return;
        }// end function

        public function get promoted() : Boolean
        {
            return this._promoted;
        }// end function

        public function set promoted(param1:Boolean) : void
        {
            this._promoted = param1;
            return;
        }// end function

        public function get topic() : String
        {
            return this._topic;
        }// end function

        public function set topic(param1:String) : void
        {
            this.updateTopic(param1);
            this.roomConnectionProxy.call(new RoomCallTopic(this._topic));
            return;
        }// end function

        public function get isPrivateRoom() : Boolean
        {
            return this._isPrivateRoom;
        }// end function

        public function set isPrivateRoom(param1:Boolean) : void
        {
            this.updatePrivateRoom(param1);
            this.roomConnectionProxy.call(new RoomCallPrivateRoom(param1));
            return;
        }// end function

        public function get broadcastMode() : RoomBroadcastMode
        {
            return this.roomInfo.broadcastMode;
        }// end function

        public function set broadcastMode(param1:RoomBroadcastMode) : void
        {
            this.roomServiceProxy.setMode(this.roomInfo.name, this.roomInfo.namespace, param1, this.broadcastPassword);
            this.loadRoomInfo();
            return;
        }// end function

        public function get broadcastPassword() : String
        {
            return this.flashCookie.getRoomBroadcastPassword(this.roomInfo.name);
        }// end function

        public function set broadcastPassword(param1:String) : void
        {
            this.flashCookie.setRoomBroadcastPassword(this.roomInfo.name, param1);
            return;
        }// end function

        public function get roomInfoChanged() : ISignal
        {
            return this._roomInfoChanged;
        }// end function

        public function get roomInfoFailed() : ISignal
        {
            return this.roomServiceProxy.roomInfoFailed;
        }// end function

        public function get topicChanged() : ISignal
        {
            return this._topicChanged;
        }// end function

        public function refresh() : void
        {
            this.loadRoomInfo();
            return;
        }// end function

        private function loadRoomInfo() : void
        {
            this.roomServiceProxy.loadRoomInfo(this.flashvars.room, this.javascript.pageDomain, this.namespace, this._password);
            return;
        }// end function

        private function roomInfoLoadedHandler(param1:RoomInfo) : void
        {
            this.roomInfo = param1;
            if (param1.broadcastPassword != "")
            {
                this.broadcastPassword = param1.broadcastPassword;
            }
            this._roomInfoChanged.dispatch();
            return;
        }// end function

        private function broadcastPasswordChangedHandler(param1:String) : void
        {
            this.broadcastPassword = param1;
            return;
        }// end function

        private function topicHandler(param1:RoomCallbackTopicArguments) : void
        {
            this.updateTopic(param1.toString());
            return;
        }// end function

        private function privateRoomHandler(param1:RoomCallbackPrivateRoomArguments) : void
        {
            this.updatePrivateRoom(param1.isPrivate);
            return;
        }// end function

        private function registeredHandler(param1:RoomCallbackRegisteredArguments) : void
        {
            this._role = param1.toRole();
            return;
        }// end function

        private function updateTopic(param1:String) : void
        {
            this._topic = param1;
            this._topicChanged.dispatch(this._topic);
            return;
        }// end function

        private function updatePrivateRoom(param1:Boolean) : void
        {
            this._isPrivateRoom = param1;
            this._privateRoomChanged.dispatch(param1);
            return;
        }// end function

    }
}
