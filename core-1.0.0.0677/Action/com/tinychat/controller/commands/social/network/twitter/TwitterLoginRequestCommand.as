package com.tinychat.controller.commands.social.network.twitter
{
    import com.tinychat.controller.commands.social.network.*;
    import com.tinychat.model.social.network.twitter.*;

    public class TwitterLoginRequestCommand extends AbstractLoginRequestCommand
    {
        private var twitter:TwitterProxy;

        public function TwitterLoginRequestCommand(param1:TwitterProxy)
        {
            super(param1, {});
            return;
        }// end function

    }
}
