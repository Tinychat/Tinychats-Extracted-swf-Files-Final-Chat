package com.facebook.graph.net
{
    import com.adobe.images.*;
    import com.adobe.serialization.json.*;
    import com.facebook.graph.utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;

    public class AbstractFacebookRequest extends Object
    {
        protected var urlLoader:URLLoader;
        protected var urlRequest:URLRequest;
        protected var _rawResult:String;
        protected var _data:Object;
        protected var _success:Boolean;
        protected var _url:String;
        protected var _requestMethod:String;
        protected var _callback:Function;

        public function AbstractFacebookRequest() : void
        {
            return;
        }// end function

        public function get rawResult() : String
        {
            return this._rawResult;
        }// end function

        public function get success() : Boolean
        {
            return this._success;
        }// end function

        public function get data() : Object
        {
            return this._data;
        }// end function

        public function callURL(callback:Function, url:String = "", locale:String = null) : void
        {
            var _loc_4:URLVariables = null;
            this._callback = callback;
            this.urlRequest = new URLRequest(url.length ? (url) : (this._url));
            if (locale)
            {
                _loc_4 = new URLVariables();
                _loc_4.locale = locale;
                this.urlRequest.data = _loc_4;
            }
            this.loadURLLoader();
            return;
        }// end function

        public function set successCallback(value:Function) : void
        {
            this._callback = value;
            return;
        }// end function

        protected function isValueFile(value:Object) : Boolean
        {
            if (!(value is FileReference))
            {
            }
            if (!(value is Bitmap))
            {
            }
            if (!(value is BitmapData))
            {
            }
            return value is ByteArray;
        }// end function

        protected function objectToURLVariables(values:Object) : URLVariables
        {
            var _loc_3:String = null;
            var _loc_2:* = new URLVariables();
            if (values == null)
            {
                return _loc_2;
            }
            for (_loc_3 in values)
            {
                
                _loc_2[_loc_3] = values[_loc_3];
            }
            return _loc_2;
        }// end function

        public function close() : void
        {
            if (this.urlLoader != null)
            {
                this.urlLoader.removeEventListener(Event.COMPLETE, this.handleURLLoaderComplete);
                this.urlLoader.removeEventListener(IOErrorEvent.IO_ERROR, this.handleURLLoaderIOError);
                this.urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.handleURLLoaderSecurityError);
                try
                {
                    this.urlLoader.close();
                }
                catch (e)
                {
                }
                this.urlLoader = null;
            }
            return;
        }// end function

        protected function loadURLLoader() : void
        {
            this.urlLoader = new URLLoader();
            this.urlLoader.addEventListener(Event.COMPLETE, this.handleURLLoaderComplete, false, 0, false);
            this.urlLoader.addEventListener(IOErrorEvent.IO_ERROR, this.handleURLLoaderIOError, false, 0, true);
            this.urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.handleURLLoaderSecurityError, false, 0, true);
            this.urlLoader.load(this.urlRequest);
            return;
        }// end function

        protected function handleURLLoaderComplete(event:Event) : void
        {
            this.handleDataLoad(this.urlLoader.data);
            return;
        }// end function

        protected function handleDataLoad(result:Object, dispatchCompleteEvent:Boolean = true) : void
        {
            var result:* = result;
            var dispatchCompleteEvent:* = dispatchCompleteEvent;
            this._rawResult = result as String;
            this._success = true;
            try
            {
                this._data = JSON.decode(this._rawResult);
            }
            catch (e)
            {
                _data = _rawResult;
                _success = false;
            }
            this.handleDataReady();
            if (dispatchCompleteEvent)
            {
                this.dispatchComplete();
            }
            return;
        }// end function

        protected function handleDataReady() : void
        {
            return;
        }// end function

        protected function dispatchComplete() : void
        {
            if (this._callback != null)
            {
                this._callback(this);
            }
            this.close();
            return;
        }// end function

        protected function handleURLLoaderIOError(event:IOErrorEvent) : void
        {
            var event:* = event;
            this._success = false;
            this._rawResult = (event.target as URLLoader).data;
            if (this._rawResult != "")
            {
                try
                {
                    this._data = JSON.decode(this._rawResult);
                }
                catch (e)
                {
                    _data = {type:"Exception", message:_rawResult};
                }
            }
            else
            {
                this._data = event;
            }
            this.dispatchComplete();
            return;
        }// end function

        protected function handleURLLoaderSecurityError(event:SecurityErrorEvent) : void
        {
            var event:* = event;
            this._success = false;
            this._rawResult = (event.target as URLLoader).data;
            try
            {
                this._data = JSON.decode((event.target as URLLoader).data);
            }
            catch (e)
            {
                _data = event;
            }
            this.dispatchComplete();
            return;
        }// end function

        protected function extractFileData(values:Object) : Object
        {
            var _loc_2:Object = null;
            var _loc_3:String = null;
            if (values == null)
            {
                return null;
            }
            if (this.isValueFile(values))
            {
                _loc_2 = values;
            }
            else if (values != null)
            {
                for (_loc_3 in values)
                {
                    
                    if (this.isValueFile(values[_loc_3]))
                    {
                        _loc_2 = values[_loc_3];
                        delete values[_loc_3];
                        break;
                    }
                }
            }
            return _loc_2;
        }// end function

        protected function createUploadFileRequest(fileData:Object, values:Object = null) : PostRequest
        {
            var _loc_4:String = null;
            var _loc_5:ByteArray = null;
            var _loc_3:* = new PostRequest();
            if (values)
            {
                for (_loc_4 in values)
                {
                    
                    _loc_3.writePostData(_loc_4, values[_loc_4]);
                }
            }
            if (fileData is Bitmap)
            {
                fileData = (fileData as Bitmap).bitmapData;
            }
            if (fileData is ByteArray)
            {
                _loc_3.writeFileData(values.fileName, fileData as ByteArray, values.contentType);
            }
            else if (fileData is BitmapData)
            {
                _loc_5 = PNGEncoder.encode(fileData as BitmapData);
                _loc_3.writeFileData(values.fileName, _loc_5, "image/png");
            }
            _loc_3.close();
            this.urlRequest.contentType = "multipart/form-data; boundary=" + _loc_3.boundary;
            return _loc_3;
        }// end function

        public function toString() : String
        {
            return this.urlRequest.url + (this.urlRequest.data == null ? ("") : ("?" + unescape(this.urlRequest.data.toString())));
        }// end function

    }
}
