package com.tinychat.model.room.connection.callbacks.arguments
{
    import __AS3__.vec.*;

    public interface UsersArgument
    {

        public function UsersArgument();

        function toUsers() : Vector.<UserIdentity>;

    }
}
