package com.tinychat.ui.components.preloader
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;
    import mx.core.*;
    import mx.events.*;

    public class TinychatPreloader extends Sprite implements IPreloaderDisplay
    {
        protected var _preloader:Sprite;
        protected var textDisplay:TextField;
        private var _stageWidth:Number;
        private var _stageHeight:Number;
        private var rslsStarted:Boolean;
        private var rslsCompleted:Boolean;

        public function TinychatPreloader()
        {
            return;
        }// end function

        public function get backgroundAlpha() : Number
        {
            return 1;
        }// end function

        public function set backgroundAlpha(param1:Number) : void
        {
            return;
        }// end function

        public function get backgroundColor() : uint
        {
            return 0;
        }// end function

        public function set backgroundColor(param1:uint) : void
        {
            return;
        }// end function

        public function get backgroundImage() : Object
        {
            return null;
        }// end function

        public function set backgroundImage(param1:Object) : void
        {
            return;
        }// end function

        public function get backgroundSize() : String
        {
            return "auto";
        }// end function

        public function set backgroundSize(param1:String) : void
        {
            return;
        }// end function

        public function get stageWidth() : Number
        {
            return this._stageWidth;
        }// end function

        public function set stageWidth(param1:Number) : void
        {
            this._stageWidth = param1;
            return;
        }// end function

        public function get stageHeight() : Number
        {
            return this._stageHeight;
        }// end function

        public function set stageHeight(param1:Number) : void
        {
            this._stageHeight = param1;
            return;
        }// end function

        public function set preloader(param1:Sprite) : void
        {
            this._preloader = param1;
            param1.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
            param1.addEventListener(RSLEvent.RSL_PROGRESS, this.rslProgressHandler);
            param1.addEventListener(RSLEvent.RSL_COMPLETE, this.rslCompleteHandler);
            param1.addEventListener(RSLEvent.RSL_ERROR, this.rslErrorHandler);
            return;
        }// end function

        public function initialize() : void
        {
            this.createMessageDisplay();
            return;
        }// end function

        protected function set message(param1:String) : void
        {
            this.textDisplay.text = param1;
            return;
        }// end function

        private function rslProgressHandler(event:RSLEvent) : void
        {
            this.rslsStarted = true;
            this.message = "Loading RSL " + event.rslIndex + "/" + event.rslTotal + ": " + this.getPercentageLoadedStringFromProgressEvent(event);
            return;
        }// end function

        private function rslCompleteHandler(event:RSLEvent) : void
        {
            var _loc_2:Class = null;
            this.rslsCompleted = true;
            try
            {
                _loc_2 = Class(getDefinitionByName("com.tinychat.ui.tooltip.TinychatToolTipManager"));
                Singleton.registerClass("mx.managers::IToolTipManager2", _loc_2);
            }
            catch (error:Error)
            {
            }
            return;
        }// end function

        private function progressHandler(event:ProgressEvent) : void
        {
            if (!this.rslsStarted || this.rslsCompleted)
            {
                this.message = "Loading application " + ": " + this.getPercentageLoadedStringFromProgressEvent(event);
            }
            return;
        }// end function

        private function rslErrorHandler(event:RSLEvent) : void
        {
            this.message = event.errorText;
            return;
        }// end function

        private function createMessageDisplay() : void
        {
            this.textDisplay = TextFieldFactory.newInstance();
            addChild(this.textDisplay);
            return;
        }// end function

        private function getPercentageLoadedStringFromProgressEvent(event:ProgressEvent) : String
        {
            return Math.round(event.bytesLoaded / event.bytesTotal * 100).toString() + "%";
        }// end function

    }
}
