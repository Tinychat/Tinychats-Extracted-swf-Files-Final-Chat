package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.ui.components.controlbar.buttons.*;
    import org.robotlegs.mvcs.*;

    public class AndroidPromoButtonMediator extends Mediator
    {
        private var view:AndroidPromoButton;

        public function AndroidPromoButtonMediator(param1:AndroidPromoButton)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.url = "https://play.google.com/store/apps/details?id=air.com.tinychat.mobile&hl=en";
            return;
        }// end function

    }
}
