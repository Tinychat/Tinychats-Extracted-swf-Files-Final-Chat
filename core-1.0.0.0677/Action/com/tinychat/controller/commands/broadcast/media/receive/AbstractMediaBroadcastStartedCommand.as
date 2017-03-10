package com.tinychat.controller.commands.broadcast.media.receive
{
    import com.tinychat.controller.commands.broadcast.media.notifications.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.media.*;
    import com.tinychat.model.parsers.media.arguments.*;
    import com.tinychat.model.soundcloud.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.services.media.*;
    import com.tinychat.services.soundcloud.*;
    import com.tinychat.services.youtube.*;

    public class AbstractMediaBroadcastStartedCommand extends AbstractReceivedMediaBroadcastCommand
    {
        private var args:MediaBroadcastStartedArguments;
        private var startPaused:Boolean;
        private var type:MediaType;
        private var service:SingleMediaService;
        private var media:Media;

        public function AbstractMediaBroadcastStartedCommand(param1:MediaBroadcastStartedArguments, param2:Boolean)
        {
            this.args = param1;
            this.startPaused = param2;
            super(param1);
            return;
        }// end function

        override protected function performAction() : void
        {
            if (broadcasts is YouTubeBroadcasts)
            {
                this.service = injector.getInstance(YouTubeClipService);
                this.type = MediaType.YOUTUBE;
                this.media = new YouTubeClip(this.args.mediaId, "", "", "");
            }
            else if (broadcasts is SoundCloudBroadcasts)
            {
                this.service = injector.getInstance(SoundCloudTrackService);
                this.type = MediaType.SOUNDCLOUD;
                this.media = new SoundCloudTrack(this.args.mediaId, "", "", "");
            }
            if (this.service)
            {
                this.addServiceListeners();
                this.service.load(this.args.mediaId);
            }
            return;
        }// end function

        private function finish() : void
        {
            var _loc_1:StartMediaNotification = null;
            if (this.media)
            {
                _loc_1 = new StartMediaNotification(this.type, this.media.title);
                postChat.dispatch(_loc_1.create(), sender);
                broadcasts.start(this.media, this.args.currentTime, sender, this.startPaused);
            }
            return;
        }// end function

        private function serviceSuccessHandler(param1:Media) : void
        {
            this.media = param1;
            this.finish();
            this.removeServiceListeners();
            return;
        }// end function

        private function serviceFailureHandler(param1:String) : void
        {
            this.finish();
            this.removeServiceListeners();
            return;
        }// end function

        private function addServiceListeners() : void
        {
            this.service.success.addOnce(this.serviceSuccessHandler);
            this.service.failure.addOnce(this.serviceFailureHandler);
            return;
        }// end function

        private function removeServiceListeners() : void
        {
            this.service.success.remove(this.serviceSuccessHandler);
            this.service.failure.remove(this.serviceFailureHandler);
            return;
        }// end function

    }
}
