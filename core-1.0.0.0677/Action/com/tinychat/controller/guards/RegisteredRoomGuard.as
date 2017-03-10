package com.tinychat.controller.guards
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;

    public class RegisteredRoomGuard extends Object implements IGuard
    {
        public var roomInfo:RoomSettingsProxy;

        public function RegisteredRoomGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            return this.roomInfo.type == RoomType.SHOW;
        }// end function

    }
}
