package com.tinychat.model.social.network.twitter
{
    import __AS3__.vec.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.login.*;
    import com.tinychat.services.oauth.*;
    import com.tinychat.services.social.network.twitter.*;
    import mx.collections.*;

    public class TwitterProxy extends AbstractOAuthLogin
    {
        private var service:TwitterInfoService;
        private var _friends:IdItemList;

        public function TwitterProxy(param1:TwitterInfoService, param2:OAuthLoginService)
        {
            super(param2, OAuthProvider.TWITTER);
            this.service = param1;
            this._friends = new IdItemList();
            return;
        }// end function

        public function get twitterUser() : SocialNetworkUserListItem
        {
            return _user;
        }// end function

        public function get friends() : IList
        {
            return this._friends;
        }// end function

        public function getLoginStatus() : void
        {
            this.addServiceHandlers();
            this.service.load();
            return;
        }// end function

        override protected function parseCurrentUser(param1:OAuthResponseArguments) : SocialNetworkUserListItem
        {
            return new TwitterUserListItem(new TwitterUser(param1.id, param1.name, "", param1.pictureUrl));
        }// end function

        private function infoServiceLoadedHandler(param1:TwitterUser, param2:Vector.<TwitterUser>) : void
        {
            var user:* = param1;
            var friends:* = param2;
            setCurrentUser(new TwitterUserListItem(user));
            this._friends.removeAll();
            friends.forEach(function (param1:TwitterUser, param2:int, param3:Vector.<TwitterUser>) : void
            {
                _friends.addItem(new TwitterUserListItem(param1));
                return;
            }// end function
            );
            this.removeServiceHandlers();
            loginSuccess();
            return;
        }// end function

        private function infoServiceFailedHandler(param1:String) : void
        {
            this.removeServiceHandlers();
            loginFailed(param1);
            return;
        }// end function

        private function addServiceHandlers() : void
        {
            this.service.success.add(this.infoServiceLoadedHandler);
            this.service.failure.add(this.infoServiceFailedHandler);
            return;
        }// end function

        private function removeServiceHandlers() : void
        {
            this.service.success.remove(this.infoServiceLoadedHandler);
            this.service.failure.remove(this.infoServiceFailedHandler);
            return;
        }// end function

    }
}
