package com.tinychat.ui.mediators.fullscreen
{
    import com.tinychat.controller.commands.fullscreen.signals.*;
    import com.tinychat.ui.components.fullscreen.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class ExitFullScreenButtonMediator extends Mediator
    {
        public var view:ExitFullScreenButton;
        public var exitFullScreen:ExitFullScreen;

        public function ExitFullScreenButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Click to exit fullscreen";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.exitFullScreen.dispatch();
            return;
        }// end function

    }
}
