package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.model.settings.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import org.robotlegs.mvcs.*;

    public class OpenGraphPostedScreenMediator extends Mediator
    {
        public var view:OpenGraphPostedScreen;
        public var watchActionManager:WatchActionManager;
        public var remindMeSetting:OpenGraphRemindMeApplicationSetting;

        public function OpenGraphPostedScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.infoText = "Your facebook friends can now see that you\'ve viewed this video.";
            this.view.remindMeSetting = this.remindMeSetting;
            this.view.removed.add(this.removedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.removed.remove(this.removedHandler);
            return;
        }// end function

        private function removedHandler(param1:YouTubeBroadcast) : void
        {
            this.watchActionManager.withdraw(param1);
            return;
        }// end function

    }
}
