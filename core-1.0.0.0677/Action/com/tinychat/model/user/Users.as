package com.tinychat.model.user
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.info.*;
    import org.osflash.signals.*;

    public class Users extends Object
    {
        protected var userKeeper:UserKeeper;
        private var connection:ConnectionCallbackReceiver;
        private var settings:RoomSettings;
        private var _currentUser:User;
        private var _currentUserChanged:Signal;
        private var _added:Signal;
        private var _removed:Signal;

        public function Users(param1:ConnectionCallbackReceiver, param2:RoomSettings)
        {
            this.connection = param1;
            this.settings = param2;
            this.addConnectionCallbackHandlers(this.connection);
            this.userKeeper = new UserKeeper();
            this._added = new Signal(User);
            this._removed = new Signal(User);
            this._currentUserChanged = new Signal(User, User);
            return;
        }// end function

        public function get currentUserChanged() : ISignal
        {
            return this._currentUserChanged;
        }// end function

        public function get currentUser() : User
        {
            return this._currentUser;
        }// end function

        public function isCurrentUser(param1:UserIdentity) : Boolean
        {
            if (this._currentUser)
            {
            }
            return param1.id == this._currentUser.id;
        }// end function

        public function get currentUserIsOperator() : Boolean
        {
            if (this._currentUser)
            {
            }
            return this._currentUser.operator;
        }// end function

        public function get all() : Array
        {
            return this.userKeeper.all;
        }// end function

        public function get allButCurrent() : Array
        {
            return this.all.filter(function (param1, param2:int, param3:Array) : Boolean
            {
                return param1 != currentUser;
            }// end function
            );
        }// end function

        public function get added() : ISignal
        {
            return this._added;
        }// end function

        public function get removed() : ISignal
        {
            return this._removed;
        }// end function

        public function has(param1:Identity) : Boolean
        {
            return this.userKeeper.has(param1);
        }// end function

        public function hasUserByName(param1:String) : Boolean
        {
            return this.userKeeper.hasUserByName(param1);
        }// end function

        public function userFromId(param1:Identity) : User
        {
            return this.userKeeper.userFromId(param1);
        }// end function

        public function userFromName(param1:String) : User
        {
            return this.userKeeper.userFromName(param1);
        }// end function

        protected function add(param1:UserIdentity) : void
        {
            var _loc_2:User = null;
            if (!this.userKeeper.has(param1))
            {
                _loc_2 = this.userKeeper.add(param1);
                this._added.dispatch(_loc_2);
            }
            return;
        }// end function

        protected function remove(param1:UserIdentity) : void
        {
            var _loc_2:User = null;
            if (this.userKeeper.has(param1))
            {
                _loc_2 = this.userKeeper.remove(param1);
                this._removed.dispatch(_loc_2);
                if (_loc_2 == this.currentUser)
                {
                    this._currentUser = null;
                    this._currentUserChanged.dispatch(_loc_2, null);
                }
            }
            return;
        }// end function

        protected function addConnectionCallbackHandlers(param1:ConnectionCallbackReceiver) : void
        {
            param1.connectionClosed.org.osflash.signals:ISignal::add(this.connectionClosedHandler);
            param1.registered.org.osflash.signals:ISignal::add(this.registeredHandler);
            param1.join.org.osflash.signals:ISignal::add(this.joinHandler);
            param1.joins.org.osflash.signals:ISignal::add(this.joinsHandler);
            param1.kick.org.osflash.signals:ISignal::add(this.kickHandler);
            param1.nick.org.osflash.signals:ISignal::add(this.nickHandler);
            param1.quit.org.osflash.signals:ISignal::add(this.quitHandler);
            return;
        }// end function

        private function connectionClosedHandler() : void
        {
            var _loc_1:UserIdentity = null;
            for each (_loc_1 in this.all)
            {
                
                this.remove(_loc_1);
            }
            return;
        }// end function

        private function registeredHandler(param1:UserArgument) : void
        {
            var _loc_2:* = this._currentUser;
            var _loc_3:* = param1.toUser();
            if (this.settings.type == RoomType.READONLY)
            {
            }
            if (_loc_3.name == "passenger")
            {
                _loc_3 = new UniqueUser(_loc_3.id, "guest-" + _loc_3.id);
            }
            this.add(_loc_3);
            this._currentUser = this.userKeeper.userFromId(param1.toUser());
            this._currentUserChanged.dispatch(_loc_2, this._currentUser);
            return;
        }// end function

        private function joinHandler(param1:UserArgument) : void
        {
            this.add(param1.toUser());
            return;
        }// end function

        private function joinsHandler(param1:UsersArgument) : void
        {
            var _loc_2:UserIdentity = null;
            for each (_loc_2 in param1.toUsers())
            {
                
                this.add(_loc_2);
                this.userKeeper.loggedIn(_loc_2);
            }
            return;
        }// end function

        private function kickHandler(param1:UserArgument) : void
        {
            this.remove(param1.toUser());
            return;
        }// end function

        private function nickHandler(param1:RoomCallbackNickArguments) : void
        {
            this.userKeeper.rename(param1.toUser(), param1.newName);
            this.userKeeper.loggedIn(param1.toUser());
            return;
        }// end function

        private function quitHandler(param1:RoomCallbackQuitArguments) : void
        {
            this.remove(this.userKeeper.userFromName(param1.name));
            return;
        }// end function

    }
}
