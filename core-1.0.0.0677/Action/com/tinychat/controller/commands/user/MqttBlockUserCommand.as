package com.tinychat.controller.commands.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import org.robotlegs.mvcs.*;

    public class MqttBlockUserCommand extends Command
    {
        public var mqttProxy:MqttProxy;
        public var user:Identity;
        public var toggle:Boolean;

        public function MqttBlockUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.toggle)
            {
                this.mqttProxy.block(this.user);
            }
            else
            {
                this.mqttProxy.unblock(this.user);
            }
            return;
        }// end function

    }
}
