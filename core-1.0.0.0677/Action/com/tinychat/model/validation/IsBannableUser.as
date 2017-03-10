package com.tinychat.model.validation
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;

    public class IsBannableUser extends Object
    {
        private var isRoomOwner:IsRoomOwnerGuard;

        public function IsBannableUser(param1:IsRoomOwnerGuard)
        {
            this.isRoomOwner = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            var _loc_2:* = param1 as RestrictedUser;
            if (_loc_2)
            {
                if (_loc_2.operator)
                {
                }
            }
            return this.isRoomOwner.approve();
        }// end function

    }
}
