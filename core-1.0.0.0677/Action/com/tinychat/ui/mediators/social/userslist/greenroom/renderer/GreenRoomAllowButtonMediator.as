package com.tinychat.ui.mediators.social.userslist.greenroom.renderer
{
    import com.tinychat.controller.commands.greenroom.signal.*;
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.social.userlist.greenroom.renderer.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class GreenRoomAllowButtonMediator extends Mediator
    {
        public var view:GreenRoomAllowButton;
        public var user:UserIdentity;
        public var allowBroadcast:AllowBroadcast;

        public function GreenRoomAllowButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.allowBroadcast.dispatch(this.user);
            return;
        }// end function

    }
}
