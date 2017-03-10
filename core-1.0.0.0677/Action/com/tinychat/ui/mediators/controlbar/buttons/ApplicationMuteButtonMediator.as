package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.ui.mediators.sound.*;

    public class ApplicationMuteButtonMediator extends MuteButtonMediatorBase
    {

        public function ApplicationMuteButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            view.toolTip = "ToolTipBundle.muteButton";
            return;
        }// end function

    }
}
