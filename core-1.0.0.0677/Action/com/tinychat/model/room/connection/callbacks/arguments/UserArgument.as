package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;

    public interface UserArgument
    {

        public function UserArgument();

        function toUser() : UserIdentity;

    }
}
