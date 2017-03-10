package com.tinychat.model.sounds
{
    import com.tinychat.model.api.*;
    import org.osflash.signals.*;

    public class ChatSoundEffect extends Object
    {
        private var soundEffect:SoundEffect;
        private var applicationVolume:MasterSoundControl;
        private var _enabled:Boolean;
        private var _enabledChanged:Signal;

        public function ChatSoundEffect(param1:SoundEffect, param2:MasterSoundControl)
        {
            this.soundEffect = param1;
            this.applicationVolume = param2;
            this._enabledChanged = new Signal(Boolean);
            return;
        }// end function

        public function get enabled() : Boolean
        {
            return this._enabled;
        }// end function

        public function set enabled(param1:Boolean) : void
        {
            this._enabled = param1;
            this._enabledChanged.dispatch(param1);
            return;
        }// end function

        public function get enabledChanged() : ISignal
        {
            return this._enabledChanged;
        }// end function

        public function play() : void
        {
            if (this.enabled)
            {
                this.soundEffect.play(this.applicationVolume.createSoundTransform());
            }
            return;
        }// end function

    }
}
