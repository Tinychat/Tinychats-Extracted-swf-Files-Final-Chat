package com.tinychat.controller.guards
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class IsntCurrentUserGuard extends Object implements IGuard
    {
        public var user:UserIdentity;
        public var usersProxy:RoomUsers;

        public function IsntCurrentUserGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            return !this.usersProxy.isCurrentUser(this.user);
        }// end function

    }
}
