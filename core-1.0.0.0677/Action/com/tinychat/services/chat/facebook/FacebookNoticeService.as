package com.tinychat.services.chat.facebook
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.services.chat.*;

    public class FacebookNoticeService extends NoticeServiceBase
    {
        private var friendsProxy:FacebookFriendsProxy;

        public function FacebookNoticeService(param1:FacebookFriendsProxy)
        {
            this.friendsProxy = param1;
            param1.presenceChange.add(this.presenceChangeHandler);
            return;
        }// end function

        private function presenceChangeHandler(param1:RenameableUser, param2:PresenceType) : void
        {
            var _loc_3:String = null;
            switch(param2)
            {
                case PresenceType.ONLINE:
                {
                    _loc_3 = param1.name + " came online.";
                    break;
                }
                case PresenceType.AWAY:
                {
                    _loc_3 = param1.name + " is away.";
                    break;
                }
                case PresenceType.OFFLINE:
                {
                    _loc_3 = param1.name + " went offline.";
                    break;
                }
                default:
                {
                    break;
                }
            }
            dispatchReceived(new TimestampedMessage(_loc_3, 0), param1);
            return;
        }// end function

    }
}
