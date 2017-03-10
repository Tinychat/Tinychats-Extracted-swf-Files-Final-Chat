package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.ui.components.controlbar.buttons.*;
    import org.robotlegs.mvcs.*;

    public class IosPromoButtonMediator extends Mediator
    {
        private var view:IosPromoButton;

        public function IosPromoButtonMediator(param1:IosPromoButton)
        {
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.url = "http://itunes.apple.com/us/app/tinychat-fb/id451331904?mt=8";
            return;
        }// end function

    }
}
