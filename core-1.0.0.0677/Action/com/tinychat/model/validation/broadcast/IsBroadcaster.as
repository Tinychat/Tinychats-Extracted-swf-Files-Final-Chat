package com.tinychat.model.validation.broadcast
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;

    public class IsBroadcaster extends Object implements IdentityValidation
    {
        protected var broadcasts:Broadcasts;

        public function IsBroadcaster(param1:Broadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return this.broadcasts.has(param1);
        }// end function

    }
}
