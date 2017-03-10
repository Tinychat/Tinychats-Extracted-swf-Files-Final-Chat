package com.tinychat.services
{
    import com.tinychat.model.utils.url.*;
    import com.tinychat.services.signals.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.net.*;
    import org.osflash.signals.*;

    public class AbstractUrlLoaderService extends Object implements AsyncService
    {
        private var loader:URLLoader;
        private var baseUrl:String;
        private var _failed:Failed;
        private var dynamicPaths:Array;
        private var urlParameters:Object;
        private var isLoading:Boolean;

        public function AbstractUrlLoaderService(param1:String)
        {
            this.baseUrl = param1;
            this.loader = new URLLoader();
            this._failed = new Failed();
            return;
        }// end function

        public function get success() : ISignal
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function get failure() : ISignal
        {
            return this._failed;
        }// end function

        protected function makeGetRequest(param1:Boolean = true, param2:Boolean = true) : void
        {
            var _loc_3:URLRequest = null;
            var _loc_5:URLVariables = null;
            this.cleanUpPreviousLoad();
            var _loc_4:* = this.createUrl(param2);
            if (param1)
            {
            }
            if (_loc_4.parameters.length > 0)
            {
                _loc_5 = new URLVariables(_loc_4.parameters.toString());
                _loc_3 = new URLRequest(_loc_4.base + _loc_4.path);
                _loc_3.data = _loc_5;
            }
            else
            {
                _loc_3 = new URLRequest(_loc_4.toString());
            }
            _loc_3.method = URLRequestMethod.GET;
            this.loadRequest(_loc_3);
            return;
        }// end function

        protected function makePostRequest(param1:Object = null, param2:String = null) : void
        {
            var _loc_3:URLRequest = null;
            this.cleanUpPreviousLoad();
            var _loc_4:* = this.createUrl(false);
            _loc_3 = new URLRequest(_loc_4.toString());
            _loc_3.method = URLRequestMethod.POST;
            _loc_3.data = param1;
            if (param2)
            {
                _loc_3.contentType = param2;
            }
            this.loadRequest(_loc_3);
            return;
        }// end function

        protected function makeDeleteRequest() : void
        {
            var _loc_1:URLRequest = null;
            this.cleanUpPreviousLoad();
            var _loc_2:* = this.createUrl(false);
            _loc_1 = new URLRequest(_loc_2.toString());
            _loc_1.method = URLRequestMethod.POST;
            _loc_1.data = "dummy";
            _loc_1.requestHeaders = [new URLRequestHeader("X-HTTP-Method-Override", "DELETE")];
            this.loadRequest(_loc_1);
            return;
        }// end function

        protected function successHandler(param1:Object) : void
        {
            return;
        }// end function

        protected function failureHandler(param1:String) : void
        {
            this.dispatchFailure(param1);
            return;
        }// end function

        protected function dispatchFailure(param1:String) : void
        {
            this._failed.dispatch(param1);
            return;
        }// end function

        protected function setDynamicPaths(... args) : void
        {
            this.dynamicPaths = args;
            return;
        }// end function

        protected function setUrlParameters(param1:Object) : void
        {
            this.urlParameters = param1;
            return;
        }// end function

        private function createUrl(param1:Boolean) : Url
        {
            var _loc_2:* = new Url(this.baseUrl, param1);
            _loc_2.addPaths.call(null, this.dynamicPaths);
            _loc_2.parameters.concat(this.urlParameters);
            return _loc_2;
        }// end function

        private function loadRequest(param1:URLRequest) : void
        {
            this.isLoading = true;
            this.addLoaderListeners();
            this.loader.load(param1);
            return;
        }// end function

        private function completeHandler(event:Event) : void
        {
            this.cleanUpPreviousLoad();
            this.successHandler(this.loader.data);
            return;
        }// end function

        private function cleanUpPreviousLoad() : void
        {
            if (this.isLoading)
            {
                this.removeLoaderListeners();
                try
                {
                    this.loader.close();
                }
                catch (error:Error)
                {
                }
                this.isLoading = false;
            }
            return;
        }// end function

        private function ioErrorHandler(event:IOErrorEvent) : void
        {
            this.cleanUpPreviousLoad();
            this.failureHandler(event.text);
            return;
        }// end function

        private function securityErrorHandler(event:SecurityErrorEvent) : void
        {
            this.cleanUpPreviousLoad();
            this.failureHandler(event.text);
            return;
        }// end function

        private function addLoaderListeners() : void
        {
            this.loader.addEventListener(Event.COMPLETE, this.completeHandler);
            this.loader.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

        private function removeLoaderListeners() : void
        {
            this.loader.removeEventListener(Event.COMPLETE, this.completeHandler);
            this.loader.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
            return;
        }// end function

    }
}
