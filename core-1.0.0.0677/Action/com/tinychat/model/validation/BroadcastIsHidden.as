package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.validation.broadcast.*;

    public class BroadcastIsHidden extends IsBroadcaster
    {

        public function BroadcastIsHidden(param1:Broadcasts)
        {
            super(param1);
            return;
        }// end function

        override public function isValid(param1:Identity) : Boolean
        {
            var _loc_2:* = broadcasts.get(param1) as Hideable;
            if (super.isValid(param1))
            {
                super.isValid(param1);
            }
            if (_loc_2)
            {
            }
            return _loc_2.isHidden;
        }// end function

    }
}
