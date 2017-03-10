package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.room.*;

    public class AbstractRoomSettingsGuard extends AbstractLiveGuard
    {
        protected var settings:RoomSettingsProxy;

        public function AbstractRoomSettingsGuard(param1:RoomSettingsProxy)
        {
            this.settings = param1;
            return;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.settings.roomInfoChanged.add(this.roomInfoChangedListener);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.settings.roomInfoChanged.remove(this.roomInfoChangedListener);
            return;
        }// end function

        private function roomInfoChangedListener() : void
        {
            triggerChange();
            return;
        }// end function

    }
}
