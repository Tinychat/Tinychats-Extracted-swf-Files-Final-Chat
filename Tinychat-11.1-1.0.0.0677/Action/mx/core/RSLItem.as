package mx.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import mx.events.*;
    import mx.utils.*;

    public class RSLItem extends Object
    {
        public var urlRequest:URLRequest;
        public var total:uint = 0;
        public var loaded:uint = 0;
        public var rootURL:String;
        protected var chainedProgressHandler:Function;
        protected var chainedCompleteHandler:Function;
        protected var chainedIOErrorHandler:Function;
        protected var chainedSecurityErrorHandler:Function;
        protected var chainedRSLErrorHandler:Function;
        private var completed:Boolean = false;
        private var errorText:String;
        protected var moduleFactory:IFlexModuleFactory;
        protected var url:String;
        static const VERSION:String = "4.6.0.23201";

        public function RSLItem(param1:String, param2:String = null, param3:IFlexModuleFactory = null)
        {
            this.url = param1;
            this.rootURL = param2;
            this.moduleFactory = param3;
            return;
        }// end function

        public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
        {
            this.chainedProgressHandler = param1;
            this.chainedCompleteHandler = param2;
            this.chainedIOErrorHandler = param3;
            this.chainedSecurityErrorHandler = param4;
            this.chainedRSLErrorHandler = param5;
            var _loc_6:* = new Loader();
            var _loc_7:* = new LoaderContext();
            this.urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(this.rootURL, this.url));
            _loc_6.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.itemProgressHandler);
            _loc_6.contentLoaderInfo.addEventListener(Event.COMPLETE, this.itemCompleteHandler);
            _loc_6.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.itemErrorHandler);
            _loc_6.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.itemErrorHandler);
            if (this.moduleFactory != null)
            {
                _loc_7.applicationDomain = this.moduleFactory.info()["currentDomain"];
            }
            else
            {
                _loc_7.applicationDomain = ApplicationDomain.currentDomain;
            }
            _loc_6.load(this.urlRequest, _loc_7);
            return;
        }// end function

        public function itemProgressHandler(event:ProgressEvent) : void
        {
            this.loaded = event.bytesLoaded;
            this.total = event.bytesTotal;
            if (this.chainedProgressHandler != null)
            {
                this.chainedProgressHandler(event);
            }
            return;
        }// end function

        public function itemCompleteHandler(event:Event) : void
        {
            this.completed = true;
            if (this.chainedCompleteHandler != null)
            {
                this.chainedCompleteHandler(event);
            }
            return;
        }// end function

        public function itemErrorHandler(event:ErrorEvent) : void
        {
            this.errorText = decodeURI(event.text);
            this.completed = true;
            this.loaded = 0;
            this.total = 0;
            trace(this.errorText);
            if (event.type == IOErrorEvent.IO_ERROR && this.chainedIOErrorHandler != null)
            {
                this.chainedIOErrorHandler(event);
            }
            else if (event.type == SecurityErrorEvent.SECURITY_ERROR && this.chainedSecurityErrorHandler != null)
            {
                this.chainedSecurityErrorHandler(event);
            }
            else if (event.type == RSLEvent.RSL_ERROR && this.chainedRSLErrorHandler != null)
            {
                this.chainedRSLErrorHandler(event);
            }
            return;
        }// end function

    }
}
