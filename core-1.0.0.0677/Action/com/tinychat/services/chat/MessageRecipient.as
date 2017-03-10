package com.tinychat.services.chat
{
    import org.osflash.signals.*;

    public interface MessageRecipient
    {

        public function MessageRecipient();

        function get received() : ISignal;

    }
}
