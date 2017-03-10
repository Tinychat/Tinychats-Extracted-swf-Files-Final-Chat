package com.tinychat.controller.commands.social.network.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import org.robotlegs.mvcs.*;

    public class MqttUnfollowCommand extends Command
    {
        public var mqttUser:MqttUser;
        public var user:UserIdentity;
        public var mqttProxy:MqttProxy;

        public function MqttUnfollowCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.mqttProxy.unsubscribeFrom(this.mqttUser.name);
            return;
        }// end function

    }
}
