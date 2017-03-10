package com.tinychat.controller.commands.chat
{
    import com.tinychat.model.social.chat.links.*;
    import com.tinychat.services.chat.links.*;
    import org.robotlegs.mvcs.*;

    public class LoadLinkValidatorsCommand extends Command
    {
        public var whitelist:LinkWhitelist;
        public var blacklist:LinkBlacklist;
        public var service:LinkValidationService;

        public function LoadLinkValidatorsCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.addServiceListeners();
            this.service.load();
            return;
        }// end function

        private function successHandler(param1:Array, param2:Array) : void
        {
            this.whitelist.load(param1);
            this.blacklist.load(param2);
            this.removeServiceListeners();
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this.removeServiceListeners();
            return;
        }// end function

        private function addServiceListeners() : void
        {
            this.service.success.addOnce(this.successHandler);
            this.service.failure.addOnce(this.failureHandler);
            return;
        }// end function

        private function removeServiceListeners() : void
        {
            this.service.success.remove(this.successHandler);
            this.service.failure.remove(this.failureHandler);
            return;
        }// end function

    }
}
