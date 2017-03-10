package com.tinychat.ui.mediators.video.controls
{
    import com.tinychat.controller.commands.broadcast.media.signals.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.ui.components.video.controls.*;
    import org.robotlegs.mvcs.*;

    public class HorizontalDurationSliderMediator extends Mediator
    {
        public var broadcast:MediaBroadcast;
        public var view:HorizontalDurationSlider;
        public var seek:SeekMediaBroadcast;

        public function HorizontalDurationSliderMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.source = this.broadcast;
            this.view.changed.add(this.changedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.changed.remove(this.changedHandler);
            this.view.source = null;
            return;
        }// end function

        private function changedHandler(param1:Number) : void
        {
            this.seek.dispatch(this.broadcast);
            return;
        }// end function

    }
}
