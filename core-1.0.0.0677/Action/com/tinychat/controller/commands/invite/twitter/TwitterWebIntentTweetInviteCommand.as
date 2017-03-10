package com.tinychat.controller.commands.invite.twitter
{
    import com.tinychat.model.invite.twitter.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.services.*;
    import org.robotlegs.mvcs.*;

    public class TwitterWebIntentTweetInviteCommand extends Command
    {
        public var javascript:ApplicationJavascript;
        public var template:TwitterInviteTemplates;

        public function TwitterWebIntentTweetInviteCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = ServiceApiUrl.TWITTER_TWEET_INTENT + "?text= " + escape(this.template.generate());
            this.javascript.openPopup(_loc_1);
            return;
        }// end function

    }
}
