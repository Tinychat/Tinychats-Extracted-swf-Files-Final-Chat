package com.tinychat.services.soundcloud
{
    import com.tinychat.model.soundcloud.*;
    import org.osflash.signals.*;

    public class SoundCloudTracksService extends AbstractSoundCloudService
    {
        private var _success:Signal;

        public function SoundCloudTracksService(param1:String)
        {
            super(param1);
            this._success = new Signal(SoundCloudTracks);
            return;
        }// end function

        public function load(param1:String) : void
        {
            submit(param1);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function finish(param1) : void
        {
            this._success.dispatch(param1);
            return;
        }// end function

    }
}
