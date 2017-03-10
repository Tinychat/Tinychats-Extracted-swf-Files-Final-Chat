package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.guards.composite.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.mediators.social.buttonbar.signals.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class FxPromoButtonMediator extends Mediator
    {
        public var view:FxPromoButton;
        public var isBroadcastingVideo:IsBroadcastingVideoGuard;
        public var selectSocialButtonBarButton:SelectSocialButtonBarButton;
        private var visibilityGuard:AllOfGuards;

        public function FxPromoButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Effects";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            this.isBroadcastingVideo.addChangeListener(this.updateVisibility);
            this.updateVisibility(this.isBroadcastingVideo.approve());
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.isBroadcastingVideo.removeChangeListener(this.updateVisibility);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.selectSocialButtonBarButton.dispatch(SocialButtonBar.EFFECTS_CONTAINER);
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
