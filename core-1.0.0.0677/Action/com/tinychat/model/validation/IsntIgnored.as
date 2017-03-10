package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class IsntIgnored extends Object implements IdentityValidation
    {
        private var users:RoomUsers;

        public function IsntIgnored(param1:RoomUsers)
        {
            this.users = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            if (this.users.has(param1))
            {
                this.users.has(param1);
            }
            return !this.users.userFromId(param1).ignored;
        }// end function

    }
}
