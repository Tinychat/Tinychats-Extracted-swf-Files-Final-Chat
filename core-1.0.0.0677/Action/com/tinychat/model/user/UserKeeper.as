package com.tinychat.model.user
{
    import UserKeeper.as$342.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;

    public class UserKeeper extends Object
    {
        private var idToUser:IdentityMap;
        private var nameToUser:NameMap;

        public function UserKeeper()
        {
            this.idToUser = new IdentityMap();
            this.nameToUser = new NameMap();
            return;
        }// end function

        public function get all() : Array
        {
            return this.idToUser.list;
        }// end function

        public function add(param1:UserIdentity) : User
        {
            var _loc_2:* = this.createUser(param1.id, param1.name, param1.account);
            this.addToMaps(_loc_2);
            return _loc_2;
        }// end function

        public function remove(param1:UserIdentity) : User
        {
            var _loc_2:* = this.userFromId(param1);
            this.removeFromMaps(_loc_2);
            return _loc_2;
        }// end function

        public function removeByName(param1:String) : void
        {
            var _loc_2:* = this.userFromName(param1);
            this.removeFromMaps(_loc_2);
            return;
        }// end function

        public function removeAll() : void
        {
            this.idToUser.forEach(this.remove);
            return;
        }// end function

        public function rename(param1:UserIdentity, param2:String) : void
        {
            this.nameToUser.remove(param1);
            this.getMutableUser(param1).rename(param2);
            this.nameToUser.add(this.getMutableUser(param1));
            return;
        }// end function

        public function op(param1:UserIdentity) : void
        {
            this.getMutableUser(param1).operator = true;
            return;
        }// end function

        public function deop(param1:UserIdentity) : void
        {
            this.getMutableUser(param1).operator = false;
            return;
        }// end function

        public function ignore(param1:UserIdentity, param2:Boolean) : void
        {
            this.getMutableUser(param1).ignore(param2);
            return;
        }// end function

        public function pro(param1:Identity, param2:uint) : void
        {
            if (this.has(param1))
            {
                this.getMutableUser(param1).pro = param2;
                ;
            }
            return;
        }// end function

        public function pointsUsers(param1:PointsUser) : void
        {
            var _loc_2:MutableUser = null;
            if (this.has(param1))
            {
                _loc_2 = this.getMutableUser(param1);
                _loc_2.points = param1.points;
                _loc_2.achievement = param1.achievement;
            }
            return;
        }// end function

        public function loggedIn(param1:Identity) : void
        {
            if (this.has(param1))
            {
                this.getMutableUser(param1).isLoggedIn = true;
            }
            return;
        }// end function

        public function userFromId(param1:Identity) : User
        {
            return User(this.idToUser.get(param1));
        }// end function

        public function userFromName(param1:String) : User
        {
            return User(this.nameToUser.getByString(param1));
        }// end function

        public function has(param1:Identity) : Boolean
        {
            return this.idToUser.has(param1);
        }// end function

        public function hasUserByName(param1:String) : Boolean
        {
            return this.nameToUser.hasByString(param1);
        }// end function

        private function addToMaps(param1:UserIdentity) : void
        {
            this.idToUser.add(param1);
            this.nameToUser.add(param1);
            return;
        }// end function

        private function removeFromMaps(param1:UserIdentity) : void
        {
            this.idToUser.remove(param1);
            this.nameToUser.remove(param1);
            return;
        }// end function

        private function createUser(param1:String, param2:String, param3:String) : User
        {
            return new MutableUser(param1, param2, param3);
        }// end function

        private function getMutableUser(param1:Identity) : MutableUser
        {
            return MutableUser(this.idToUser.get(param1));
        }// end function

    }
}
