package com.tinychat.ui.mediators.invite
{
    import com.tinychat.ui.components.invite.*;

    public class InviteSelectionScreenMediator extends InviteSelectionScreenMediatorBase
    {
        private var view:InviteSelectionScreen;

        public function InviteSelectionScreenMediator(param1:InviteSelectionScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.title = "Invite your friends to this chatroom";
            this.view.roomUrlHeader.text = "Share the URL for this room:";
            this.view.socialNetworksHeader.text = "Invite friends from the following social networks:";
            return;
        }// end function

    }
}
