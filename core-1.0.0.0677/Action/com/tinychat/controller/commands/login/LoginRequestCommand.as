package com.tinychat.controller.commands.login
{
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.controller.commands.social.network.facebook.*;
    import com.tinychat.controller.commands.social.network.tumblr.*;
    import com.tinychat.controller.commands.social.network.twitter.*;
    import com.tinychat.controller.commands.user.*;
    import com.tinychat.model.login.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.tumblr.*;
    import com.tinychat.model.social.network.twitter.*;
    import org.robotlegs.mvcs.*;
    import org.robotlegs.utilities.macrobot.*;

    public class LoginRequestCommand extends SequenceCommand
    {
        public var loginSuccess:LoginSuccess;
        public var loginFailure:LoginFailure;
        public var connection:RoomConnection;
        private var loginType:LoginType;
        private var updateUsername:Boolean;
        private var args:Object;
        private var loginProxy:SocialNetworkProxy;

        public function LoginRequestCommand(param1:LoginType, param2:Boolean, param3:Object)
        {
            this.loginType = param1;
            this.updateUsername = param2;
            this.args = param3;
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:Command = null;
            switch(this.loginType)
            {
                case LoginType.FACEBOOK:
                {
                    this.loginProxy = injector.getInstance(FacebookLoginProxy) as FacebookLoginProxy;
                    _loc_1 = new FacebookLoginAndConnectToChatSequenceCommand();
                    break;
                }
                case LoginType.GUEST:
                {
                    this.loginProxy = injector.getInstance(GuestLogin) as GuestLogin;
                    _loc_1 = new GuestLoginRequestCommand(this.loginProxy as GuestLogin, this.args);
                    break;
                }
                case LoginType.TUMBLR:
                {
                    this.loginProxy = injector.getInstance(TumblrLogin) as TumblrLogin;
                    _loc_1 = new TumblrLoginRequestCommand(this.loginProxy as TumblrLogin);
                    break;
                }
                case LoginType.TWITTER:
                {
                    this.loginProxy = injector.getInstance(TwitterProxy) as TwitterProxy;
                    _loc_1 = new TwitterLoginRequestCommand(this.loginProxy as TwitterProxy);
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (injector.hasMapping(LoginType))
            {
                injector.unmap(LoginType);
            }
            injector.mapValue(LoginType, this.loginType);
            atomic = false;
            addCommandInstance(_loc_1);
            if (this.updateUsername)
            {
            }
            if (this.connection.connected)
            {
                addCommand(UpdateNickCommand);
            }
            addCompletionListener(this.completionHandler);
            super.execute();
            return;
        }// end function

        private function completionHandler(param1:Boolean) : void
        {
            if (param1)
            {
                this.loginSuccess.dispatch(this.loginProxy.currentUser);
            }
            else
            {
                this.loginFailure.dispatch("Login failed");
            }
            return;
        }// end function

    }
}
