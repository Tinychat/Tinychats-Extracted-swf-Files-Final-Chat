package com.tinychat.ui.components.social.buttonbar
{
    import com.tinychat.ui.components.spark.*;
    import mx.core.*;
    import spark.components.*;

    public class SocialButtonBar extends AdvancedButtonBarBase
    {
        public static const EFFECTS_CONTAINER:String = "effectsContainer";
        public static const FACEBOOK_LIST_CONTAINER:String = "facebookListContainer";
        public static const GREENROOM_LIST_CONTAINER:String = "greenRoomListContainer";
        public static const MQTT_LIST_CONTAINER:String = "mqttListContainer";
        public static const PRIVATE_CHAT_LIST_CONTAINER:String = "privateChatListContainer";
        public static const PUBLIC_CHAT_LIST_CONTAINER:String = "publicChatListContainer";
        public static const USERS_LIST_CONTAINER:String = "usersListContainer";
        public static const GIFT_USERS_LIST_CONTAINER:String = "giftUsersListContainer";
        private static var _skinParts:Object = {dataGroup:false};

        public function SocialButtonBar()
        {
            requireSelection = true;
            itemRendererFunction = function (param1:Object) : IFactory
            {
                switch(param1.name)
                {
                    case EFFECTS_CONTAINER:
                    {
                        return new ClassFactory(EffectsButtonBarButton);
                    }
                    case FACEBOOK_LIST_CONTAINER:
                    {
                        return new ClassFactory(FacebookButtonBarButton);
                    }
                    case GREENROOM_LIST_CONTAINER:
                    {
                        return new ClassFactory(GreenRoomButtonBarButton);
                    }
                    case MQTT_LIST_CONTAINER:
                    {
                        return new ClassFactory(MqttButtonBarButton);
                    }
                    case PUBLIC_CHAT_LIST_CONTAINER:
                    {
                        return new ClassFactory(PublicChatListButtonBarButton);
                    }
                    case PRIVATE_CHAT_LIST_CONTAINER:
                    {
                        return new ClassFactory(PrivateChatListButtonBarButton);
                    }
                    case USERS_LIST_CONTAINER:
                    {
                        return new ClassFactory(UsersListButtonBarButton);
                    }
                    default:
                    {
                        return new ClassFactory(ButtonBarButton);
                        ;
                    }
                }
            }// end function
            ;
            return;
        }// end function

        public function set selectedContainer(param1:String) : void
        {
            var _loc_3:Object = null;
            var _loc_2:uint = 0;
            while (_loc_2 < dataProvider.length)
            {
                
                _loc_3 = dataProvider.getItemAt(_loc_2);
                if (_loc_3.name == param1)
                {
                    selectedItem = _loc_3;
                    return;
                }
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function containsContainer(param1:String) : Boolean
        {
            var _loc_3:Object = null;
            var _loc_2:uint = 0;
            while (_loc_2 < dataProvider.length)
            {
                
                _loc_3 = dataProvider.getItemAt(_loc_2);
                if (_loc_3)
                {
                }
                if (_loc_3.name == param1)
                {
                    return true;
                }
                _loc_2 = _loc_2 + 1;
            }
            return false;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
