package com.tinychat.controller.commands.broadcast.device
{
    import com.tinychat.controller.commands.popup.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.guards.*;
    import com.tinychat.model.guards.mode.*;
    import com.tinychat.ui.components.broadcast.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.screensequence.*;
    import com.tinychat.ui.screensequence.*;

    public class BroadcastDevicesSetupCommand extends OpenScreenSequenceContainerCommand
    {
        public var securityPanel:SecurityPanelProxy;
        public var forcedPush2Talk:ForcedPush2TalkGuard;
        private var completionListener:Function;

        public function BroadcastDevicesSetupCommand(param1:IsNextModeGuard)
        {
            super(!param1.approve());
            return;
        }// end function

        public function addCompletionListener(param1:Function) : void
        {
            this.completionListener = param1;
            return;
        }// end function

        override protected function sequencerFactory(param1:ScreenSequenceContainer) : ScreenSequencer
        {
            return new BroadcastScreenSequence(injector, param1, this.securityPanel);
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            param1.addScreen(CameraSelectionScreen);
            param1.addScreen(MicrophoneSelectionScreen);
            if (!this.forcedPush2Talk.approve())
            {
                param1.addScreen(MicrophoneModeSelectionScreen, IsntCameraOnlyMode);
            }
            param1.addScreen(Push2TalkOnlyNotificationScreen, IsNextModeGuard);
            return;
        }// end function

    }
}
