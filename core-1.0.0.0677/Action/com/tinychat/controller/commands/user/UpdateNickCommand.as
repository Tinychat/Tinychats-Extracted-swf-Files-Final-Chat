package com.tinychat.controller.commands.user
{
    import com.tinychat.model.login.*;
    import com.tinychat.model.social.network.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.tumblr.*;
    import com.tinychat.model.social.network.twitter.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.utilities.macrobot.*;

    public class UpdateNickCommand extends SequenceCommand
    {
        public var users:RoomUsers;
        public var loginType:LoginType;
        private var loginProxy:SocialNetworkProxy;

        public function UpdateNickCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            switch(this.loginType)
            {
                case LoginType.FACEBOOK:
                {
                    this.loginProxy = injector.getInstance(FacebookLoginProxy) as FacebookLoginProxy;
                    break;
                }
                case LoginType.GUEST:
                {
                    this.loginProxy = injector.getInstance(GuestLogin) as GuestLogin;
                    break;
                }
                case LoginType.TUMBLR:
                {
                    this.loginProxy = injector.getInstance(TumblrLogin) as TumblrLogin;
                    break;
                }
                case LoginType.TWITTER:
                {
                    this.loginProxy = injector.getInstance(TwitterProxy) as TwitterProxy;
                    break;
                }
                case LoginType.NOT_LOGGED_IN:
                {
                }
                default:
                {
                    super.execute();
                    return;
                    break;
                }
            }
            var _loc_1:* = this.loginProxy.currentUser.name;
            var _loc_2:* = this.users.currentUser.name;
            if (_loc_1)
            {
            }
            if (_loc_1 != _loc_2)
            {
                addCommand(SetNicknameLocallyCommand, _loc_1);
                addCommand(SetNicknameRemotelyCommand, _loc_2);
            }
            super.execute();
            return;
        }// end function

    }
}
