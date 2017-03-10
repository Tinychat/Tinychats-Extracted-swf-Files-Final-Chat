package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.controlbar.buttons.*;

    public class MicrophoneOptionsButtonMediator extends AbstractDeviceOptionsButtonMediator
    {

        public function MicrophoneOptionsButtonMediator(param1:MicrophoneOptionsButton)
        {
            super(param1, StateAction.SELECT_MICROPHONE, "Microphone options");
            return;
        }// end function

    }
}
