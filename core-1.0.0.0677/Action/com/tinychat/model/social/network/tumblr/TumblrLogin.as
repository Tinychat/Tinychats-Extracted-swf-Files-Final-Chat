package com.tinychat.model.social.network.tumblr
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.login.*;
    import com.tinychat.services.oauth.*;

    public class TumblrLogin extends AbstractOAuthLogin
    {

        public function TumblrLogin(param1:OAuthLoginService)
        {
            super(param1, OAuthProvider.TUMBLR);
            return;
        }// end function

        override protected function parseCurrentUser(param1:OAuthResponseArguments) : SocialNetworkUserListItem
        {
            return new TumblrUserListItem(new TumblrUser(param1.id, param1.name, param1.pictureUrl));
        }// end function

    }
}
