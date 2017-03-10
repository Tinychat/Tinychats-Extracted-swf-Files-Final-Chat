package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;
    import flash.events.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class TinychatUserListItem extends EventDispatcher implements User, Disposable
    {
        private var user:User;
        private var _operator:Boolean;
        private var _broadcasting:Boolean;
        private var _isCurrentUser:Boolean;

        public function TinychatUserListItem(param1:User, param2:Boolean = false)
        {
            this.user = param1;
            this._operator = param1.operator;
            this._isCurrentUser = param2;
            param1.ignoreChange.add(this.ignoreChangeHandler);
            param1.operatorChange.add(this.operatorChangeHandler);
            param1.proChange.add(this.proChangeHandler);
            param1.achievementChange.add(this.achievementChangeHandler);
            param1.renamed.add(this.renamedHandler);
            return;
        }// end function

        public function get id() : String
        {
            return this.user.id;
        }// end function

        public function get name() : String
        {
            return this.user.name;
        }// end function

        public function get renamed() : ISignal
        {
            return this.user.renamed;
        }// end function

        public function get account() : String
        {
            return this.user.account;
        }// end function

        public function get operator() : Boolean
        {
            return this.user.operator;
        }// end function

        public function get isCurrentUser() : Boolean
        {
            return this._isCurrentUser;
        }// end function

        public function set isCurrentUser(param1:Boolean) : void
        {
            if (this._isCurrentUser != param1)
            {
                this._isCurrentUser = param1;
                dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "isCurrentUser", !this._isCurrentUser, this._isCurrentUser, this));
            }
            return;
        }// end function

        public function get ignored() : Boolean
        {
            return this.user.ignored;
        }// end function

        public function get ignoreChange() : ISignal
        {
            return this.user.ignoreChange;
        }// end function

        public function get pro() : uint
        {
            return this.user.pro;
        }// end function

        public function get proChange() : ISignal
        {
            return this.user.proChange;
        }// end function

        public function get points() : uint
        {
            return this.user.points;
        }// end function

        public function get pointsChange() : ISignal
        {
            return this.user.pointsChange;
        }// end function

        public function get achievement() : String
        {
            return this.user.achievement;
        }// end function

        public function get achievementChange() : ISignal
        {
            return this.user.achievementChange;
        }// end function

        public function get isLoggedIn() : Boolean
        {
            return this.user.isLoggedIn;
        }// end function

        public function get broadcasting() : Boolean
        {
            return this._broadcasting;
        }// end function

        public function set broadcasting(param1:Boolean) : void
        {
            if (this._broadcasting != param1)
            {
                this._broadcasting = param1;
                dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "broadcasting", !param1, param1, this));
            }
            return;
        }// end function

        public function get operatorChange() : ISignal
        {
            return this.user.operatorChange;
        }// end function

        public function dispose() : void
        {
            this.user.ignoreChange.remove(this.ignoreChangeHandler);
            this.user.operatorChange.remove(this.operatorChangeHandler);
            this.user.proChange.remove(this.proChangeHandler);
            this.user.achievementChange.remove(this.achievementChangeHandler);
            this.user.renamed.remove(this.renamedHandler);
            return;
        }// end function

        private function renamedHandler(param1:String, param2:String) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "name", param1, param2, this));
            return;
        }// end function

        private function operatorChangeHandler(param1:Boolean) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "operator", !this.user.operator, this.user.operator, this));
            return;
        }// end function

        private function ignoreChangeHandler(param1:Boolean) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "ignored", !param1, param1, this));
            return;
        }// end function

        private function proChangeHandler(param1:Boolean) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "pro", !param1, param1, this));
            return;
        }// end function

        private function pointsChangeHandler(param1:String, param2:String) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "points", param1, param2, this));
            return;
        }// end function

        private function achievementChangeHandler(param1:String) : void
        {
            dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, false, false, PropertyChangeEventKind.UPDATE, "achievement", null, param1, this));
            return;
        }// end function

    }
}
