package com.tinychat.ui.mediators.social.buttonbar
{
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import org.robotlegs.mvcs.*;

    public class SocialNetworkButtonBarButtonMediator extends Mediator
    {
        private var view:CountDisplayButtonBarButton;
        private var login:SocialNetworkProxy;
        private var friends:SocialNetworkFriends;
        private var presenceCounter:PresenceCounter;

        public function SocialNetworkButtonBarButtonMediator(param1:CountDisplayButtonBarButton, param2:SocialNetworkProxy, param3:SocialNetworkFriends)
        {
            this.view = param1;
            this.login = param2;
            this.friends = param3;
            return;
        }// end function

        override public function onRegister() : void
        {
            this.presenceCounter = new PresenceCounter(this.friends.com.tinychat.model.social.network:SocialNetworkFriends::friends);
            this.presenceCounter.countChanged.add(this.presenceCountChangedHandler);
            this.updateCount();
            this.visible = this.login.isLoggedIn;
            this.login.loggedIn.add(this.loggedInHandler);
            this.login.loggedOut.add(this.loggedOutHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.presenceCounter.countChanged.remove(this.presenceCountChangedHandler);
            this.presenceCounter.dispose();
            this.presenceCounter = null;
            this.login.loggedIn.remove(this.loggedInHandler);
            this.login.loggedOut.remove(this.loggedOutHandler);
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
                this.view.toolTip = this.view.count + " friends online.";
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
