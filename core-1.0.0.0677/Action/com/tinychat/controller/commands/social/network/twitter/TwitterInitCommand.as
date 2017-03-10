package com.tinychat.controller.commands.social.network.twitter
{
    import com.tinychat.model.social.network.twitter.*;
    import org.robotlegs.mvcs.*;

    public class TwitterInitCommand extends Command
    {
        public var twitter:TwitterProxy;

        public function TwitterInitCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.twitter.getLoginStatus();
            return;
        }// end function

    }
}
