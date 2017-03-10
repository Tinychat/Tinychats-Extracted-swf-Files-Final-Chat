package com.tinychat.controller.guards
{
    import com.tinychat.model.user.*;

    public class IsOnlyUserInRoomGuard extends Object implements IGuard
    {
        public var usersProxy:RoomUsers;

        public function IsOnlyUserInRoomGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.usersProxy.all.length == 1;
        }// end function

    }
}
