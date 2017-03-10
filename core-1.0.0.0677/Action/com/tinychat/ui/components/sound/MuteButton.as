package com.tinychat.ui.components.sound
{
    import com.tinychat.ui.components.spark.*;
    import org.osflash.signals.*;

    public class MuteButton extends IconToggleButton
    {
        private var _forceHovered:Boolean;
        private var _buttonUp:Signal;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function MuteButton()
        {
            this._buttonUp = new Signal();
            return;
        }// end function

        public function get buttonUp() : ISignal
        {
            return this._buttonUp;
        }// end function

        public function set forceHovered(param1:Boolean) : void
        {
            if (this._forceHovered != param1)
            {
                this._forceHovered = param1;
                invalidateSkinState();
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this._forceHovered)
            {
            }
            if (!mouseCaptured)
            {
                if (selected)
                {
                    return "overAndSelected";
                }
                return "over";
            }
            else
            {
                return super.getCurrentSkinState();
            }
        }// end function

        override protected function buttonReleased() : void
        {
            super.buttonReleased();
            this._buttonUp.dispatch();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
