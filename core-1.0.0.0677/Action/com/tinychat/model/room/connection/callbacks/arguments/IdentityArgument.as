package com.tinychat.model.room.connection.callbacks.arguments
{
    import com.tinychat.model.api.*;

    public interface IdentityArgument
    {

        public function IdentityArgument();

        function toIdentity() : Identity;

    }
}
