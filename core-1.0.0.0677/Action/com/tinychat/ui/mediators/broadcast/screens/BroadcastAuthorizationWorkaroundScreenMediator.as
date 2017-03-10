package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.utils.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.mediators.screensequence.*;
    import flashx.textLayout.conversion.*;

    public class BroadcastAuthorizationWorkaroundScreenMediator extends SequencedScreenMediator
    {
        public var view:BroadcastAuthorizationWorkaroundScreen;
        public var version:FlashVersion;

        public function BroadcastAuthorizationWorkaroundScreenMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            var _loc_1:* = "<TextFlow xmlns=\'http://ns.adobe.com/textLayout/2008\'>" + "<p><span fontWeight=\"bold\">Mac OSX Lion</span></p>" + "<p>Your version of Adobe Flash Player is currently experiencing an issue on Mac OSX Lion where " + "users are unable to grant access to their webcam/microphone.</p>" + "<p>To resolve the issue, please update Flash Player to the latest version: " + "<a href=\'http://get.adobe.com/flashplayer/\'>http://get.adobe.com/flashplayer/</a>." + "</p></TextFlow>";
            this.view.title = "OSX Lion compatibility issue";
            this.view.workaroundInfoDisplay.textFlow = TextConverter.importToFlow(_loc_1, TextConverter.TEXT_LAYOUT_FORMAT);
            this.view.confirm.label = "Close";
            this.view.confirmed.add(this.confirmedHandler);
            return;
        }// end function

        override public function onRemove() : void
        {
            this.view.confirmed.remove(this.confirmedHandler);
            return;
        }// end function

        private function confirmedHandler() : void
        {
            dispatchComplete();
            return;
        }// end function

    }
}
