package com.tinychat.services.chat
{

    public interface MessageLengthRestriction
    {

        public function MessageLengthRestriction();

        function get maximumMessageLength() : uint;

    }
}
