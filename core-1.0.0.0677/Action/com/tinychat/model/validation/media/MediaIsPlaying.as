package com.tinychat.model.validation.media
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;

    public class MediaIsPlaying extends Object implements IdentityValidation
    {
        private var broadcasts:MediaBroadcasts;

        public function MediaIsPlaying(param1:MediaBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            var _loc_2:* = this.broadcasts.get(param1) as MediaBroadcast;
            if (_loc_2)
            {
            }
            return _loc_2.isPlaying;
        }// end function

    }
}
