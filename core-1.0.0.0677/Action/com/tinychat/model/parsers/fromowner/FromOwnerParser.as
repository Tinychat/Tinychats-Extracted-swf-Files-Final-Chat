package com.tinychat.model.parsers.fromowner
{
    import com.tinychat.model.parsers.fromowner.arguments.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import org.osflash.signals.*;

    public class FromOwnerParser extends Object
    {
        private var connection:ConnectionCallbackReceiver;
        private var _notice:Signal;
        private var _close:Signal;
        private var _mute:Signal;
        private var _push2talk:Signal;

        public function FromOwnerParser(param1:ConnectionCallbackReceiver)
        {
            this.connection = param1;
            this._notice = new Signal(FromOwnerNoticeArguments);
            this._close = new Signal(FromOwnerCloseArguments);
            this._mute = new Signal();
            this._push2talk = new Signal();
            param1.from_owner.add(this.fromOwnerHandler);
            return;
        }// end function

        public function get notice() : ISignal
        {
            return this._notice;
        }// end function

        public function get close() : ISignal
        {
            return this._close;
        }// end function

        public function get mute() : ISignal
        {
            return this._mute;
        }// end function

        public function get push2talk() : ISignal
        {
            return this._push2talk;
        }// end function

        private function fromOwnerHandler(param1:RoomCallbackFromOwnerArguments) : void
        {
            if (param1.command.indexOf("_close") == 0)
            {
                this._close.dispatch(new FromOwnerCloseArguments(param1.command));
            }
            else if (param1.command.indexOf("notice") == 0)
            {
                this._notice.dispatch(new FromOwnerNoticeArguments(param1.command));
            }
            else
            {
                switch(param1.command)
                {
                    case "mute":
                    {
                        this._mute.dispatch();
                        break;
                    }
                    case "push2talk":
                    {
                        this._push2talk.dispatch();
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
