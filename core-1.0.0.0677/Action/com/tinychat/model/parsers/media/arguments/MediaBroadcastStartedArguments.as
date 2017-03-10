package com.tinychat.model.parsers.media.arguments
{
    import com.tinychat.model.api.*;

    public class MediaBroadcastStartedArguments extends AbstractMediaBroadcastArguments
    {
        private var _mediaId:String;
        private var _currentTime:Number;

        public function MediaBroadcastStartedArguments(param1:String, param2:UserIdentity, param3:String, param4:Number)
        {
            super(param1, param2);
            this._mediaId = param3;
            this._currentTime = param4;
            return;
        }// end function

        public function get mediaId() : String
        {
            return this._mediaId;
        }// end function

        public function get currentTime() : Number
        {
            return this._currentTime;
        }// end function

    }
}
