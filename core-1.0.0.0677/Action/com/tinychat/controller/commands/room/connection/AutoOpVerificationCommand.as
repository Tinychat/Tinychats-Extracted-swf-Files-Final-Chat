package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.model.room.*;
    import com.tinychat.services.login.*;
    import org.robotlegs.utilities.macrobot.*;

    public class AutoOpVerificationCommand extends AsyncCommand
    {
        public var service:AutoOpVerificationService;
        public var settings:RoomSettingsProxy;

        public function AutoOpVerificationCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.settings.autoop != "none")
            {
                this.addServiceHandlers();
                this.service.send(this.settings.name);
            }
            else
            {
                dispatchComplete(true);
            }
            return;
        }// end function

        private function addServiceHandlers() : void
        {
            this.service.success.add(this.successHandler);
            this.service.failure.add(this.failureHandler);
            return;
        }// end function

        private function removeServiceHandlers() : void
        {
            this.service.success.remove(this.successHandler);
            this.service.failure.remove(this.failureHandler);
            return;
        }// end function

        private function successHandler() : void
        {
            this.finish();
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this.settings.autoop = "none";
            this.finish();
            return;
        }// end function

        private function finish() : void
        {
            dispatchComplete(true);
            this.removeServiceHandlers();
            return;
        }// end function

    }
}
