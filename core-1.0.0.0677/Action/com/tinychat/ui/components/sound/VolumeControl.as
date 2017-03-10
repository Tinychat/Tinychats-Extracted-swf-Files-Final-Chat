package com.tinychat.ui.components.sound
{
    import flash.events.*;
    import mx.events.*;
    import spark.components.supportClasses.*;

    public class VolumeControl extends SkinnableComponent
    {
        public var volumeSlider:SliderBase;
        public var muteButton:MuteButton;
        private var hovered:Boolean;
        private var muteButtonDown:Boolean;
        private static const STATE_NORMAL:String = "normal";
        private static const STATE_OVER:String = "over";
        private static const STATE_DOWN:String = "down";
        private static var _skinParts:Object = {volumeSlider:true, muteButton:true};

        public function VolumeControl()
        {
            addEventListener(MouseEvent.ROLL_OVER, this.rollOverHandler);
            addEventListener(MouseEvent.ROLL_OUT, this.rollOutHandler);
            return;
        }// end function

        public function get value() : Number
        {
            return this.volumeSlider ? (this.volumeSlider.value) : (0);
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.muteButton)
            {
                this.muteButton.buttonUp.add(this.buttonUpHandler);
                this.muteButton.addEventListener(FlexEvent.BUTTON_DOWN, this.buttonDownHandler);
            }
            else if (param2 == this.volumeSlider)
            {
                this.volumeSlider.addEventListener(FlexEvent.VALUE_COMMIT, this.sliderValueCommitHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.muteButton)
            {
                this.muteButton.buttonUp.remove(this.buttonUpHandler);
                this.muteButton.removeEventListener(FlexEvent.BUTTON_DOWN, this.buttonDownHandler);
            }
            else if (param2 == this.volumeSlider)
            {
                this.volumeSlider.removeEventListener(FlexEvent.VALUE_COMMIT, this.sliderValueCommitHandler);
            }
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (this.muteButtonDown)
            {
            }
            if (this.hovered)
            {
                return STATE_DOWN;
            }
            if (this.hovered)
            {
                return STATE_OVER;
            }
            return STATE_NORMAL;
        }// end function

        private function buttonUpHandler() : void
        {
            this.muteButtonDown = false;
            invalidateSkinState();
            return;
        }// end function

        private function buttonDownHandler(event:FlexEvent) : void
        {
            this.muteButtonDown = true;
            invalidateSkinState();
            return;
        }// end function

        private function sliderValueCommitHandler(event:FlexEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        private function rollOverHandler(event:MouseEvent) : void
        {
            this.hovered = true;
            this.muteButton.forceHovered = this.hovered;
            invalidateSkinState();
            return;
        }// end function

        private function rollOutHandler(event:MouseEvent) : void
        {
            this.hovered = false;
            this.muteButton.forceHovered = this.hovered;
            invalidateSkinState();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
