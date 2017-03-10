package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.login.*;
    import org.robotlegs.utilities.macrobot.*;

    public class PromotedVerificationCommand extends AsyncCommand
    {
        public var service:PromotedVerificationService;
        public var settings:RoomSettingsProxy;
        public var flashvars:FlashvarsProxy;

        public function PromotedVerificationCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.flashvars.promoted)
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
            this.finish(true);
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this.finish(false);
            return;
        }// end function

        private function finish(param1:Boolean) : void
        {
            this.settings.promoted = param1;
            dispatchComplete(true);
            this.removeServiceHandlers();
            return;
        }// end function

    }
}
