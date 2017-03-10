package com.tinychat.services.soundcloud
{
    import __AS3__.vec.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.soundcloud.*;
    import com.tinychat.services.*;

    public class AbstractSoundCloudService extends AbstractJsonLoaderService
    {
        public var javascript:ApplicationJavascript;
        private var query:String;

        public function AbstractSoundCloudService(param1:String)
        {
            super(param1);
            return;
        }// end function

        protected function submit(param1:String) : void
        {
            this.query = param1;
            this.javascript.registerTracksSoundCloud.addOnce(this.successHandler);
            var _loc_2:Object = {filter:"streamable", order:"hotness", limit:25};
            if (this.query != "")
            {
                if (isNaN(Number(this.query)))
                {
                    _loc_2.q = this.query;
                }
                else
                {
                    _loc_2.ids = this.query;
                }
            }
            this.javascript.getTracksSoundCloud(_loc_2);
            return;
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            var result:*;
            var data:* = param1;
            try
            {
                result = this.parse(data as Array);
            }
            catch (error:Error)
            {
                failureHandler(error.message);
                return;
            }
            finish(result);
            return;
        }// end function

        override protected function parse(param1:Object)
        {
            var _loc_3:Object = null;
            var _loc_2:* = new Vector.<SoundCloudTrack>;
            for each (_loc_3 in param1)
            {
                
                if (_loc_3 != null)
                {
                    _loc_2.push(new SoundCloudTrack(_loc_3.id, _loc_3.title, _loc_3.artwork_url, _loc_3.description));
                }
            }
            return new SoundCloudTracks(_loc_2);
        }// end function

    }
}
