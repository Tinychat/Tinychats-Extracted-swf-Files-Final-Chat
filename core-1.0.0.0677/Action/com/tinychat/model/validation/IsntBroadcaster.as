package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;

    public class IsntBroadcaster extends Object implements IdentityValidation
    {
        private var broadcasts:RoomBroadcastCanvasBroadcasts;

        public function IsntBroadcaster(param1:RoomBroadcastCanvasBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return !this.broadcasts.has(param1);
        }// end function

    }
}
