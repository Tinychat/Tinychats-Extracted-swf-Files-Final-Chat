package com.tinychat.ui.mediators.login.facebook
{
    import com.tinychat.ui.components.login.facebook.*;
    import org.robotlegs.mvcs.*;

    public class FacebookButtonMediator extends Mediator
    {
        public var view:FacebookButton;

        public function FacebookButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Facebook";
            return;
        }// end function

    }
}
