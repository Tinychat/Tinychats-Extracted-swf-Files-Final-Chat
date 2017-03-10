package com.tinychat.controller.commands.broadcast.device
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.screensequence.*;

    public class SelectCameraCommand extends SelectDeviceBaseCommand
    {

        public function SelectCameraCommand()
        {
            return;
        }// end function

        override protected function addScreens(param1:ScreenSequencer) : void
        {
            super.addScreens(param1);
            param1.addScreen(CameraSelectionScreen);
            return;
        }// end function

    }
}
