package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.ui.components.spark.*;
    import org.robotlegs.mvcs.*;

    public class AbstractPromoButtonMediator extends Mediator
    {
        public var isFacebookRoom:IsFacebookRoomGuard;
        private var view:LinkButton;

        public function AbstractPromoButtonMediator(param1:LinkButton) : void
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.facebookRoomChange(this.isFacebookRoom.approve());
            this.isFacebookRoom.addChangeListener(this.facebookRoomChange);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.isFacebookRoom.removeChangeListener(this.facebookRoomChange);
            return;
        }// end function

        private function facebookRoomChange(param1:Boolean) : void
        {
            this.view.visible = !param1;
            this.view.includeInLayout = !param1;
            return;
        }// end function

    }
}
