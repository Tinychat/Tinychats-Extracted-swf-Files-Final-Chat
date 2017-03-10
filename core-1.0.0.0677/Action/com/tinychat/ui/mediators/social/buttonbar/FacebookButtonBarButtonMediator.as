package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class FacebookButtonBarButtonMediator extends Mediator
    {
        public var view:FacebookButtonBarButton;
        public var socket:FacebookXmppSocket;
        public var friends:FacebookFriendsProxy;
        private var presenceCounter:PresenceCounter;

        public function FacebookButtonBarButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.presenceCounter = new PresenceCounter(this.friends.list);
            this.presenceCounter.countChanged.add(this.presenceCountChangedHandler);
            this.updateCount();
            this.visible = this.socket.isConnected;
            this.socket.connected.add(this.loggedInHandler);
            this.socket.disconnected.add(this.loggedOutHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.presenceCounter.countChanged.remove(this.presenceCountChangedHandler);
            this.presenceCounter.dispose();
            this.presenceCounter = null;
            this.socket.connected.remove(this.loggedInHandler);
            this.socket.disconnected.remove(this.loggedOutHandler);
            return;
        }// end function

        private function presenceCountChangedHandler() : void
        {
            this.updateCount();
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.visible = true;
            return;
        }// end function

        private function loggedOutHandler() : void
        {
            this.visible = false;
            return;
        }// end function

        private function updateCount() : void
        {
            this.view.count = this.presenceCounter.getCountFor(PresenceType.ONLINE);
            if (this.view.count > 0)
            {
                this.view.toolTip = this.view.count + " Facebook friends online.";
            }
            return;
        }// end function

        private function set visible(param1:Boolean) : void
        {
            this.view.includeInLayout = param1;
            this.view.visible = param1;
            return;
        }// end function

    }
}
