package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class EffectsButtonBarButtonMediator extends Mediator
    {
        public var view:EffectsButtonBarButton;
        public var isBroadcasting:IsBroadcastingVideoGuard;

        public function EffectsButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.isBroadcasting.addChangeListener(this.updateVisibility);
            this.updateVisibility(this.isBroadcasting.approve());
            return;
        }// end function

        override public function onRemove() : void
        {
            this.isBroadcasting.removeChangeListener(this.updateVisibility);
            return;
        }// end function

        private function updateVisibility(param1:Boolean) : void
        {
            this.view.visible = param1;
            this.view.includeInLayout = param1;
            return;
        }// end function

    }
}
