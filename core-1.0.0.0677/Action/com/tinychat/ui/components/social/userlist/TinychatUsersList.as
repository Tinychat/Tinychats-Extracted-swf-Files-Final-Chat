package com.tinychat.ui.components.social.userlist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.business.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.context.social.userslist.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;

    public class TinychatUsersList extends UsersListBase
    {
        private var _currentUser:User;
        private static var _skinParts:Object = {dataGroup:false, userPopupMenu:false};

        public function TinychatUsersList()
        {
            return;
        }// end function

        public function set currentUser(param1:User) : void
        {
            var _loc_2:TinychatUserListItem = null;
            if (this._currentUser)
            {
            }
            if (_dataProvider.hasItemWith(this._currentUser))
            {
                _loc_2 = TinychatUserListItem(_dataProvider.getItemBy(this._currentUser));
                _loc_2.isCurrentUser = false;
            }
            this._currentUser = param1;
            if (this._currentUser)
            {
            }
            if (_dataProvider.hasItemWith(this._currentUser))
            {
                _loc_2 = TinychatUserListItem(_dataProvider.getItemBy(this._currentUser));
                _loc_2.isCurrentUser = true;
            }
            return;
        }// end function

        public function setBroadcaster(param1:Identity, param2:Boolean) : void
        {
            var _loc_3:TinychatUserListItem = null;
            if (_dataProvider.hasItemWith(param1))
            {
                _loc_3 = TinychatUserListItem(_dataProvider.getItemBy(param1));
                _loc_3.broadcasting = param2;
            }
            return;
        }// end function

        override protected function createUserListItem(param1:RenameableUser)
        {
            return new TinychatUserListItem(param1 as User);
        }// end function

        override protected function createContext(param1:IInjector) : IModuleContext
        {
            return new TinychatUsersListContext(this, param1);
        }// end function

        override protected function get sortCompare() : Function
        {
            return function (param1:Object, param2:Object, param3:Array = null) : int
            {
                if (param1 === param2)
                {
                    return 0;
                }
                if (Roles.isGold(param1.pro))
                {
                    Roles.isGold(param1.pro);
                }
                if (!Roles.isGold(param2.pro))
                {
                    return -1;
                }
                if (!Roles.isGold(param1.pro))
                {
                }
                if (Roles.isGold(param2.pro))
                {
                    return 1;
                }
                if (Roles.isGold(param1.pro))
                {
                    Roles.isGold(param1.pro);
                }
                if (Roles.isGold(param2.pro))
                {
                    return giftCompare(param1, param2);
                }
                if (Roles.isExtreme(param1.pro))
                {
                    Roles.isExtreme(param1.pro);
                }
                if (!Roles.isExtreme(param2.pro))
                {
                    return -1;
                }
                if (!Roles.isExtreme(param1.pro))
                {
                }
                if (Roles.isExtreme(param2.pro))
                {
                    return 1;
                }
                if (Roles.isExtreme(param1.pro))
                {
                    Roles.isExtreme(param1.pro);
                }
                if (Roles.isExtreme(param2.pro))
                {
                    return giftCompare(param1, param2);
                }
                if (Roles.isPro(param1.pro))
                {
                    Roles.isPro(param1.pro);
                }
                if (!Roles.isPro(param2.pro))
                {
                    return -1;
                }
                if (!Roles.isPro(param1.pro))
                {
                }
                if (Roles.isPro(param2.pro))
                {
                    return 1;
                }
                if (Roles.isPro(param1.pro))
                {
                    Roles.isPro(param1.pro);
                }
                if (Roles.isPro(param2.pro))
                {
                    return giftCompare(param1, param2);
                }
                if (param1.operator)
                {
                }
                if (!param2.operator)
                {
                    return -1;
                }
                if (param2.operator)
                {
                }
                if (!param1.operator)
                {
                    return 1;
                }
                if (param1.operator)
                {
                }
                if (param2.operator)
                {
                    return giftCompare(param1, param2);
                }
                if (param1.broadcasting)
                {
                }
                if (!param2.broadcasting)
                {
                    return -1;
                }
                if (param2.broadcasting)
                {
                }
                if (!param1.broadcasting)
                {
                    return 1;
                }
                if (param1.broadcasting)
                {
                }
                if (param2.broadcasting)
                {
                    return giftCompare(param1, param2);
                }
                return giftCompare(param1, param2);
            }// end function
            ;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
