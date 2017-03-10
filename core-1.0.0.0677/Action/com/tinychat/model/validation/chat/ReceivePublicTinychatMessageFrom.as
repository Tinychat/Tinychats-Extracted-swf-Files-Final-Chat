package com.tinychat.model.validation.chat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class ReceivePublicTinychatMessageFrom extends Object implements IdentityValidation
    {
        private var users:RoomUsers;

        public function ReceivePublicTinychatMessageFrom(param1:RoomUsers)
        {
            this.users = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            var _loc_2:* = param1 as User;
            if (!_loc_2)
            {
            }
            if (this.users.has(param1))
            {
                _loc_2 = this.users.userFromId(param1);
            }
            if (_loc_2)
            {
            }
            if (!_loc_2.ignored)
            {
            }
            return _loc_2.isLoggedIn;
        }// end function

    }
}
