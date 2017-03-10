package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.model.settings.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import org.robotlegs.mvcs.*;

    public class OpenGraphToggleMediator extends Mediator
    {
        public var view:OpenGraphToggle;
        public var shareSetting:OpenGraphShareApplicationSetting;
        public var remindSetting:OpenGraphRemindMeApplicationSetting;
        public var facebookLogin:FacebookLoginProxy;
        public var watchActionManager:WatchActionManager;

        public function OpenGraphToggleMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.visible = this.facebookLogin.isLoggedIn;
            this.view.setting = this.shareSetting;
            this.facebookLogin.loggedIn.add(this.loggedInHandler);
            this.facebookLogin.loggedOut.add(this.loggedOutHandler);
            this.watchActionManager.posted.add(this.postedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.facebookLogin.loggedIn.remove(this.loggedInHandler);
            this.facebookLogin.loggedOut.remove(this.loggedOutHandler);
            this.watchActionManager.posted.remove(this.postedHandler);
            this.view.closeToolTip();
            return;
        }// end function

        private function postedHandler(param1:YouTubeBroadcast) : void
        {
            if (this.remindSetting.value == true)
            {
                this.remindSetting.value = false;
                this.view.showToolTip(param1);
            }
            return;
        }// end function

        private function loggedInHandler() : void
        {
            this.view.visible = true;
            return;
        }// end function

        private function loggedOutHandler() : void
        {
            this.view.visible = false;
            this.view.closeToolTip();
            return;
        }// end function

    }
}
