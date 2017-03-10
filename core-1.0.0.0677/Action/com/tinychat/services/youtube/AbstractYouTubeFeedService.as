package com.tinychat.services.youtube
{
    import __AS3__.vec.*;
    import com.tinychat.model.youtube.*;
    import org.osflash.signals.*;

    public class AbstractYouTubeFeedService extends AbstractYouTubeService
    {
        private var title:String;
        private var _success:Signal;

        public function AbstractYouTubeFeedService(param1:String, param2:String)
        {
            this.title = param2;
            this._success = new Signal(YouTubeFeed);
            super(param1);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        protected function createFeed(param1:String, param2:Vector.<YouTubeClip>) : YouTubeFeed
        {
            return new YouTubeFeed(param1, param2);
        }// end function

        override protected function finish(param1) : void
        {
            var _loc_2:* = this.createFeed(this.title, param1);
            this._success.dispatch(_loc_2);
            return;
        }// end function

    }
}
