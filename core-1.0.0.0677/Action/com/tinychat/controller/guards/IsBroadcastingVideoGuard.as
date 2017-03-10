package com.tinychat.controller.guards
{
    import com.tinychat.model.broadcast.room.*;

    public class IsBroadcastingVideoGuard extends AbstractBroadcastingGuard
    {

        public function IsBroadcastingVideoGuard(param1:RoomCameraBroadcasts)
        {
            super(param1);
            return;
        }// end function

        override public function approve() : Boolean
        {
            return broadcasts.isBroadcastingVideo;
        }// end function

    }
}
