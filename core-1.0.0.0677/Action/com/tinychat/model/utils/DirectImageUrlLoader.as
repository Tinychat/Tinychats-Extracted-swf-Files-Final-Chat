package com.tinychat.model.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import org.osflash.signals.*;

    public class DirectImageUrlLoader extends Object implements ImageUrlLoader
    {
        private var loader:Loader;
        private var _loaded:Signal;
        private var _isLoaded:Boolean;
        private var isLoading:Boolean;

        public function DirectImageUrlLoader()
        {
            this.loader = new Loader();
            this._loaded = new Signal(DisplayObject);
            return;
        }// end function

        public function get picture() : DisplayObject
        {
            return this.loader;
        }// end function

        public function get loaded() : ISignal
        {
            return this._loaded;
        }// end function

        public function get isLoaded() : Boolean
        {
            return this._isLoaded;
        }// end function

        public function load(param1:String) : void
        {
            var _loc_2:LoaderContext = null;
            if (param1)
            {
            }
            if (!this.isLoading)
            {
                _loc_2 = new LoaderContext(true);
                this.isLoading = true;
                this.addLoaderListeners();
                this.loader.load(new URLRequest(param1), _loc_2);
            }
            return;
        }// end function

        public function unload() : void
        {
            this.loader.unload();
            return;
        }// end function

        private function loaderCompleteHandler(event:Event) : void
        {
            var _loc_2:Object = null;
            try
            {
                _loc_2 = this.loader.content;
                this._isLoaded = true;
                this._loaded.dispatch(this.loader.content);
            }
            catch (error:Error)
            {
            }
            this.isLoading = false;
            this.removeLoaderListeners();
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            this.isLoading = false;
            this.removeLoaderListeners();
            return;
        }// end function

        private function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            this.isLoading = false;
            this.removeLoaderListeners();
            return;
        }// end function

        private function addLoaderListeners() : void
        {
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

        private function removeLoaderListeners() : void
        {
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loaderCompleteHandler);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

    }
}
