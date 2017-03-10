package com.tinychat.model.youtube
{
    import com.tinychat.model.sounds.*;
    import com.tinychat.vendors.youtube.*;

    public class YouTubePlayerVolumeControl extends AbstractVolumeControl implements MasterSoundControllable
    {
        private var player:YouTubePlayer;
        private var _masterVolume:Number;
        private var premutedVolume:Number;

        public function YouTubePlayerVolumeControl(param1:YouTubePlayer)
        {
            this.player = param1;
            this._masterVolume = 1;
            return;
        }// end function

        public function get masterVolume() : Number
        {
            return this._masterVolume;
        }// end function

        public function set masterVolume(param1:Number) : void
        {
            if (this._masterVolume != param1)
            {
                this._masterVolume = normalizeVolumeValue(param1);
                this.updateVolume();
            }
            return;
        }// end function

        public function refresh() : void
        {
            this.updateVolume();
            return;
        }// end function

        override protected function updateVolume() : void
        {
            this.player.volume = volume * this._masterVolume;
            return;
        }// end function

    }
}
