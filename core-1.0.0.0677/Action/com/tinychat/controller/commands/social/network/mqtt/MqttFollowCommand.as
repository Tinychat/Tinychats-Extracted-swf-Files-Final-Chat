package com.tinychat.controller.commands.social.network.mqtt
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.services.chat.tinychat.*;
    import org.robotlegs.mvcs.*;

    public class MqttFollowCommand extends Command
    {
        public var mqttUser:MqttUser;
        public var user:UserIdentity;
        public var mqttProxy:MqttProxy;
        public var privateChat:TinychatPrivateChatService;

        public function MqttFollowCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.mqttProxy.subscribeTo(this.mqttUser.name);
            this.privateChat.send("I\'m now following you on Tinychat. Go to https://tinychat.com/" + this.mqttProxy.currentUser.name + " and click \'Follow\' to follow me back!", this.user);
            return;
        }// end function

    }
}
