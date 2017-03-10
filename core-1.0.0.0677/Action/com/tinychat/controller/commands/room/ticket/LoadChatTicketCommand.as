package com.tinychat.controller.commands.room.ticket
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadChatTicketCommand extends AsyncCommand
    {
        public var service:ChatTicketService;
        public var flashvars:FlashvarsProxy;
        public var settings:RoomSettingsProxy;

        public function LoadChatTicketCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.addServiceHandlers();
            this.service.load(this.flashvars.room);
            return;
        }// end function

        private function addServiceHandlers() : void
        {
            this.service.success.add(this.successHandler);
            this.service.failure.add(this.failureHandler);
            return;
        }// end function

        private function successHandler(param1:Object) : void
        {
            this.settings.cookie = param1.cookie;
            this.settings.lurker = param1.lurker == "1";
            this.finish();
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this.finish();
            return;
        }// end function

        private function finish() : void
        {
            dispatchComplete(true);
            this.removeServiceHandlers();
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
