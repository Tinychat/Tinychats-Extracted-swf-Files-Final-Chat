package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.model.settings.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.net.*;
    import org.robotlegs.mvcs.*;

    public class OpenGraphToggleInfoScreenMediator extends Mediator
    {
        public var view:OpenGraphToggleInfoScreen;
        public var facebook:FacebookLoginProxy;
        public var setting:OpenGraphShareApplicationSetting;

        public function OpenGraphToggleInfoScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.setting = this.setting;
            this.view.infoText = "Facebook sharing is currently {0}. \n\n" + "This means that when you watch a video on Tinychat, " + "we will share it with your Facebook friends automatically. " + "You can disable this feature at any time by clicking here.";
            this.view.activityText = "Click here to review all content Tinychat has posted to your timeline.";
            this.view.activityClick.add(this.activityClickHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.activityClick.remove(this.activityClickHandler);
            return;
        }// end function

        private function activityClickHandler() : void
        {
            var _loc_1:String = null;
            if (this.facebook.isLoggedIn)
            {
                _loc_1 = this.facebook.facebookUser.link + "/allactivity?privacy_source=activity_log&log_filter=app_" + FacebookConstants.APP_ID;
                navigateToURL(new URLRequest(_loc_1), "_blank");
            }
            return;
        }// end function

    }
}
