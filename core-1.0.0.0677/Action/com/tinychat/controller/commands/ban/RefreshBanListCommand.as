package com.tinychat.controller.commands.ban
{
    import com.tinychat.model.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class RefreshBanListCommand extends AsyncCommand
    {
        public var banList:BanListProxy;

        public function RefreshBanListCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.banList.loaded.addOnce(this.loadedHandler);
            this.banList.load();
            return;
        }// end function

        private function loadedHandler() : void
        {
            dispatchComplete(true);
            return;
        }// end function

    }
}
