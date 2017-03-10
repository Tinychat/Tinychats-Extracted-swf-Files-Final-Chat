package com.tinychat.controller.guards
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;

    public class DefaultRoomGuard extends Object implements IGuard
    {
        public var roomInfo:RoomSettingsProxy;

        public function DefaultRoomGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            if (this.roomInfo)
            {
            }
            return this.roomInfo.type == RoomType.DEFAULT;
        }// end function

    }
}
