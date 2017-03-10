package com.tinychat.model.user
{

    public class PointsUser extends Object implements Identity
    {
        protected var _id:String;
        protected var _points:uint;
        protected var _achievement:String;

        public function PointsUser(param1:String, param2:uint, param3:String)
        {
            this._id = param1;
            this._points = param2;
            this._achievement = param3;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get points() : uint
        {
            return this._points;
        }// end function

        public function get achievement() : String
        {
            return this._achievement;
        }// end function

        public function toString() : String
        {
            return this._id + ", " + this._points;
        }// end function

    }
}
