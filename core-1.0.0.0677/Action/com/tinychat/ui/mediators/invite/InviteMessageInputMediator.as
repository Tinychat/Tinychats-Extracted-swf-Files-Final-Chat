package com.tinychat.ui.mediators.invite
{
    import com.tinychat.ui.components.invite.*;
    import org.robotlegs.mvcs.*;

    public class InviteMessageInputMediator extends Mediator
    {
        public var view:InviteMessageInput;

        public function InviteMessageInputMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.promptMessage = "Type a message to send to your friend(s):";
            return;
        }// end function

    }
}
