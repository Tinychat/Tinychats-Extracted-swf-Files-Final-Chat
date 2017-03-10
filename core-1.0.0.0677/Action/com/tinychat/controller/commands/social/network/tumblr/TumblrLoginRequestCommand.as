package com.tinychat.controller.commands.social.network.tumblr
{
    import com.tinychat.controller.commands.social.network.*;
    import com.tinychat.model.social.network.tumblr.*;

    public class TumblrLoginRequestCommand extends AbstractLoginRequestCommand
    {
        private var tumblr:TumblrLogin;

        public function TumblrLoginRequestCommand(param1:TumblrLogin)
        {
            super(param1, {});
            return;
        }// end function

    }
}
