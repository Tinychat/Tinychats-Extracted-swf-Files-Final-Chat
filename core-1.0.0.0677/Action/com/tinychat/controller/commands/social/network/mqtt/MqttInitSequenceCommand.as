package com.tinychat.controller.commands.social.network.mqtt
{
    import org.robotlegs.utilities.macrobot.*;

    public class MqttInitSequenceCommand extends SequenceCommand
    {

        public function MqttInitSequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            atomic = false;
            addCommand(LoadMqttHashCommand);
            addCommand(MqttLoginCommand);
            addCommand(RegisterMqttChatListenersCommand);
            super.execute();
            return;
        }// end function

    }
}
