package com.tinychat.model.login
{

    public class LoginType extends Object
    {
        public static const FACEBOOK:LoginType = new LoginType(FACEBOOK);
        public static const GUEST:LoginType = new LoginType(GUEST);
        public static const TUMBLR:LoginType = new LoginType(TUMBLR);
        public static const TWITTER:LoginType = new LoginType(TWITTER);
        public static const NOT_LOGGED_IN:LoginType = new LoginType(NOT_LOGGED_IN);

        public function LoginType(param1:LoginType)
        {
            return;
        }// end function

    }
}
