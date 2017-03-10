package com.tinychat.model.user
{

    public class UniqueUser extends Object implements UserIdentity
    {
        protected var _id:String;
        protected var _name:String;
        protected var _account:String;

        public function UniqueUser(param1:String, param2:String, param3:String = "")
        {
            this._id = param1;
            this._name = param2;
            this._account = param3;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get account() : String
        {
            return this._account;
        }// end function

        public function toString() : String
        {
            return this._id + ", " + this.name;
        }// end function

    }
}
