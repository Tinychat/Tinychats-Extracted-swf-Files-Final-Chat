package com.tinychat.controller.commands.social.network.mqtt
{
    import com.tinychat.services.social.network.mqtt.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoadMqttHashCommand extends AsyncCommand
    {
        public var service:MqttHashService;

        public function LoadMqttHashCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (injector.hasMapping(String, "mqttHash"))
            {
                injector.unmap(String, "mqttHash");
            }
            this.addServiceHandlers();
            this.service.load();
            return;
        }// end function

        private function successHandler(param1:String) : void
        {
            injector.mapValue(String, param1, "mqttHash");
            this.removeServiceHandlers();
            dispatchComplete(true);
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this.removeServiceHandlers();
            dispatchComplete(false);
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

    }
}
