package com.tinychat.ui.components.preloader
{
    import flash.events.*;

    public class PupilPreloader extends TinychatPreloader
    {
        private var loader:EmbeddedSwfLoader;
        private var swfLoaded:Boolean;
        private var initialized:Boolean;
        private static var _instance:PupilPreloader;
        private static const PupilPreloaderBytes:Class = PupilPreloader_PupilPreloaderBytes;

        public function PupilPreloader()
        {
            _instance = this;
            this.loader = new EmbeddedSwfLoader(new PupilPreloaderBytes());
            this.loader.addEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            return;
        }// end function

        public function complete() : void
        {
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            this.initialized = true;
            this.layoutSwf();
            return;
        }// end function

        private function layoutSwf() : void
        {
            if (this.initialized && this.swfLoaded)
            {
                this.loader.x = Math.abs(stageWidth - this.loader.width) / 2;
                this.loader.y = Math.abs(stageHeight - 300) / 2;
                addChild(this.loader);
                textDisplay.x = this.loader.x + (this.loader.width - textDisplay.width) / 2;
                textDisplay.y = this.loader.y + this.loader.height + 65;
                message = "Loading...";
            }
            return;
        }// end function

        private function loaderCompleteHandler(event:Event) : void
        {
            this.loader.removeEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            this.swfLoaded = true;
            this.layoutSwf();
            return;
        }// end function

        public static function get instance() : PupilPreloader
        {
            if (!_instance)
            {
                _instance = new PupilPreloader;
            }
            return _instance;
        }// end function

    }
}
