package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.room.*;

    public class IsFacebookRoomGuard extends AbstractLiveGuard
    {
        private var settings:RoomSettingsProxy;

        public function IsFacebookRoomGuard(param1:RoomSettingsProxy)
        {
            this.settings = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            return this.settings.namespace == "facebook";
        }// end function

        override protected function enableChangeListening() : void
        {
            this.settings.roomInfoChanged.add(this.roomInfoChangedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.settings.roomInfoChanged.remove(this.roomInfoChangedHandler);
            return;
        }// end function

        private function roomInfoChangedHandler() : void
        {
            triggerChange();
            return;
        }// end function

    }
}
