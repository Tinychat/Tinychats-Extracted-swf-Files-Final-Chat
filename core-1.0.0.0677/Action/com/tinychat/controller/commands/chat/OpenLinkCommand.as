package com.tinychat.controller.commands.chat
{
    import com.tinychat.model.social.chat.encoding.*;
    import com.tinychat.model.social.chat.links.*;
    import com.tinychat.model.utils.url.*;
    import flash.net.*;
    import org.robotlegs.mvcs.*;

    public class OpenLinkCommand extends Command
    {
        public var whitelist:LinkWhitelist;
        public var blacklist:LinkBlacklist;
        public var urlString:String;

        public function OpenLinkCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:Url = null;
            if (EncodingMatchers.EMAIL_MATCHER.test(this.urlString))
            {
                navigateToURL(new URLRequest("mailto:" + this.urlString), "_blank");
            }
            else
            {
                _loc_1 = new Url(this.urlString.indexOf("www") == 0 ? ("http://" + this.urlString) : (this.urlString), false);
                if (!this.blacklist.approve(_loc_1))
                {
                    commandMap.execute(LinkBlockedCommand, _loc_1);
                }
                else if (!this.whitelist.approve(_loc_1))
                {
                    commandMap.execute(LinkWarningCommand, _loc_1);
                }
                else
                {
                    navigateToURL(new URLRequest(_loc_1.href), "_blank");
                }
            }
            return;
        }// end function

    }
}
