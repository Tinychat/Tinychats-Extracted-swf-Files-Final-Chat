package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.room.*;

    public class MoreThanOneBroadcast extends Object implements IdentityValidation
    {
        protected var broadcasts:RoomBroadcastCanvasBroadcasts;

        public function MoreThanOneBroadcast(param1:RoomBroadcastCanvasBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return this.broadcasts.all.length > 1;
        }// end function

    }
}
