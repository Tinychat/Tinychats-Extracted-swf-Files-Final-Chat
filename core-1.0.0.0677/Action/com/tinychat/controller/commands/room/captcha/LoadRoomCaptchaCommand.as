package com.tinychat.controller.commands.room.captcha
{
    import com.tinychat.model.social.chat.captcha.*;
    import com.tinychat.services.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadRoomCaptchaCommand extends AsyncCommand
    {
        public var service:RoomCaptchaService;
        public var captcha:RoomCaptcha;

        public function LoadRoomCaptchaCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.service.load().then(this.successHandler).then(null, this.errorHandler);
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            this.captcha.update(param1.need_to_solve_captcha, param1.token, param1.url);
            if (this.captcha.key == "1")
            {
                this.captcha.prompt(this.detectHandler);
                return;
            }
            dispatchComplete(true);
            return;
        }// end function

        private function errorHandler(param1:Object) : void
        {
            this.captcha.update("");
            dispatchComplete(true);
            return;
        }// end function

        private function detectHandler() : void
        {
            dispatchComplete(true);
            return;
        }// end function

    }
}
