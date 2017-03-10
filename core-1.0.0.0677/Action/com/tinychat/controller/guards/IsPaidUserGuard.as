package com.tinychat.controller.guards
{
    import com.tinychat.model.business.*;
    import com.tinychat.model.room.*;

    public class IsPaidUserGuard extends AbstractRoomSettingsGuard
    {

        public function IsPaidUserGuard(param1:RoomSettingsProxy)
        {
            super(param1);
            return;
        }// end function

        override public function approve() : Boolean
        {
            return Roles.inRoleAndMore(settings.pro, Roles.PRO);
        }// end function

        public function get getRole() : uint
        {
            return settings.pro;
        }// end function

    }
}
