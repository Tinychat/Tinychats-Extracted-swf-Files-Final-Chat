package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.user.*;

    public class IsOperatorGuard extends AbstractOperatorGuard
    {

        public function IsOperatorGuard(param1:RoomUsers)
        {
            super(param1);
            return;
        }// end function

        override public function approve() : Boolean
        {
            if (users.currentUser)
            {
            }
            return users.currentUser.operator;
        }// end function

    }
}
