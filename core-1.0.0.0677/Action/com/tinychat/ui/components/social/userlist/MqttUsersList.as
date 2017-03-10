package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.mqtt.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.ui.context.social.userslist.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class MqttUsersList extends UsersListBase
    {
        private static var _skinParts:Object = {dataGroup:false, userPopupMenu:false};

        public function MqttUsersList()
        {
            return;
        }// end function

        override protected function createUserListItem(param1:RenameableUser)
        {
            return new MqttUserListItem(param1 as MqttUser);
        }// end function

        override protected function createContext(param1:IInjector) : IModuleContext
        {
            return new MqttUsersListContext(this, param1);
        }// end function

        override protected function get sortCompare() : Function
        {
            return function (param1:Object, param2:Object, param3:Array = null) : int
            {
                if (param1 === param2)
                {
                    return 0;
                }
                if (param1.presence == PresenceType.ONLINE)
                {
                }
                if (param2.presence != PresenceType.ONLINE)
                {
                    return -1;
                }
                if (param1.presence != PresenceType.ONLINE)
                {
                }
                if (param2.presence == PresenceType.ONLINE)
                {
                    return 1;
                }
                if (!param1.blocked)
                {
                }
                if (param2.blocked)
                {
                    return -1;
                }
                if (param1.blocked)
                {
                }
                if (!param2.blocked)
                {
                    return 1;
                }
                return nameCompare(param1, param2);
            }// end function
            ;
        }// end function

        override protected function get filterFunction() : Function
        {
            return function (param1:Object) : Boolean
            {
                return MqttUserListItem(param1).subscribed;
            }// end function
            ;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
