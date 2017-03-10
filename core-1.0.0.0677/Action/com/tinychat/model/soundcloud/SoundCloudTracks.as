package com.tinychat.model.soundcloud
{
    import __AS3__.vec.*;

    public class SoundCloudTracks extends Object
    {
        private var _tracks:Vector.<SoundCloudTrack>;

        public function SoundCloudTracks(param1:Vector.<SoundCloudTrack>)
        {
            this._tracks = param1;
            return;
        }// end function

        public function get tracks() : Vector.<SoundCloudTrack>
        {
            return this._tracks;
        }// end function

    }
}
