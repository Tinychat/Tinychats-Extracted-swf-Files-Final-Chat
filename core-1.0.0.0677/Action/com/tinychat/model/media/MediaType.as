package com.tinychat.model.media
{
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.youtube.*;

    public class MediaType extends Object
    {
        private var _value:String;
        private static const valueLookup:Object = {};
        public static const SOUNDCLOUD:MediaType = new MediaType(SOUNDCLOUD, "soundCloud");
        public static const YOUTUBE:MediaType = new MediaType(YOUTUBE, "youTube");

        public function MediaType(param1:MediaType, param2:String)
        {
            this._value = param2;
            valueLookup[param2] = this;
            return;
        }// end function

        public function toString() : String
        {
            return this._value;
        }// end function

        public static function fromValue(param1:String) : MediaType
        {
            return valueLookup[param1];
        }// end function

        public static function fromBroadcast(param1:MediaBroadcast) : MediaType
        {
            var _loc_2:MediaType = null;
            if (param1 is YouTubeBroadcast)
            {
                _loc_2 = MediaType.YOUTUBE;
            }
            else if (param1 is SoundCloudBroadcast)
            {
                _loc_2 = MediaType.SOUNDCLOUD;
            }
            return _loc_2;
        }// end function

    }
}
