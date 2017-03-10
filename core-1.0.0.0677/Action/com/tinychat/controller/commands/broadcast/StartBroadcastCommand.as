package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.streamoptions.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.model.sounds.*;
    import org.robotlegs.mvcs.*;

    public class StartBroadcastCommand extends Command
    {
        public var broadcastDevices:BroadcastDeviceProxy;
        public var microphoneVolumeController:MicrophoneOutbundVolumeControl;
        public var streamOptions:StreamOptions;
        private var broadcasts:CameraBroadcasts;

        public function StartBroadcastCommand(param1:CameraBroadcasts)
        {
            this.broadcasts = param1;
            return;
        }// end function

        override public function execute() : void
        {
            this.broadcasts.start(this.broadcastDevices, this.microphoneVolumeController, this.streamOptions);
            return;
        }// end function

    }
}
