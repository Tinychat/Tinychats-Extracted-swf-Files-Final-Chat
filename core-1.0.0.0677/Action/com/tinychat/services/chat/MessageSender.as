package com.tinychat.services.chat
{
    import com.tinychat.model.api.*;

    public interface MessageSender extends MessageLengthRestriction
    {

        public function MessageSender();

        function send(param1:String, param2:UserIdentity) : void;

    }
}
