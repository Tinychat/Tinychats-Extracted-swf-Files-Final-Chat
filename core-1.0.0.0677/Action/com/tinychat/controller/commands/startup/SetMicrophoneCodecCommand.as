package com.tinychat.controller.commands.startup
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.proxies.*;
    import org.robotlegs.mvcs.*;

    public class SetMicrophoneCodecCommand extends Command
    {
        public var devices:BroadcastDeviceProxy;
        public var flashvars:FlashvarsProxy;

        public function SetMicrophoneCodecCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.devices.microphoneCodec = this.flashvars.microphoneCodec;
            return;
        }// end function

    }
}
