package com.tinychat.ui.mediators.social.userslist.greenroom
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.greenroom.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.social.userlist.greenroom.*;
    import com.tinychat.ui.components.social.userlist.greenroom.renderer.*;
    import org.robotlegs.mvcs.*;

    public class GreenRoomUsersListMediator extends Mediator
    {
        public var view:GreenRoomUsersList;
        public var broadcasts:GreenRoomStreamBroadcasts;
        public var streamItemRendererFactory:GreenRoomStreamItemRendererFactory;
        private var list:IdItemList;

        public function GreenRoomUsersListMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            if (!this.view.itemRenderer)
            {
                this.view.itemRenderer = this.streamItemRendererFactory;
            }
            this.list = new IdItemList(this.broadcasts.all);
            this.view.dataProvider = this.list;
            this.broadcasts.started.add(this.broadcastStartedHandler);
            this.broadcasts.stopped.add(this.broadcastStoppedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.broadcasts.started.remove(this.broadcastStartedHandler);
            this.broadcasts.stopped.remove(this.broadcastStoppedHandler);
            return;
        }// end function

        private function broadcastStartedHandler(param1:Broadcast) : void
        {
            this.list.addItem(param1);
            return;
        }// end function

        private function broadcastStoppedHandler(param1:Broadcast) : void
        {
            this.list.removeItemBy(param1);
            return;
        }// end function

    }
}
