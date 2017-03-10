package com.tinychat.services
{
    import org.osflash.signals.*;

    public interface AsyncService
    {

        public function AsyncService();

        function get success() : ISignal;

        function get failure() : ISignal;

    }
}
