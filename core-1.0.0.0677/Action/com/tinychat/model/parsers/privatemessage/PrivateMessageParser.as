package com.tinychat.model.parsers.privatemessage
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.parsers.media.signals.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.user.*;
    import org.osflash.signals.*;

    public class PrivateMessageParser extends Object
    {
        private var connection:ConnectionCallbackReceiver;
        private var users:RoomUsers;
        private var _allowBroadcast:Signal;
        private var _privateChat:Signal;
        private var _publicChat:Signal;
        private var _reported:Signal;
        private var _userinfo:Signal;
        private var _videoFilter:Signal;
        private var _mediaBroadcastClosed:MediaBroadcastClosed;
        private var _mediaBroadcastPaused:MediaBroadcastPaused;
        private var _mediaBroadcastPlayed:MediaBroadcastPlayed;
        private var _mediaBroadcastSought:MediaBroadcastSought;
        private var _mediaBroadcastStarted:MediaBroadcastStarted;
        private var _mediaBroadcastStartedPaused:MediaBroadcastStartedPaused;

        public function PrivateMessageParser(param1:ConnectionCallbackReceiver, param2:RoomUsers)
        {
            this.connection = param1;
            this.users = param2;
            this.connection.privmsg.add(this.privmsgHandler);
            this._allowBroadcast = new Signal(PrivateMessageAllowBroadcastArguments);
            this._privateChat = new Signal(PrivateMessageChatArguments);
            this._publicChat = new Signal(PrivateMessageChatArguments);
            this._reported = new Signal(PrivateMessageReportedArguments);
            this._userinfo = new Signal(PrivateMessageUserinfoArguments);
            this._videoFilter = new Signal(PrivateMessageVideoFilterArguments);
            this._mediaBroadcastClosed = new MediaBroadcastClosed();
            this._mediaBroadcastPaused = new MediaBroadcastPaused();
            this._mediaBroadcastPlayed = new MediaBroadcastPlayed();
            this._mediaBroadcastSought = new MediaBroadcastSought();
            this._mediaBroadcastStarted = new MediaBroadcastStarted();
            this._mediaBroadcastStartedPaused = new MediaBroadcastStartedPaused();
            return;
        }// end function

        public function get allowBroadcast() : ISignal
        {
            return this._allowBroadcast;
        }// end function

        public function get privateChat() : ISignal
        {
            return this._privateChat;
        }// end function

        public function get publicChat() : ISignal
        {
            return this._publicChat;
        }// end function

        public function get reported() : ISignal
        {
            return this._reported;
        }// end function

        public function get userinfo() : ISignal
        {
            return this._userinfo;
        }// end function

        public function get videoFilter() : ISignal
        {
            return this._videoFilter;
        }// end function

        public function get mediaBroadcastClosed() : ISignal
        {
            return this._mediaBroadcastClosed;
        }// end function

        public function get mediaBroadcastPaused() : ISignal
        {
            return this._mediaBroadcastPaused;
        }// end function

        public function get mediaBroadcastPlayed() : ISignal
        {
            return this._mediaBroadcastPlayed;
        }// end function

        public function get mediaBroadcastSought() : ISignal
        {
            return this._mediaBroadcastSought;
        }// end function

        public function get mediaBroadcastStarted() : ISignal
        {
            return this._mediaBroadcastStarted;
        }// end function

        public function get mediaBroadcastStartedPaused() : ISignal
        {
            return this._mediaBroadcastStartedPaused;
        }// end function

        private function privmsgHandler(param1:RoomCallbackPrivmsgArguments) : void
        {
            var _loc_2:* = UserInputMatcher.match(param1.message);
            var _loc_3:* = this.users.userFromName(param1.username);
            if (_loc_3)
            {
                switch(_loc_2.type)
                {
                    case UserAction.ALLOW_BROADCAST:
                    {
                        this._allowBroadcast.dispatch(new PrivateMessageAllowBroadcastArguments(_loc_3, _loc_2.args[0]));
                        break;
                    }
                    case UserAction.PRIVATE_CHAT:
                    {
                        if (_loc_2.args[0] == this.users.currentUser.name)
                        {
                            this._privateChat.dispatch(new PrivateMessageChatArguments(_loc_3, param1.color, _loc_2.args[1]));
                        }
                        break;
                    }
                    case UserAction.PUBLIC_CHAT:
                    {
                        this._publicChat.dispatch(new PrivateMessageChatArguments(_loc_3, param1.color, param1.message));
                        break;
                    }
                    case UserAction.REPORTED:
                    {
                        this._reported.dispatch(new PrivateMessageReportedArguments(_loc_3));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_CLOSED:
                    {
                        this._mediaBroadcastClosed.dispatch(new MediaBroadcastClosedArguments(_loc_2.args[0], _loc_3));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_PAUSED:
                    {
                        this._mediaBroadcastPaused.dispatch(new MediaBroadcastPausedArguments(_loc_2.args[0], _loc_3));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_PLAYED:
                    {
                        this._mediaBroadcastPlayed.dispatch(new MediaBroadcastPlayedArguments(_loc_2.args[0], _loc_3, _loc_2.args[1]));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_SOUGHT:
                    {
                        this._mediaBroadcastSought.dispatch(new MediaBroadcastSoughtArguments(_loc_2.args[0], _loc_3, _loc_2.args[1]));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_STARTED:
                    {
                        this._mediaBroadcastStarted.dispatch(new MediaBroadcastStartedArguments(_loc_2.args[0], _loc_3, _loc_2.args[1], _loc_2.args[2]));
                        break;
                    }
                    case UserAction.MEDIA_BROADCAST_STARTED_PAUSED:
                    {
                        this._mediaBroadcastStartedPaused.dispatch(new MediaBroadcastStartedArguments(_loc_2.args[0], _loc_3, _loc_2.args[1], _loc_2.args[2]));
                        break;
                    }
                    case UserAction.USERINFO:
                    {
                        this._userinfo.dispatch(new PrivateMessageUserinfoArguments(_loc_3, _loc_2.args[0]));
                        break;
                    }
                    case UserAction.VIDEO_FILTER:
                    {
                        this._videoFilter.dispatch(new PrivateMessageVideoFilterArguments(_loc_3, _loc_2.args[0]));
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

    }
}
