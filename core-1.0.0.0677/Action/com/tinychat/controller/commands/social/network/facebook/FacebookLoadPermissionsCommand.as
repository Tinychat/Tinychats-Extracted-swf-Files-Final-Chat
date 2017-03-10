package com.tinychat.controller.commands.social.network.facebook
{
    import com.tinychat.controller.commands.utils.*;
    import com.tinychat.model.social.network.facebook.*;

    public class FacebookLoadPermissionsCommand extends AsyncTimeoutCommand
    {
        private var permissions:FacebookPermissions;

        public function FacebookLoadPermissionsCommand(param1:FacebookPermissions, param2:Number = 0)
        {
            super(param2);
            this.permissions = param1;
            return;
        }// end function

        override public function execute() : void
        {
            super.execute();
            this.permissions.loaded.addOnce(this.loadedHandler);
            this.permissions.load();
            return;
        }// end function

        override protected function timeoutHandler() : void
        {
            super.timeoutHandler();
            this.permissions.loaded.remove(this.loadedHandler);
            return;
        }// end function

        private function loadedHandler(param1:Object) : void
        {
            dispatchComplete(true);
            return;
        }// end function

    }
}
