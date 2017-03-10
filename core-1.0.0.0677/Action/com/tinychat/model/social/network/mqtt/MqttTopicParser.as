package com.tinychat.model.social.network.mqtt
{

    public class MqttTopicParser extends Object
    {
        private static const pattern:RegExp = /(\w)\/(\w+)\/?(\w{1,2})?\/?(\w+)?/;

        public function MqttTopicParser()
        {
            return;
        }// end function

        public static function parse(param1:String) : MqttTopic
        {
            var _loc_2:MqttTopic = null;
            var _loc_3:* = pattern.exec(param1);
            if (_loc_3)
            {
            }
            var _loc_4:* = _loc_3.length > 1 ? (_loc_3[1]) : ("");
            if (_loc_3)
            {
            }
            var _loc_5:* = _loc_3.length > 2 ? (_loc_3[2]) : ("");
            if (_loc_3)
            {
            }
            var _loc_6:* = _loc_3.length > 3 ? (_loc_3[3]) : ("");
            if (_loc_3)
            {
            }
            var _loc_7:* = _loc_3.length > 4 ? (_loc_3[4]) : ("");
            switch(_loc_4)
            {
                case "m":
                {
                    _loc_2 = messageTopicResultHandler(_loc_6, _loc_5, _loc_7);
                    break;
                }
                case "u":
                {
                    _loc_2 = userTopicResultHandler(_loc_6, _loc_5, _loc_7);
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (!_loc_2)
            {
                _loc_2 = new MqttTopic(MqttTopic.INVALID);
            }
            return _loc_2;
        }// end function

        private static function messageTopicResultHandler(param1:String, param2:String, param3:String) : MqttTopic
        {
            var _loc_4:MqttTopic = null;
            switch(param1)
            {
                case "b":
                {
                    _loc_4 = new MqttTopic(MqttTopic.USER_BLOCKED, param3);
                    break;
                }
                case "f":
                {
                    _loc_4 = new MqttTopic(MqttTopic.MESSAGE_FROM_USER, param2, param3);
                    break;
                }
                case "o":
                {
                    _loc_4 = new MqttTopic(MqttTopic.ONLINE_OFFLINE_PRESENCE_UPDATE, param2);
                    break;
                }
                case "ub":
                {
                    _loc_4 = new MqttTopic(MqttTopic.USER_UNBLOCKED, param3);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return _loc_4;
        }// end function

        private static function userTopicResultHandler(param1:String, param2:String, param3:String) : MqttTopic
        {
            var _loc_4:MqttTopic = null;
            switch(param1)
            {
                case "p":
                {
                    _loc_4 = new MqttTopic(MqttTopic.USER_PRESENCE_UPDATE, param2);
                    break;
                }
                default:
                {
                    _loc_4 = new MqttTopic(MqttTopic.USER, param2);
                    break;
                    break;
                }
            }
            return _loc_4;
        }// end function

    }
}
