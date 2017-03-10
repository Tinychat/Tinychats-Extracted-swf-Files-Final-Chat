package com.tinychat.services.chat.mqtt
{
    import com.tinychat.model.social.chat.message.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.services.chat.*;

    public class MqttNoticeService extends NoticeServiceBase
    {
        private var proxy:MqttProxy;

        public function MqttNoticeService(param1:MqttProxy)
        {
            this.proxy = param1;
            this.proxy.blockedChange.add(this.blockedChangeHandler);
            this.proxy.presenceChange.add(this.presenceChangeHandler);
            return;
        }// end function

        private function blockedChangeHandler(param1:MqttUser, param2:Boolean) : void
        {
            var _loc_3:String = null;
            if (param2)
            {
                _loc_3 = "You have blocked " + param1.name + ".";
            }
            else
            {
                _loc_3 = "You have unblocked " + param1.name + ".";
            }
            dispatchReceived(new TimestampedMessage(_loc_3, 0), param1);
            return;
        }// end function

        private function presenceChangeHandler(param1:MqttUser, param2:PresenceType) : void
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
