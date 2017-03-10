package com.tinychat.controller.guards
{
    import com.tinychat.model.room.*;

    public class IsTinychatUserGuard extends Object implements IGuard
    {
        private var settings:RoomSettingsProxy;

        public function IsTinychatUserGuard(param1:RoomSettingsProxy)
        {
            this.settings = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.settings.account != "";
        }// end function

    }
}
