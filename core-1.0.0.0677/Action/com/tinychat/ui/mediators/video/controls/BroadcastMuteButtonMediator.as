package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.ui.mediators.sound.*;

    public class BroadcastMuteButtonMediator extends MuteButtonMediatorBase
    {

        public function BroadcastMuteButtonMediator()
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
