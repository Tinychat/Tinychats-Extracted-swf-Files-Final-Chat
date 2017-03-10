package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.model.social.network.facebook.*;
    import org.robotlegs.utilities.macrobot.*;

    public class FacebookLoginCommand extends AsyncCommand
    {
        public var facebookProxy:FacebookLoginProxy;

        public function FacebookLoginCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.addListeners();
            this.facebookProxy.login({});
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.removeListeners();
            dispatchComplete(true);
            return;
        }// end function

        private function loggedOutHandler() : void
        {
            this.removeListeners();
            dispatchComplete(false);
            return;
        }// end function

        private function addListeners() : void
        {
            this.facebookProxy.loggedIn.addOnce(this.loggedInHandler);
            this.facebookProxy.loggedOut.addOnce(this.loggedOutHandler);
            return;
        }// end function

        private function removeListeners() : void
        {
            this.facebookProxy.loggedIn.remove(this.loggedInHandler);
            this.facebookProxy.loggedOut.remove(this.loggedOutHandler);
            return;
        }// end function

    }
}
