package com.tinychat.model.validation.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class IsntCurrentUser extends Object implements IdentityValidation
    {
        private var users:RoomUsers;

        public function IsntCurrentUser(param1:RoomUsers)
        {
            this.users = param1;
            return;
        }// end function

        public function isValid(param1:Identity) : Boolean
        {
            return this.users.currentUser.id != param1.id;
        }// end function

    }
}
