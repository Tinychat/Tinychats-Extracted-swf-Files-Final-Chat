package com.tinychat.controller.commands.broadcast.device
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.*;
    import com.tinychat.ui.components.screensequence.*;
    import com.tinychat.ui.screensequence.*;

    public class SelectDeviceBaseCommand extends OpenScreenSequenceContainerCommand
    {
        public var broadcastDeviceProxy:BroadcastDeviceProxy;
        public var securityPanel:SecurityPanelProxy;

        public function SelectDeviceBaseCommand()
        {
            return;
        }// end function

        override protected function sequencerFactory(param1:ScreenSequenceContainer) : ScreenSequencer
        {
            return new BroadcastScreenSequence(injector, param1, this.securityPanel);
        }// end function

    }
}
