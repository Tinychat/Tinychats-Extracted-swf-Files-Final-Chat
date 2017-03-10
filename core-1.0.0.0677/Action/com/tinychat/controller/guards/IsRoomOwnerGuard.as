package com.tinychat.controller.guards
{
    import com.tinychat.model.room.*;

    public class IsRoomOwnerGuard extends Object implements IGuard
    {
        private var settings:RoomSettingsProxy;

        public function IsRoomOwnerGuard(param1:RoomSettingsProxy)
        {
            this.settings = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.settings.isRoomOwner;
        }// end function

    }
}
