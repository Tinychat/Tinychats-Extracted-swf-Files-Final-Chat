package com.tinychat.controller.commands.broadcast.authorization
{
    import com.tinychat.model.authorization.*;
    import org.robotlegs.utilities.macrobot.*;

    public class BroadcastAuthorizationCommand extends AsyncCommand
    {
        private var broadcastAuthorization:BroadcastAuthorizationBase;

        public function BroadcastAuthorizationCommand(param1:BroadcastAuthorizationBase)
        {
            this.broadcastAuthorization = param1;
            return;
        }// end function

        override public function execute() : void
        {
            this.broadcastAuthorization.refreshed.addOnce(this.broadcastAuthorizationRefreshedHandler);
            this.broadcastAuthorization.refresh();
            return;
        }// end function

        private function broadcastAuthorizationRefreshedHandler() : void
        {
            dispatchComplete(true);
            return;
        }// end function

    }
}
