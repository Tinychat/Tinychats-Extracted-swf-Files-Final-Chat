package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class StreamListItem extends Object implements StreamingVideoAttachable, Named
    {
        private var broadcast:StreamBroadcast;

        public function StreamListItem(param1:StreamBroadcast)
        {
            this.broadcast = param1;
            return;
        }// end function

        public function get name() : String
        {
            return this.broadcast.name;
        }// end function

        public function attachToVideo(param1:StreamingVideoElement) : void
        {
            this.broadcast.attachToVideo(param1);
            return;
        }// end function

    }
}
