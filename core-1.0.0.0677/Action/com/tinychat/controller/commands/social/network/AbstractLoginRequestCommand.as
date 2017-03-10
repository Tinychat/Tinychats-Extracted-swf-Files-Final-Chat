package com.tinychat.controller.commands.social.network
{
    import com.tinychat.model.social.network.*;
    import org.robotlegs.utilities.macrobot.*;

    public class AbstractLoginRequestCommand extends AsyncCommand
    {
        private var loginProxy:SocialNetworkProxy;
        private var args:Object;

        public function AbstractLoginRequestCommand(param1:SocialNetworkProxy, param2:Object)
        {
            this.loginProxy = param1;
            this.args = param2;
            return;
        }// end function

        override public function execute() : void
        {
            if (this.loginProxy.isLoggedIn)
            {
                dispatchComplete(true);
            }
            else
            {
                this.addProxyListeners();
                this.loginProxy.login(this.args);
            }
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.removeProxyListeners();
            dispatchComplete(true);
            return;
        }// end function

        private function loginFailureHandler(param1:String) : void
        {
            this.removeProxyListeners();
            dispatchComplete(false);
            return;
        }// end function

        private function addProxyListeners() : void
        {
            this.loginProxy.loggedIn.addOnce(this.loggedInHandler);
            this.loginProxy.loginFailure.addOnce(this.loginFailureHandler);
            return;
        }// end function

        private function removeProxyListeners() : void
        {
            this.loginProxy.loggedIn.remove(this.loggedInHandler);
            this.loginProxy.loginFailure.remove(this.loginFailureHandler);
            return;
        }// end function

    }
}
