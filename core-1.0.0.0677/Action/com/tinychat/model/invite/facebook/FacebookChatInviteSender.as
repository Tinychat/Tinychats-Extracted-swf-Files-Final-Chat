package com.tinychat.model.invite.facebook
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.chat.facebook.*;

    public class FacebookChatInviteSender extends Object
    {
        private var service:FacebookChatService;
        private var info:RoomSettings;

        public function FacebookChatInviteSender(param1:FacebookChatService, param2:RoomSettings)
        {
            this.service = param1;
            this.info = param2;
            return;
        }// end function

        public function send(param1:String, param2:Vector.<RenameableUser>) : void
        {
            var _loc_3:RenameableUser = null;
            param1 = param1 + (" " + this.info.url + "?fb");
            for each (_loc_3 in param2)
            {
                
                this.service.send(param1, _loc_3);
            }
            return;
        }// end function

    }
}
