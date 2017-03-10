package com.tinychat.model.room.connection
{
    import com.tinychat.model.business.*;
    import com.tinychat.model.room.connection.callbacks.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.utils.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class RoomConnection extends Object implements ConnectionCallbackReceiver
    {
        private var connection:NetConnection;
        private var callbackReceiver:DynamicCallbackReceiver;
        private var connectionResponseTimer:Timer;
        private var _connecting:Boolean;
        private var _connected:Boolean;
        private var _connectedChanged:Signal;
        private var _connectionAttemptSuccess:Signal;
        private var _connectionAttemptFailure:Signal;
        private var _connectionLost:Signal;
        private var _connectionClosed:Signal;
        private var _account:Signal;
        private var _avon:Signal;
        private var _avons:Signal;
        private var _avoff:Signal;
        private var _banlist:Signal;
        private var _banned:Signal;
        private var _close:Signal;
        private var _deop:Signal;
        private var _from_owner:Signal;
        private var _join:Signal;
        private var _joins:Signal;
        private var _joinsdone:Signal;
        private var _kick:Signal;
        private var _nick:Signal;
        private var _notice:Signal;
        private var _oper:Signal;
        private var _opers:Signal;
        private var _private_room:Signal;
        private var _privmsg:Signal;
        private var _pro:Signal;
        private var _pros:Signal;
        private var _quit:Signal;
        private var _registered:Signal;
        private var _startbanlist:Signal;
        private var _topic:Signal;
        private var _viewcount:Signal;
        private var _gift:Signal;
        private var _point:Signal;
        private var _points:Signal;
        private var _gift_profile:Signal;
        private static const CONNECTION_RESPONSE_TIMEOUT:Number = 10000;

        public function RoomConnection()
        {
            this._connectedChanged = new Signal(Boolean);
            this._connectionAttemptSuccess = new Signal();
            this._connectionAttemptFailure = new Signal();
            this._connectionLost = new Signal();
            this._connectionClosed = new Signal();
            this._account = new Signal(RoomCallbackUserinfoArguments);
            this._avon = new Signal(RoomCallbackAvonArguments);
            this._avons = new Signal(RoomCallbackAvonsArguments);
            this._avoff = new Signal(RoomCallbackAvoffArguments);
            this._banlist = new Signal(RoomCallbackBanlistArguments);
            this._banned = new Signal();
            this._deop = new Signal(RoomCallbackDeopArguments);
            this._from_owner = new Signal(RoomCallbackFromOwnerArguments);
            this._join = new Signal(RoomCallbackJoinArguments);
            this._joins = new Signal(RoomCallbackJoinsArguments);
            this._joinsdone = new Signal();
            this._kick = new Signal(RoomCallbackKickArguments);
            this._nick = new Signal(RoomCallbackNickArguments);
            this._notice = new Signal(RoomCallbackNoticeArguments);
            this._oper = new Signal(RoomCallbackOperArguments);
            this._opers = new Signal(RoomCallbackOpersArguments);
            this._private_room = new Signal(RoomCallbackPrivateRoomArguments);
            this._privmsg = new Signal(RoomCallbackPrivmsgArguments);
            this._pro = new Signal(RoomCallbackProArguments);
            this._pros = new Signal(RoomCallbackProsArguments);
            this._quit = new Signal(RoomCallbackQuitArguments);
            this._registered = new Signal(RoomCallbackRegisteredArguments);
            this._startbanlist = new Signal();
            this._topic = new Signal(RoomCallbackTopicArguments);
            this._viewcount = new Signal(RoomCallbackViewCountArguments);
            this._gift = new Signal(RoomCallbackGiftArguments);
            this._point = new Signal(RoomCallbackPointArguments);
            this._points = new Signal(RoomCallbackPointsArguments);
            this._gift_profile = new Signal(RoomCallbackPrepareGiftArguments);
            return;
        }// end function

        public function get connecting() : Boolean
        {
            return this._connecting;
        }// end function

        public function get connected() : Boolean
        {
            return this._connected;
        }// end function

        public function get connectedChanged() : ISignal
        {
            return this._connectedChanged;
        }// end function

        public function get connectionAttemptSuccess() : ISignal
        {
            return this._connectionAttemptSuccess;
        }// end function

        public function get connectionAttemptFailed() : ISignal
        {
            return this._connectionAttemptFailure;
        }// end function

        public function get connectionLost() : ISignal
        {
            return this._connectionLost;
        }// end function

        public function get connectionClosed() : ISignal
        {
            return this._connectionClosed;
        }// end function

        public function connect(param1:RoomCallConnect) : void
        {
            if (!this.callbackReceiver)
            {
                this.callbackReceiver = new DynamicCallbackReceiver(this.roomCallbackHandler, RoomCallbackMethodNames.all);
            }
            if (!this.connectionResponseTimer)
            {
                this.connectionResponseTimer = new Timer(CONNECTION_RESPONSE_TIMEOUT, 1);
                this.connectionResponseTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.connectionAttemptTimerComplete);
            }
            this.connectionResponseTimer.reset();
            this.connectionResponseTimer.start();
            this.connection = new NetConnection();
            this.connection.client = this.callbackReceiver;
            this.connection.addEventListener(NetStatusEvent.NET_STATUS, this.netStatusHandler);
            param1.callOn(this.roomConnection);
            this._connecting = true;
            return;
        }// end function

        public function disconnect() : void
        {
            if (this.connection)
            {
                if (!this.connected)
                {
                }
            }
            if (this.connecting)
            {
                this.setConnected(false);
                this.connection.close();
            }
            return;
        }// end function

        public function newStream() : NetStream
        {
            var _loc_1:* = new NetStream(this.connection);
            _loc_1.bufferTime = 0;
            return _loc_1;
        }// end function

        public function call(param1:RoomMethod) : void
        {
            param1.callOn(this.roomConnection);
            return;
        }// end function

        public function get account() : ISignal
        {
            return this._account;
        }// end function

        public function get avon() : ISignal
        {
            return this._avon;
        }// end function

        public function get avons() : ISignal
        {
            return this._avons;
        }// end function

        public function get avoff() : ISignal
        {
            return this._avoff;
        }// end function

        public function get banlist() : ISignal
        {
            return this._banlist;
        }// end function

        public function get banned() : ISignal
        {
            return this._banned;
        }// end function

        public function get deop() : ISignal
        {
            return this._deop;
        }// end function

        public function get from_owner() : ISignal
        {
            return this._from_owner;
        }// end function

        public function get join() : ISignal
        {
            return this._join;
        }// end function

        public function get joins() : ISignal
        {
            return this._joins;
        }// end function

        public function get joinsdone() : ISignal
        {
            return this._joinsdone;
        }// end function

        public function get kick() : ISignal
        {
            return this._kick;
        }// end function

        public function get nick() : ISignal
        {
            return this._nick;
        }// end function

        public function get gift() : ISignal
        {
            return this._gift;
        }// end function

        public function get gift_profile() : ISignal
        {
            return this._gift_profile;
        }// end function

        public function get point() : ISignal
        {
            return this._point;
        }// end function

        public function get points() : ISignal
        {
            return this._points;
        }// end function

        public function get notice() : ISignal
        {
            return this._notice;
        }// end function

        public function get oper() : ISignal
        {
            return this._oper;
        }// end function

        public function get opers() : ISignal
        {
            return this._opers;
        }// end function

        public function get private_room() : ISignal
        {
            return this._private_room;
        }// end function

        public function get privmsg() : ISignal
        {
            return this._privmsg;
        }// end function

        public function get pro() : ISignal
        {
            return this._pro;
        }// end function

        public function get pros() : ISignal
        {
            return this._pros;
        }// end function

        public function get quit() : ISignal
        {
            return this._quit;
        }// end function

        public function get registered() : ISignal
        {
            return this._registered;
        }// end function

        public function get startbanlist() : ISignal
        {
            return this._startbanlist;
        }// end function

        public function get topic() : ISignal
        {
            return this._topic;
        }// end function

        public function get viewcount() : ISignal
        {
            return this._viewcount;
        }// end function

        private function connectionAttemptTimerComplete(event:TimerEvent) : void
        {
            this.disconnect();
            this._connectionAttemptFailure.dispatch();
            return;
        }// end function

        private function netStatusHandler(event:NetStatusEvent) : void
        {
            this.connectionResponseTimer.stop();
            if (event)
            {
            }
            if (event.info)
            {
            }
            if (event.info.code)
            {
                switch(event.info.code)
                {
                    case "NetConnection.Connect.Success":
                    {
                        break;
                    }
                    case "NetConnection.Connect.Failed":
                    case "NetConnection.Connect.Rejected":
                    {
                        this.connectFailedHandler();
                        break;
                    }
                    case "NetConnection.Connect.Closed":
                    {
                        this.connectClosedHandler();
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                ;
            }
            return;
        }// end function

        private function connectSuccessHandler() : void
        {
            if (!this.connected)
            {
                this.setConnected(true);
                this._connecting = false;
                this._connectionAttemptSuccess.dispatch();
            }
            return;
        }// end function

        private function connectFailedHandler() : void
        {
            this._connecting = false;
            this._connectionAttemptFailure.dispatch();
            return;
        }// end function

        private function connectClosedHandler() : void
        {
            this._connecting = false;
            if (this.connected)
            {
                this.disconnect();
                this._connectionLost.dispatch();
            }
            this._connectionClosed.dispatch();
            this.connection.removeEventListener(NetStatusEvent.NET_STATUS, this.netStatusHandler);
            return;
        }// end function

        private function setConnected(param1:Boolean) : void
        {
            if (this._connected != param1)
            {
                this._connected = param1;
                this._connectedChanged.dispatch(param1);
            }
            return;
        }// end function

        private function setRoomCallbackArguments(param1:String, param2:Array) : void
        {
            this._point.dispatch(new RoomCallbackPointArguments(param2, param1));
            if (param2[0].bf != false)
            {
                this._avon.dispatch(new RoomCallbackAvonArguments(param2));
            }
            if (Roles.inRoleAndMore(param2[0].stype, Roles.PRO))
            {
                this._pro.dispatch(new RoomCallbackProArguments(param2));
            }
            if (param2[0].mod != false)
            {
                this._oper.dispatch(new RoomCallbackOperArguments(param2));
            }
            return;
        }// end function

        private function get roomConnection() : AS3NetConnection
        {
            return new RoomNetConnection(this.connection);
        }// end function

        private function roomCallbackHandler(param1:String, param2:Array) : void
        {
            var _loc_3:RoomCallbackNoticeArguments = null;
            switch(param1)
            {
                case RoomCallbackMethodNames.BANLIST:
                {
                    this._banlist.dispatch(new RoomCallbackBanlistArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.BANNED:
                {
                    this.disconnect();
                    this._banned.dispatch();
                    break;
                }
                case RoomCallbackMethodNames.DEOP:
                {
                    this._deop.dispatch(new RoomCallbackDeopArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.FROM_OWNER:
                {
                    this._from_owner.dispatch(new RoomCallbackFromOwnerArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.REGISTERED:
                {
                    this._registered.dispatch(new RoomCallbackRegisteredArguments(param2));
                    this.setRoomCallbackArguments(param1, param2);
                    break;
                }
                case RoomCallbackMethodNames.JOIN:
                {
                    this._join.dispatch(new RoomCallbackJoinArguments(param2));
                    this.setRoomCallbackArguments(param1, param2);
                    break;
                }
                case RoomCallbackMethodNames.JOINS:
                {
                    this._joins.dispatch(new RoomCallbackJoinsArguments(param2));
                    this._points.dispatch(new RoomCallbackPointsArguments(param2));
                    this._avons.dispatch(new RoomCallbackAvonsArguments(param2));
                    this._pros.dispatch(new RoomCallbackProsArguments(param2));
                    this._opers.dispatch(new RoomCallbackOpersArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.JOINSDONE:
                {
                    this.connectSuccessHandler();
                    this._joinsdone.dispatch();
                    break;
                }
                case RoomCallbackMethodNames.KICK:
                {
                    this._kick.dispatch(new RoomCallbackKickArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.NICK:
                {
                    this._nick.dispatch(new RoomCallbackNickArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.GIFT:
                {
                    this._gift.dispatch(new RoomCallbackGiftArguments(param2));
                    this._point.dispatch(new RoomCallbackPointArguments(param2, param1));
                    break;
                }
                case RoomCallbackMethodNames.GIFT_PROFILE:
                {
                    this._gift_profile.dispatch(new RoomCallbackPrepareGiftArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.NOTICE:
                {
                    _loc_3 = new RoomCallbackNoticeArguments(param2);
                    switch(_loc_3.messages[0])
                    {
                        case RoomCallbackMethodNames.AVON:
                        {
                            this._avon.dispatch(new RoomCallbackAvonArguments(_loc_3.messages.slice(1), _loc_3.messages[0]));
                            break;
                        }
                        case RoomCallbackMethodNames.AVOFF:
                        {
                            this._avoff.dispatch(new RoomCallbackAvoffArguments(_loc_3.messages));
                            break;
                        }
                        case RoomCallbackMethodNames.PRO:
                        {
                            this._pro.dispatch(new RoomCallbackProArguments(_loc_3.messages));
                            break;
                        }
                        case RoomCallbackMethodNames.VIEWCOUNT:
                        {
                            this._viewcount.dispatch(new RoomCallbackViewCountArguments(_loc_3.messages));
                            break;
                        }
                        default:
                        {
                            this._notice.dispatch(_loc_3);
                            break;
                        }
                    }
                    break;
                }
                case RoomCallbackMethodNames.OPER:
                {
                    this._oper.dispatch(new RoomCallbackOperArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.PRIVATE_ROOM:
                {
                    this._private_room.dispatch(new RoomCallbackPrivateRoomArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.PRIVMSG:
                {
                    this._privmsg.dispatch(new RoomCallbackPrivmsgArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.QUIT:
                {
                    this._quit.dispatch(new RoomCallbackQuitArguments(param2));
                    break;
                }
                case RoomCallbackMethodNames.STARTBANLIST:
                {
                    this._startbanlist.dispatch();
                    break;
                }
                case RoomCallbackMethodNames.TOPIC:
                {
                    this._topic.dispatch(new RoomCallbackTopicArguments(param2));
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
