package com.tinychat.ui.components.application
{
    import com.tinychat.ui.components.login.*;
    import flash.events.*;
    import mx.core.*;
    import spark.components.supportClasses.*;

    public class ConnectingScreen extends SkinnableComponent
    {
        public var loadingIndicator:LoadingIndicator;
        public var textDisplay:IVisualElement;
        private var fadePending:Boolean;
        private static var _skinParts:Object = {textDisplay:true, loadingIndicator:true};

        public function ConnectingScreen()
        {
            return;
        }// end function

        public function fade() : void
        {
            if (this.loadingIndicator.isLoaded)
            {
                this.doFade();
            }
            else
            {
                this.fadePending = true;
            }
            return;
        }// end function

        public function start() : void
        {
            this.loadingIndicator.start();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.loadingIndicator)
            {
            }
            if (!this.loadingIndicator.isLoaded)
            {
                this.loadingIndicator.loaded.addOnce(this.loadingIndicatorLoadedHandler);
            }
            return;
        }// end function

        private function loadingIndicatorLoadedHandler() : void
        {
            if (this.fadePending)
            {
                this.doFade();
                this.fadePending = false;
            }
            return;
        }// end function

        private function doFade() : void
        {
            this.loadingIndicator.fadeCompleted.addOnce(this.fadeCompletedHandler);
            this.loadingIndicator.fade();
            this.textDisplay.alpha = 0;
            return;
        }// end function

        private function fadeCompletedHandler() : void
        {
            this.loadingIndicator.fadeCompleted.remove(this.fadeCompletedHandler);
            this.textDisplay.alpha = 1;
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
