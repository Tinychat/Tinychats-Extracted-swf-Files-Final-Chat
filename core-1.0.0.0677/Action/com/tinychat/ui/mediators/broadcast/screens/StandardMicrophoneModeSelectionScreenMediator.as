package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;

    public class StandardMicrophoneModeSelectionScreenMediator extends MicrophoneModeSelectionScreenMediatorBase
    {

        public function StandardMicrophoneModeSelectionScreenMediator(param1:MicrophoneModeSelectionScreen)
        {
            super(param1);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.selectionInfoDisplayText = "If you choose \"Open Microphone\" we strongly advise the use of headphones.";
            return;
        }// end function

    }
}
