package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class UsersListButtonBarButtonMediator extends Mediator
    {
        public var view:UsersListButtonBarButton;
        public var userCount:RoomUserCount;

        public function UsersListButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.updateLabel(this.userCount.count);
            this.userCount.changed.add(this.userCountChanged);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.userCount.changed.remove(this.userCountChanged);
            return;
        }// end function

        private function updateLabel(param1:uint) : void
        {
            this.view.label = param1.toString();
            if (param1 == 1)
            {
                this.view.toolTip = "There is one user in this room.";
            }
            else
            {
                this.view.toolTip = "There are " + param1 + " users in this room.";
            }
            return;
        }// end function

        private function userCountChanged(param1:uint) : void
        {
            this.updateLabel(this.userCount.count);
            return;
        }// end function

    }
}
