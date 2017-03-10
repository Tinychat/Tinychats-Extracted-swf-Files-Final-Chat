package com.tinychat.services.youtube
{
    import __AS3__.vec.*;
    import com.tinychat.model.youtube.*;
    import org.osflash.signals.*;

    public class YouTubeClipService extends AbstractYouTubeService implements SingleMediaService
    {
        private var id:String;
        private var _success:Signal;

        public function YouTubeClipService(param1:String)
        {
            this._success = new Signal(YouTubeClip);
            super(param1);
            return;
        }// end function

        public function load(param1:String) : void
        {
            this.id = param1;
            setUrlParameters({part:"snippet", id:this.id, key:YouTubeServiceUrl.API_KEY});
            makeGetRequest();
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        override protected function finish(param1) : void
        {
            var _loc_2:* = param1 as Vector.<YouTubeClip>;
            if (_loc_2)
            {
            }
            if (_loc_2.length > 0)
            {
                this._success.dispatch(_loc_2[0]);
            }
            else
            {
                failureHandler("Failed to load clip data for id=" + this.id + ".");
            }
            return;
        }// end function

    }
}
