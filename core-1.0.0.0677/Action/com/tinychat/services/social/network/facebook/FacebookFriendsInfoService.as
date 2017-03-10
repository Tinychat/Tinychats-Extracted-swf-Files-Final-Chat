package com.tinychat.services.social.network.facebook
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;

    public class FacebookFriendsInfoService extends AbstractFacebookApiService
    {

        public function FacebookFriendsInfoService()
        {
            return;
        }// end function

        public function load() : void
        {
            loadApi("/me/friends");
            return;
        }// end function

        override protected function parseSuccess(param1:Object) : Object
        {
            var _loc_3:String = null;
            var _loc_2:* = new Vector.<FacebookUser>;
            for (_loc_3 in param1)
            {
                
                _loc_2.push(new MutableFacebookUser(param1[_loc_3].id, param1[_loc_3].name, PresenceType.OFFLINE));
            }
            return _loc_2;
        }// end function

    }
}
