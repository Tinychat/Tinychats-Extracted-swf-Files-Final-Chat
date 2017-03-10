package com.tinychat.services.social.network.facebook
{
    import org.osflash.signals.*;

    public class AbstractFacebookService extends Object implements AsyncService
    {
        private var _success:Signal;
        private var _failure:Signal;

        public function AbstractFacebookService()
        {
            this._success = new Signal(Object);
            this._failure = new Signal(Object);
            return;
        }// end function

        public function get success() : ISignal
        {
            return this._success;
        }// end function

        public function get failure() : ISignal
        {
            return this._failure;
        }// end function

        protected function parseSuccess(param1:Object) : Object
        {
            return param1;
        }// end function

        protected function parseFailure(param1:Object) : Object
        {
            return param1;
        }// end function

        protected function resultHandler(param1:Object, param2:Object) : void
        {
            if (param1)
            {
                this.successHandler(param1);
            }
            else
            {
                this.failureHandler(param2);
            }
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            var _loc_2:* = this.parseSuccess(param1);
            this._success.dispatch(_loc_2);
            return;
        }// end function

        private function failureHandler(param1:Object) : void
        {
            var _loc_2:* = this.parseFailure(param1);
            this._failure.dispatch(_loc_2);
            return;
        }// end function

    }
}
