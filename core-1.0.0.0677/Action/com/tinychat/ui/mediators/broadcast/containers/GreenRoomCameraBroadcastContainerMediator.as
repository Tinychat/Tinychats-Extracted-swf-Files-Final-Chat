package com.tinychat.ui.mediators.broadcast.containers
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import org.robotlegs.mvcs.*;

    public class GreenRoomCameraBroadcastContainerMediator extends Mediator
    {
        public var view:GreenRoomCameraBroadcastContainer;

        public function GreenRoomCameraBroadcastContainerMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.approvalMessageDisplayText = "Your broadcast is pending approval by a moderator.";
            return;
        }// end function

    }
}
