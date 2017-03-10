package mx.core
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
    import mx.events.*;
    import mx.utils.*;

    public class CrossDomainRSLItem extends RSLItem
    {
        private var rsls:Array;
        private var urlIndex:int = 0;
        private var loadBytesLoader:Loader;
        static const VERSION:String = "4.6.0.23201";

        public function CrossDomainRSLItem(param1:Array, param2:String = null, param3:IFlexModuleFactory = null)
        {
            this.rsls = [];
            super(param1[0].rslURL, param2, param3);
            this.rsls = param1;
            return;
        }// end function

        private function get currentRSLData() : RSLData
        {
            return RSLData(this.rsls[this.urlIndex]);
        }// end function

        override public function load(param1:Function, param2:Function, param3:Function, param4:Function, param5:Function) : void
        {
            chainedProgressHandler = param1;
            chainedCompleteHandler = param2;
            chainedIOErrorHandler = param3;
            chainedSecurityErrorHandler = param4;
            chainedRSLErrorHandler = param5;
            var _loc_6:* = this.currentRSLData;
            urlRequest = new URLRequest(LoaderUtil.createAbsoluteURL(rootURL, _loc_6.rslURL));
            var _loc_7:* = new URLLoader();
            new URLLoader().dataFormat = URLLoaderDataFormat.BINARY;
            _loc_7.addEventListener(ProgressEvent.PROGRESS, itemProgressHandler);
            _loc_7.addEventListener(Event.COMPLETE, this.itemCompleteHandler);
            _loc_7.addEventListener(IOErrorEvent.IO_ERROR, this.itemErrorHandler);
            _loc_7.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.itemErrorHandler);
            if (_loc_6.policyFileURL != "")
            {
                Security.loadPolicyFile(_loc_6.policyFileURL);
            }
            if (_loc_6.isSigned)
            {
                urlRequest.digest = _loc_6.digest;
            }
            _loc_7.load(urlRequest);
            return;
        }// end function

        private function completeCdRslLoad(param1:URLLoader) : Boolean
        {
            var _loc_4:Boolean = false;
            var _loc_5:String = null;
            var _loc_6:Boolean = false;
            var _loc_7:ErrorEvent = null;
            if (param1 == null || param1.data == null || ByteArray(param1.data).bytesAvailable == 0)
            {
                return true;
            }
            this.loadBytesLoader = new Loader();
            var _loc_2:* = new LoaderContext();
            var _loc_3:* = this.currentRSLData;
            if (_loc_3.moduleFactory)
            {
                _loc_2.applicationDomain = _loc_3.moduleFactory.info()["currentDomain"];
            }
            else if (moduleFactory)
            {
                _loc_2.applicationDomain = moduleFactory.info()["currentDomain"];
            }
            else
            {
                _loc_2.applicationDomain = ApplicationDomain.currentDomain;
            }
            _loc_2.securityDomain = null;
            _loc_2.allowCodeImport = true;
            if (_loc_3.digest != null && _loc_3.verifyDigest)
            {
                _loc_4 = false;
                if (!_loc_3.isSigned)
                {
                    if (_loc_3.hashType == SHA256.TYPE_ID)
                    {
                        _loc_5 = null;
                        if (param1.data != null)
                        {
                            _loc_5 = SHA256.computeDigest(param1.data);
                        }
                        if (_loc_5 == _loc_3.digest)
                        {
                            _loc_4 = true;
                        }
                    }
                }
                else
                {
                    _loc_4 = true;
                }
                if (!_loc_4)
                {
                    _loc_6 = this.hasFailover();
                    _loc_7 = new ErrorEvent(RSLEvent.RSL_ERROR);
                    _loc_7.text = "Flex Error #1001: Digest mismatch with RSL " + urlRequest.url + ". Redeploy the matching RSL or relink your application with the matching library.";
                    this.itemErrorHandler(_loc_7);
                    return !_loc_6;
                }
            }
            this.loadBytesLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loadBytesCompleteHandler);
            this.loadBytesLoader.loadBytes(param1.data, _loc_2);
            return true;
        }// end function

        public function hasFailover() : Boolean
        {
            return this.rsls.length > (this.urlIndex + 1);
        }// end function

        public function loadFailover() : void
        {
            if (this.urlIndex < this.rsls.length)
            {
                trace("Failed to load RSL " + this.currentRSLData.rslURL);
                trace("Failing over to RSL " + RSLData(this.rsls[(this.urlIndex + 1)]).rslURL);
                var _loc_1:String = this;
                var _loc_2:* = this.urlIndex + 1;
                _loc_1.urlIndex = _loc_2;
                url = this.currentRSLData.rslURL;
                this.load(chainedProgressHandler, chainedCompleteHandler, chainedIOErrorHandler, chainedSecurityErrorHandler, chainedRSLErrorHandler);
            }
            return;
        }// end function

        override public function itemCompleteHandler(event:Event) : void
        {
            this.completeCdRslLoad(event.target as URLLoader);
            return;
        }// end function

        override public function itemErrorHandler(event:ErrorEvent) : void
        {
            if (this.hasFailover())
            {
                trace(decodeURI(event.text));
                this.loadFailover();
            }
            else
            {
                super.itemErrorHandler(event);
            }
            return;
        }// end function

        private function loadBytesCompleteHandler(event:Event) : void
        {
            this.loadBytesLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loadBytesCompleteHandler);
            this.loadBytesLoader = null;
            super.itemCompleteHandler(event);
            return;
        }// end function

    }
}
