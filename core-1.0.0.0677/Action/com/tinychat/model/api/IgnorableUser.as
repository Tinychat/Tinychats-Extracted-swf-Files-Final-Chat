package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface IgnorableUser extends UserIdentity
    {

        public function IgnorableUser();

        function get ignored() : Boolean;

        function get ignoreChange() : ISignal;

    }
}
