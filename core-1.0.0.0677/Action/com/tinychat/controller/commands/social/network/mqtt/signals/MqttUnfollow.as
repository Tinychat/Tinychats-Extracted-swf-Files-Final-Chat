package com.tinychat.controller.commands.social.network.mqtt.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;
    import com.tinychat.model.social.network.mqtt.*;

    public class MqttUnfollow extends AbstractReadOnlySignal
    {

        public function MqttUnfollow()
        {
            super(MqttUser, UserIdentity);
            return;
        }// end function

        public function dispatch(param1:MqttUser, param2:UserIdentity) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
