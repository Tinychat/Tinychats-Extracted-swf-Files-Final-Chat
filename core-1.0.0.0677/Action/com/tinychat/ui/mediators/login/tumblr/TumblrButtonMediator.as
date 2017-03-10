package com.tinychat.ui.mediators.login.tumblr
{
    import com.tinychat.ui.components.login.tumblr.*;
    import org.robotlegs.mvcs.*;

    public class TumblrButtonMediator extends Mediator
    {
        public var view:TumblrButton;

        public function TumblrButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.label = "Tumblr";
            return;
        }// end function

    }
}
