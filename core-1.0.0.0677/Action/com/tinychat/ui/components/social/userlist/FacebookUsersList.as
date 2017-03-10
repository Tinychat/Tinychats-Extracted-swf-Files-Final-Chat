package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.social.network.facebook.*;
    import com.tinychat.model.social.network.presence.*;
    import com.tinychat.ui.context.social.userslist.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class FacebookUsersList extends UsersListBase
    {
        public var showOnlineOnly:Boolean;
        private static var _skinParts:Object = {dataGroup:false, userPopupMenu:false};

        public function FacebookUsersList()
        {
            return;
        }// end function

        override protected function get filterFunction() : Function
        {
            return function (param1:Object) : Boolean
            {
                if (showOnlineOnly)
                {
                    if (param1.presence != PresenceType.ONLINE)
                    {
                        return false;
                    }
                }
                return true;
            }// end function
            ;
        }// end function

        override protected function createUserListItem(param1:RenameableUser)
        {
            return new FacebookUserListItem(param1 as FacebookUser);
        }// end function

        override protected function createContext(param1:IInjector) : IModuleContext
        {
            return new FacebookUsersListContext(this, param1);
        }// end function

        override protected function get sortCompare() : Function
        {
            return function (param1:Object, param2:Object, param3:Array = null) : int
            {
                if (param1.presence == PresenceType.ONLINE)
                {
                    if (param2.presence == PresenceType.ONLINE)
                    {
                        return nameCompare(param1, param2);
                    }
                    return -1;
                }
                else if (param1.presence == PresenceType.AWAY)
                {
                    if (param2.presence == PresenceType.ONLINE)
                    {
                        return 1;
                    }
                    if (param2.presence == PresenceType.AWAY)
                    {
                        return nameCompare(param1, param2);
                    }
                    return -1;
                }
                else
                {
                    if (param2.presence != PresenceType.OFFLINE)
                    {
                        return 1;
                    }
                    return nameCompare(param1, param2);
                }
            }// end function
            ;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
