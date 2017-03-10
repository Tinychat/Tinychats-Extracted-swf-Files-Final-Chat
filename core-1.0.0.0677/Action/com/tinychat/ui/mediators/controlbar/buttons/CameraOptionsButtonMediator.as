package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.controlbar.buttons.*;

    public class CameraOptionsButtonMediator extends AbstractDeviceOptionsButtonMediator
    {

        public function CameraOptionsButtonMediator(param1:CameraOptionsButton)
        {
            super(param1, StateAction.SELECT_CAMERA, "Camera options");
            return;
        }// end function

    }
}
