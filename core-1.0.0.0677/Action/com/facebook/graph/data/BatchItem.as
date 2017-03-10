package com.facebook.graph.data
{

    public class BatchItem extends Object
    {
        public var relativeURL:String;
        public var callback:Function;
        public var params:Object;
        public var requestMethod:String;

        public function BatchItem(relativeURL:String, callback:Function = null, params = null, requestMethod:String = "GET")
        {
            this.relativeURL = relativeURL;
            this.callback = callback;
            this.params = params;
            this.requestMethod = requestMethod;
            return;
        }// end function

    }
}
