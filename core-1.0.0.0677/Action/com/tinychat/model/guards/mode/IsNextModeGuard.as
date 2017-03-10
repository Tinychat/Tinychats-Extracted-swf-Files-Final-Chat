package com.tinychat.model.guards.mode
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;

    public class IsNextModeGuard extends Object implements IGuard
    {
        private var settings:RoomSettings;

        public function IsNextModeGuard(param1:RoomSettings)
        {
            this.settings = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.settings.type == RoomType.GROUP;
        }// end function

    }
}
