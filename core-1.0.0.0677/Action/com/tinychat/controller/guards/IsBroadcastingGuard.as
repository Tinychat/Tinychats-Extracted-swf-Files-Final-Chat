package com.tinychat.controller.guards
{
    import com.tinychat.model.broadcast.room.*;

    public class IsBroadcastingGuard extends AbstractBroadcastingGuard
    {

        public function IsBroadcastingGuard(param1:RoomCameraBroadcasts)
        {
            super(param1);
            return;
        }// end function

        override public function approve() : Boolean
        {
            return broadcasts.isBroadcasting;
        }// end function

    }
}
