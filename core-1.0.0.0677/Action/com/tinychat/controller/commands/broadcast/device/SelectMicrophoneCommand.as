package com.tinychat.controller.commands.broadcast.device
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.guards.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.screensequence.*;

    public class SelectMicrophoneCommand extends SelectDeviceBaseCommand
    {
        public var forcedPush2Talk:ForcedPush2TalkGuard;

        public function SelectMicrophoneCommand()
        {
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            super.addScreens(param1);
            param1.addScreen(MicrophoneSelectionScreen);
            if (!this.forcedPush2Talk.approve())
            {
                param1.addScreen(MicrophoneModeSelectionScreen, IsntCameraOnlyMode);
            }
            return;
        }// end function

    }
}
