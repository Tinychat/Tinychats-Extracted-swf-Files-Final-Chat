package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.services.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookAsyncServiceCommand extends AsyncCommand
    {
        private var service:AsyncService;
        private var load:Function;
        private var params:Array;

        public function FacebookAsyncServiceCommand(param1:AsyncService, param2:Function, ... args)
        {
            this.service = param1;
            this.load = param2;
            this.params = args;
            return;
        }// end function

        override public function execute() : void
        {
            this.addServiceListeneres();
            this.load.apply(null, this.params);
            return;
        }// end function

        protected function successHandler(param1:Object) : void
        {
            this.removeServiceListeneres();
            dispatchComplete(true);
            return;
        }// end function

        protected function failureHandler(param1:Object) : void
        {
            this.removeServiceListeneres();
            dispatchComplete(false);
            return;
        }// end function

        private function addServiceListeneres() : void
        {
            this.service.success.add(this.successHandler);
            this.service.failure.add(this.failureHandler);
            return;
        }// end function

        private function removeServiceListeneres() : void
        {
            this.service.success.remove(this.successHandler);
            this.service.failure.remove(this.failureHandler);
            return;
        }// end function

    }
}
