package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookLoadFriendsCommand extends AsyncCommand
    {
        public var service:FacebookFriendsInfoService;

        public function FacebookLoadFriendsCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.addServiceHandlers();
            this.service.load();
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            dispatchComplete(true);
            return;
        }// end function

        private function failureHandler(param1:Object) : void
        {
            dispatchComplete(false);
            return;
        }// end function

        private function addServiceHandlers() : void
        {
            this.service.success.addOnce(this.successHandler);
            this.service.failure.addOnce(this.failureHandler);
            return;
        }// end function

        private function removeServiceHandlers() : void
        {
            this.service.success.remove(this.successHandler);
            this.service.failure.remove(this.failureHandler);
            return;
        }// end function

    }
}
