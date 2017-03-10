package com.tinychat.model.parsers.media.arguments
{
    import com.tinychat.model.api.*;

    public class MediaBroadcastSoughtArguments extends AbstractMediaBroadcastArguments
    {
        private var value:String;

        public function MediaBroadcastSoughtArguments(param1:String, param2:UserIdentity, param3:String)
        {
            super(param1, param2);
            this.value = param3;
            return;
        }// end function

        public function get currentTime() : Number
        {
            return Number(this.value);
        }// end function

    }
}
