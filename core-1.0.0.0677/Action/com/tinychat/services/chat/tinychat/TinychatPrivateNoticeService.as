package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.chat.*;

    public class TinychatPrivateNoticeService extends NoticeServiceBase
    {
        private var usersProxy:RoomUsers;

        public function TinychatPrivateNoticeService(param1:RoomUsers)
        {
            this.usersProxy = param1;
            param1.removed.add(this.userRemovedHandler);
            return;
        }// end function

        public function userRemovedHandler(param1:RenameableUser) : void
        {
            dispatchReceived(new TimestampedMessage(param1.name + " has left the chat.", 0), param1);
            return;
        }// end function

    }
}
