package com.tinychat.ui.mediators.login.twitter
{
    import com.tinychat.ui.components.login.twitter.*;
    import org.robotlegs.mvcs.*;

    public class TwitterButtonMediator extends Mediator
    {
        public var view:TwitterButton;

        public function TwitterButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Twitter";
            return;
        }// end function

    }
}
