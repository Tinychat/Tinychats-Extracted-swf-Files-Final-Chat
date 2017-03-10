package com.tinychat.model.guards.media
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.validation.media.*;

    public class IsMediaModeratorGuard extends AbstractOperatorGuard
    {
        private var isMediaModerator:IsMediaModerator;

        public function IsMediaModeratorGuard(param1:RoomUsers, param2:IsMediaModerator)
        {
            this.isMediaModerator = param2;
            super(param1);
            return;
        }// end function

        override public function approve() : Boolean
        {
            if (users.currentUser)
            {
            }
            return this.isMediaModerator.isValid(users.currentUser);
        }// end function

    }
}
