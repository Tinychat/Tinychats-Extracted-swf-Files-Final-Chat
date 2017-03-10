package com.tinychat.controller.commands.broadcast.media.youtube
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.youtube.*;
    import org.robotlegs.mvcs.*;

    public class YouTubeAutoPlayCommand extends Command
    {
        public var startMediaBroadcast:StartMediaBroadcast;
        public var flashvars:FlashvarsProxy;

        public function YouTubeAutoPlayCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_2:YouTubeClip = null;
            var _loc_1:* = this.flashvars.youtubeAutoPlay;
            if (_loc_1)
            {
                _loc_2 = new YouTubeClip(_loc_1.id, _loc_1.title, _loc_1.largeThumbnailUrl, _loc_1.thumbnailUrl);
                this.startMediaBroadcast.dispatch(_loc_2);
            }
            return;
        }// end function

    }
}
