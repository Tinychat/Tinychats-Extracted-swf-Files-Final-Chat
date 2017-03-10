package com.tinychat.model.invite.twitter
{
    import com.tinychat.model.room.*;

    public class TwitterInviteTemplates extends Object
    {
        private var roomInfo:RoomSettingsProxy;
        private var userCount:RoomUserCount;

        public function TwitterInviteTemplates(param1:RoomSettingsProxy, param2:RoomUserCount)
        {
            this.roomInfo = param1;
            this.userCount = param2;
            return;
        }// end function

        public function generate() : String
        {
            return "Hanging out in a group video chat room, come say hey. " + this.roomInfo.url + " #tinychat";
        }// end function

    }
}
