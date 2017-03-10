package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface ProableUser
    {

        public function ProableUser();

        function get pro() : uint;

        function get proChange() : ISignal;

    }
}
