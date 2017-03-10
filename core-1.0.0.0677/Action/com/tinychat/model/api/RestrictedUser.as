package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface RestrictedUser extends UserIdentity
    {

        public function RestrictedUser();

        function get operator() : Boolean;

        function get operatorChange() : ISignal;

    }
}
