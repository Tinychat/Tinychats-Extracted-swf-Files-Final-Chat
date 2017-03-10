package com.tinychat.model.social.network.facebook
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.services.social.network.facebook.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class FacebookFriendsProxy extends Object
    {
        private var friendsService:FacebookFriendsInfoService;
        private var presenceService:FacebookPresenceService;
        private var identityList:IdItemList;
        private var _presenceChange:Signal;

        public function FacebookFriendsProxy(param1:FacebookFriendsInfoService, param2:FacebookPresenceService)
        {
            this.friendsService = param1;
            this.presenceService = param2;
            param1.success.add(this.friendsServiceSuccessHandler);
            param2.presenceChange.add(this.presenceChangeHandler);
            this.identityList = new IdItemList();
            this._presenceChange = new Signal(RenameableUser, PresenceType);
            return;
        }// end function

        public function get presenceChange() : ISignal
        {
            return this._presenceChange;
        }// end function

        public function get list() : IList
        {
            return this.identityList;
        }// end function

        public function getFriendById(param1:Identity) : FacebookUser
        {
            return this.identityList.getItemBy(param1) as FacebookUser;
        }// end function

        public function getFriendByIdString(param1:String) : FacebookUser
        {
            return this.identityList.getItemByIdString(param1) as FacebookUser;
        }// end function

        private function friendsServiceSuccessHandler(param1:Vector.<FacebookUser>) : void
        {
            var friends:* = param1;
            this.identityList.removeAll();
            friends.forEach(function (param1:FacebookUser, param2:int, param3:Vector.<FacebookUser>) : void
            {
                identityList.addItem(param1);
                return;
            }// end function
            );
            return;
        }// end function

        private function presenceChangeHandler(param1:FacebookIdentityPresence) : void
        {
            var _loc_2:* = this.identityList.getItemBy(param1) as MutableFacebookUser;
            if (_loc_2)
            {
            }
            if (_loc_2.presence != param1.presence)
            {
                _loc_2.presence = param1.presence;
                this._presenceChange.dispatch(_loc_2, _loc_2.presence);
            }
            return;
        }// end function

    }
}
