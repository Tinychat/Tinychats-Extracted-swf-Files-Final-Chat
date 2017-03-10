package com.tinychat.ui.mediators.invite
{
    import com.tinychat.model.room.info.*;
    import com.tinychat.ui.components.invite.*;

    public class NewRoomCreatedScreenMediator extends InviteSelectionScreenMediatorBase
    {
        private var view:NewRoomCreatedScreen;

        public function NewRoomCreatedScreenMediator(param1:NewRoomCreatedScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            if (roomInfo.type == RoomType.DEFAULT)
            {
                this.view.title = "Tada! Your instant chatroom has been created!";
                this.view.roomUrlHeaderText = "Share this URL with your friends to invite them to your room:";
                this.view.confirmLabel = "Just take me to my room";
            }
            else
            {
                this.view.title = "You\'re the only one here. Invite someone?";
                this.view.roomUrlHeaderText = "Share this URL with your friends to invite them to this room:";
                this.view.confirmLabel = "Just take me to the room";
            }
            this.view.startBroadcastLabelText = "To broadcast right now, click the button:";
            this.view.startBroadcastClicked.add(this.startBroadcastClicked);
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.startBroadcastClicked.remove(this.startBroadcastClicked);
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function startBroadcastClicked() : void
        {
            dispatchComplete();
            return;
        }// end function

        private function confirmedHandler() : void
        {
            dispatchComplete();
            return;
        }// end function

    }
}
