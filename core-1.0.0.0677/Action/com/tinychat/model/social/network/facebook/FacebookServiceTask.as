package com.tinychat.model.social.network.facebook
{
    import com.tinychat.services.social.network.facebook.*;
    import nl.dpdk.commands.tasks.*;

    public class FacebookServiceTask extends Task
    {
        private var service:AbstractFacebookService;
        private var load:Function;
        private var params:Array;

        public function FacebookServiceTask(param1:AbstractFacebookService, param2:Function, ... args)
        {
            this.service = param1;
            this.load = param2;
            this.params = args;
            return;
        }// end function

        override protected function executeTaskHook() : void
        {
            this.addServiceListeneres();
            this.load.apply(null, this.params);
            return;
        }// end function

        protected function successHandler(param1:Object) : void
        {
            this.removeServiceListeneres();
            done();
            return;
        }// end function

        protected function failureHandler(param1:Object) : void
        {
            this.removeServiceListeneres();
            fail(param1 ? (param1.toString()) : (""));
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
