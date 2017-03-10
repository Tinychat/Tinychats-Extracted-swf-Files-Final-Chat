package com.tinychat.controller.commands.user.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class MqttBlockUser extends AbstractReadOnlySignal
    {

        public function MqttBlockUser()
        {
            super(Identity, Boolean);
            return;
        }// end function

        public function dispatch(param1:Identity, param2:Boolean) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
