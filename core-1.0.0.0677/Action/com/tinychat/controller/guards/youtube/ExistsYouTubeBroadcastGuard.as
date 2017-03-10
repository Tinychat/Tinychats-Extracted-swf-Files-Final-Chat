package com.tinychat.controller.guards.youtube
{
    import com.tinychat.model.youtube.*;

    public class ExistsYouTubeBroadcastGuard extends Object implements IGuard
    {
        private var broadcasts:YouTubeBroadcasts;

        public function ExistsYouTubeBroadcastGuard(param1:YouTubeBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.broadcasts.currentBroadcast != null;
        }// end function

    }
}
