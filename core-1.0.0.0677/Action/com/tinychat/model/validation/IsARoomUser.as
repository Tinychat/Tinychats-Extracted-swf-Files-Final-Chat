package com.tinychat.model.validation
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class IsARoomUser extends Object implements IdentityValidation
    {
        private var users:RoomUsers;

        public function IsARoomUser(param1:RoomUsers)
        {
            this.users = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return this.users.has(param1);
        }// end function

    }
}
