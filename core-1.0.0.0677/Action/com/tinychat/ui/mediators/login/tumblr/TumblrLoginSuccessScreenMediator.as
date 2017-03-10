package com.tinychat.ui.mediators.login.tumblr
{
    import com.tinychat.controller.commands.social.network.tumblr.signals.*;
    import com.tinychat.model.room.*;
    import com.tinychat.ui.components.login.tumblr.*;
    import com.tinychat.ui.mediators.screensequence.*;

    public class TumblrLoginSuccessScreenMediator extends SequencedScreenMediator
    {
        public var view:TumblrLoginSuccessScreen;
        public var reblog:TumblrReblog;
        public var settings:RoomSettingsProxy;

        public function TumblrLoginSuccessScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.title = "All set! Continue to join the room and post!";
            this.view.confirmLabel = "Continue";
            this.view.confirmed.addOnce(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            this.reblog.dispatch("Come watch this Tinychat: " + this.settings.url);
            dispatchGoNext();
            return;
        }// end function

    }
}
