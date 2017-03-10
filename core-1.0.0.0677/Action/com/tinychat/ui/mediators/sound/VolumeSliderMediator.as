package com.tinychat.ui.mediators.sound
{
    import com.tinychat.model.api.*;
    import mx.events.*;
    import org.robotlegs.mvcs.*;
    import spark.components.supportClasses.*;

    public class VolumeSliderMediator extends Mediator
    {
        public var view:SliderBase;
        public var volumeControllable:SoundControl;

        public function VolumeSliderMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.maximum = 1;
            this.view.snapInterval = 0;
            this.view.value = this.volumeControllable.volume;
            eventMap.mapListener(this.view, FlexEvent.VALUE_COMMIT, this.handleValueCommit, FlexEvent);
            this.volumeControllable.volumeChanged.add(this.volumeChangedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.volumeControllable.volumeChanged.remove(this.volumeChangedHandler);
            return;
        }// end function

        private function handleValueCommit(event:FlexEvent) : void
        {
            this.volumeControllable.volume = this.view.value;
            return;
        }// end function

        private function volumeChangedHandler(param1:Number) : void
        {
            if (this.view.value != param1)
            {
                this.view.value = param1;
            }
            return;
        }// end function

    }
}
