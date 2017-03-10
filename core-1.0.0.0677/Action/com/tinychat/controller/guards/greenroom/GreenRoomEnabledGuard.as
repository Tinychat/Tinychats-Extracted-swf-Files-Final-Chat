package com.tinychat.controller.guards.greenroom
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.room.*;

    public class GreenRoomEnabledGuard extends AbstractLiveGuard
    {
        private var settings:RoomSettingsProxy;

        public function GreenRoomEnabledGuard(param1:RoomSettingsProxy)
        {
            this.settings = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            return this.settings.greenRoomEnabled;
        }// end function

        override public function addChangeListener(param1:Function) : void
        {
            this.settings.roomInfoChanged.add(this.roomInfoChangedHandler);
            return;
        }// end function

        override public function removeChangeListener(param1:Function) : void
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
