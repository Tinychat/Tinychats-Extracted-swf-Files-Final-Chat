package com.tinychat.model.parsers.media.arguments
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.media.*;

    public class AbstractMediaBroadcastArguments extends Object
    {
        private var _sender:UserIdentity;
        private var _type:String;

        public function AbstractMediaBroadcastArguments(param1:String, param2:UserIdentity)
        {
            this._sender = param2;
            this._type = param1;
            return;
        }// end function

        public function get sender() : UserIdentity
        {
            return this._sender;
        }// end function

        public function get type() : MediaType
        {
            return MediaType.fromValue(this._type);
        }// end function

    }
}
