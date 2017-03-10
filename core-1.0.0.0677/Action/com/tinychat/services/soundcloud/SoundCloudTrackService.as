package com.tinychat.services.soundcloud
{
    import com.tinychat.model.soundcloud.*;
    import org.osflash.signals.*;

    public class SoundCloudTrackService extends AbstractSoundCloudService implements SingleMediaService
    {
        private var id:String;
        private var _success:Signal;

        public function SoundCloudTrackService(param1:String)
        {
            super(param1);
            this._success = new Signal(SoundCloudTrack);
            return;
        }// end function

        public function load(param1:String) : void
        {
            this.id = param1;
            submit(param1);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function finish(param1) : void
        {
            var _loc_2:* = param1 as SoundCloudTracks;
            if (_loc_2.tracks)
            {
            }
            if (_loc_2.tracks.length > 0)
            {
                this._success.dispatch(_loc_2.tracks[0]);
            }
            else
            {
                failureHandler("Failed to load track data for id=" + this.id + ".");
            }
            return;
        }// end function

    }
}
