package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.chat.*;

    public class TinychatPublicUserNoticeService extends NoticeServiceBase
    {
        private var connection:RoomConnection;
        private var users:RoomUsers;

        public function TinychatPublicUserNoticeService(param1:RoomConnection, param2:RoomUsers)
        {
            this.connection = param1;
            this.users = param2;
            param2.added.add(this.addedHandler);
            param2.removed.add(this.removedHandler);
            param1.nick.add(this.nickHandler);
            return;
        }// end function

        private function addedHandler(param1:User) : void
        {
            dispatchReceived(new UserNoticeMessage(param1, "entered the room.", 0), null);
            return;
        }// end function

        private function removedHandler(param1:User) : void
        {
            dispatchReceived(new UserNoticeMessage(param1, "left the room.", 0), null);
            return;
        }// end function

        private function nickHandler(param1:RoomCallbackNickArguments) : void
        {
            dispatchReceived(new TimestampedMessage(param1.toUser().name + " changed nickname to " + param1.newName, 0), null);
            return;
        }// end function

    }
}
