package com.tinychat.controller.commands.social.network.mqtt
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.network.mqtt.*;
    import org.robotlegs.utilities.macrobot.*;

    public class MqttLoginCommand extends AsyncCommand
    {
        public var mqttProxy:MqttProxy;
        public var flashvars:FlashvarsProxy;
        public var settings:RoomSettingsProxy;

        public function MqttLoginCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.settings.account;
            var _loc_2:* = injector.getInstance(String, "mqttHash");
            if (!this.mqttProxy.isLoggedIn)
            {
            }
            if (_loc_1)
            {
            }
            if (_loc_2)
            {
                this.mqttProxy.loggedIn.addOnce(this.loggedInHandler);
                this.mqttProxy.loggedOut.addOnce(this.loggedOutHandler);
                this.mqttProxy.login({username:_loc_1, password:_loc_2, visibility:MqttVisibility.ALL});
            }
            else
            {
                dispatchComplete(false);
            }
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

        private function removeListeners() : void
        {
            this.mqttProxy.loggedIn.remove(this.loggedInHandler);
            this.mqttProxy.loggedOut.remove(this.loggedOutHandler);
            return;
        }// end function

    }
}
