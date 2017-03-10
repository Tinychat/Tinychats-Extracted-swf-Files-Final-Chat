package com.tinychat.controller.commands.room.captcha
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadChatCaptchaCommand extends AsyncCommand
    {
        public var service:ChatCaptchaService;
        public var settings:RoomSettingsProxy;
        public var users:RoomUsers;
        public var captcha:ChatCaptcha;

        public function LoadChatCaptchaCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.users.currentUser.id;
            var _loc_2:* = this.settings.namespace;
            var _loc_3:* = this.settings.name;
            this.captcha.guestId = _loc_1;
            this.service.load(_loc_1, _loc_3, _loc_2).then(this.successHandler).then(null, this.errorHandler);
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            if (!param1.key)
            {
            }
            this.captcha.key = "";
            dispatchComplete(true);
            return;
        }// end function

        private function errorHandler(param1:Object) : void
        {
            this.captcha.key = "";
            dispatchComplete(true);
            return;
        }// end function

    }
}
