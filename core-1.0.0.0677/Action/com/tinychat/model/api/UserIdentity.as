package com.tinychat.model.api
{

    public interface UserIdentity extends Named, Identity
    {

        public function UserIdentity();

        function get account() : String;

    }
}
