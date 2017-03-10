package com.tinychat.ui.mediators.sound
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.sound.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class MuteButtonMediatorBase extends Mediator
    {
        public var view:MuteButton;
        public var volumeControllable:SoundControl;
        private var premutedVolume:Number;

        public function MuteButtonMediatorBase()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.updateSelectionState();
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            this.volumeControllable.volumeChanged.add(this.volumeChangedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.volumeControllable.volumeChanged.remove(this.volumeChangedHandler);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            if (this.view.selected)
            {
                this.volumeControllable.mute();
            }
            else
            {
                this.volumeControllable.unmute();
            }
            return;
        }// end function

        private function volumeChangedHandler(param1:Number) : void
        {
            this.updateSelectionState();
            return;
        }// end function

        private function updateSelectionState() : void
        {
            this.view.selected = this.volumeControllable.muted;
            return;
        }// end function

    }
}
