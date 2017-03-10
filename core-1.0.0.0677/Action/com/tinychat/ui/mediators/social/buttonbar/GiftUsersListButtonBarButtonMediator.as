package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class GiftUsersListButtonBarButtonMediator extends Mediator
    {
        public var view:GiftUsersListButtonBarButton;

        public function GiftUsersListButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.toolTip = "";
            return;
        }// end function

    }
}
