package com.tinychat.model.sounds
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.guards.*;
    import org.osflash.signals.*;

    public class MicrophoneMode extends Object
    {
        private var flashCookie:FlashCookieProxy;
        private var forcedPush2Talk:ForcedPush2TalkGuard;
        private var currentUser:User;
        private var _pushToTalk:Boolean;
        private var _pushToTalkChanged:Signal;

        public function MicrophoneMode(param1:FlashCookieProxy, param2:ForcedPush2TalkGuard)
        {
            this.flashCookie = param1;
            this.forcedPush2Talk = param2;
            param2.addChangeListener(this.forcedPush2TalkChanged);
            this._pushToTalk = param2.approve() ? (true) : (param1.pushToTalkToggled);
            this._pushToTalkChanged = new Signal(Boolean);
            return;
        }// end function

        public function get pushToTalkChanged() : ISignal
        {
            return this._pushToTalkChanged;
        }// end function

        public function get pushToTalk() : Boolean
        {
            return this._pushToTalk;
        }// end function

        public function set pushToTalk(param1:Boolean) : void
        {
            if (!this.forcedPush2Talk.approve())
            {
            }
            if (this._pushToTalk != param1)
            {
                this.flashCookie.pushToTalkToggled = param1;
                this.updatePush2Talk(param1);
            }
            return;
        }// end function

        private function forcedPush2TalkChanged(param1:Boolean) : void
        {
            if (param1)
            {
                this.updatePush2Talk(param1);
            }
            return;
        }// end function

        private function updatePush2Talk(param1:Boolean) : void
        {
            this._pushToTalk = param1;
            this._pushToTalkChanged.dispatch(param1);
            return;
        }// end function

    }
}
