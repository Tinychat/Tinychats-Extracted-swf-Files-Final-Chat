package com.tinychat.model.api
{

    public interface User extends RestrictedUser, RenameableUser, IgnorableUser, ProableUser, GiftPoints, Achievement
    {

        public function User();

        function get isLoggedIn() : Boolean;

    }
}
