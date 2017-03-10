package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class ToggleVideoButtonMediator extends Mediator
    {
        public var view:ToggleVideoButton;
        public var streamBroadcast:StreamBroadcast;

        public function ToggleVideoButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            this.selected = !this.streamBroadcast.isPlaying;
            this.streamBroadcast.started.add(this.startedHandler);
            this.streamBroadcast.started.add(this.stoppedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.streamBroadcast.started.remove(this.startedHandler);
            this.streamBroadcast.started.remove(this.stoppedHandler);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            if (this.view.selected)
            {
                this.streamBroadcast.stop();
            }
            else
            {
                this.streamBroadcast.start();
            }
            return;
        }// end function

        private function startedHandler() : void
        {
            this.selected = false;
            return;
        }// end function

        private function stoppedHandler() : void
        {
            this.selected = true;
            return;
        }// end function

        private function set selected(param1:Boolean) : void
        {
            this.view.selected = param1;
            this.updateToolTip();
            return;
        }// end function

        private function updateToolTip() : void
        {
            if (!this.view.selected)
            {
                this.view.toolTip = "ToolTipBundle.toggleVideoButton";
            }
            else
            {
                this.view.toolTip = "ToolTipBundle.toggleVideoButtonSelected";
            }
            return;
        }// end function

    }
}
