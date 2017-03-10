package com.tinychat.services.vo
{

    public class TinychatUserinfo extends Object
    {
        private var _name:String;
        private var _bio:String;
        private var _location:String;
        private var _avatarUrl:String;
        private var _websiteUrl:String;
        private var _followers:uint;
        private var _following:uint;
        private var _isFollowing:Boolean;
        private var _views:uint;

        public function TinychatUserinfo(param1:String, param2:String = "", param3:String = "", param4:String = "", param5:String = "", param6:uint = 0, param7:uint = 0, param8:Boolean = false, param9:uint = 0)
        {
            this._name = param1;
            this._bio = param2;
            this._location = param3;
            this._avatarUrl = param4;
            this._websiteUrl = param5;
            this._followers = param6;
            this._following = param7;
            this._isFollowing = param8;
            this._views = param9;
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get bio() : String
        {
            return this._bio;
        }// end function

        public function get location() : String
        {
            return this._location;
        }// end function

        public function get avatarUrl() : String
        {
            return this._avatarUrl;
        }// end function

        public function get websiteUrl() : String
        {
            return this._websiteUrl;
        }// end function

        public function get followers() : uint
        {
            return this._followers;
        }// end function

        public function get following() : uint
        {
            return this._following;
        }// end function

        public function get isFollowing() : Boolean
        {
            return this._isFollowing;
        }// end function

        public function get views() : uint
        {
            return this._views;
        }// end function

        public function toString() : String
        {
            return [this.name, this.bio, this.location, this.avatarUrl, this.websiteUrl, this.followers, this.following, this.isFollowing, this.views].toString();
        }// end function

    }
}
