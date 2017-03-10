package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.ui.components.video.controls.*;
    import org.robotlegs.mvcs.*;

    public class VideoControlsOverlayMediator extends Mediator
    {
        public var view:VideoControlsOverlay;

        public function VideoControlsOverlayMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.menuOpenButtonLabelText = "Interact";
            return;
        }// end function

    }
}
