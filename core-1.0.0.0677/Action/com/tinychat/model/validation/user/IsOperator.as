package com.tinychat.model.validation.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class IsOperator extends Object implements IdentityValidation
    {
        private var users:RoomUsers;

        public function IsOperator(param1:RoomUsers)
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
            return this.users.userFromId(param1).operator;
        }// end function

    }
}
