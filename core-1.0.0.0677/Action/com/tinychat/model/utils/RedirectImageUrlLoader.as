package com.tinychat.model.utils
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class RedirectImageUrlLoader extends Object implements ImageUrlLoader
    {
        private var urlLoader:URLLoader;
        private var bytesLoader:Loader;
        private var _loaded:Signal;
        private var _isLoaded:Boolean;
        private var isLoading:Boolean;

        public function RedirectImageUrlLoader()
        {
            this._loaded = new Signal(DisplayObject);
            return;
        }// end function

        public function get picture() : DisplayObject
        {
            return this.bytesLoader;
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
            if (!this.isLoading)
            {
                this.isLoading = true;
                this.urlLoader = new URLLoader(new URLRequest(param1));
                this.urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
                this.addUrlLoaderListeners();
            }
            return;
        }// end function

        private function urlLoaderCompleteHandler(event:Event) : void
        {
            this.removeUrlLoaderListeners();
            this.bytesLoader = new Loader();
            this.bytesLoader.loadBytes(this.urlLoader.data);
            this.addBytesLoaderListeners();
            return;
        }// end function

        private function bytesLoaderCompleteHandler(event:Event) : void
        {
            this.removeBytesLoaderListeners();
            this._isLoaded = true;
            this.isLoading = false;
            this._loaded.dispatch(this.bytesLoader);
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            this.isLoading = false;
            this.removeUrlLoaderListeners();
            if (this.bytesLoader)
            {
                this.removeBytesLoaderListeners();
            }
            return;
        }// end function

        private function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            this.isLoading = false;
            this.removeUrlLoaderListeners();
            if (this.bytesLoader)
            {
                this.removeBytesLoaderListeners();
            }
            return;
        }// end function

        private function addUrlLoaderListeners() : void
        {
            this.urlLoader.addEventListener(Event.COMPLETE, this.urlLoaderCompleteHandler);
            this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

        private function removeUrlLoaderListeners() : void
        {
            this.urlLoader.removeEventListener(Event.COMPLETE, this.urlLoaderCompleteHandler);
            this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

        private function addBytesLoaderListeners() : void
        {
            this.bytesLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.bytesLoaderCompleteHandler);
            this.bytesLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.bytesLoader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

        private function removeBytesLoaderListeners() : void
        {
            this.bytesLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.bytesLoaderCompleteHandler);
            this.bytesLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.bytesLoader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

    }
}
