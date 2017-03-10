package com.tinychat.services.chat.tinychat
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.chat.*;

    public class TinychatPublicGiftNoticeService extends NoticeServiceBase
    {
        private var connection:RoomConnection;
        private var users:RoomUsers;

        public function TinychatPublicGiftNoticeService(param1:RoomConnection, param2:RoomUsers)
        {
            this.connection = param1;
            this.users = param2;
            param1.gift.add(this.nickHandler);
            return;
        }// end function

        private function nickHandler(param1:RoomCallbackGiftArguments) : void
        {
            var _loc_2:* = this.users.userFromId(param1.fromID);
            var _loc_3:* = this.users.userFromId(param1.toID);
            var _loc_4:* = _loc_3 != null ? (_loc_3.name) : (param1.toName);
            var _loc_5:* = "sent " + param1.giftName + " to " + _loc_4 + "!";
            if (_loc_2 == null)
            {
                _loc_4 = param1.isIncognito ? ("Anonymous") : (param1.fromName);
                dispatchReceived(new AbstractGiftMessage(_loc_4 + " " + _loc_5, 0, param1.giftUrl, param1.comment), null);
            }
            else
            {
                dispatchReceived(new AbstractGiftUserMessage(_loc_2, _loc_5, 0, param1.giftUrl, param1.comment), null);
            }
            return;
        }// end function

    }
}
