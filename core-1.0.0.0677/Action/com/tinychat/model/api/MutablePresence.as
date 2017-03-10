package com.tinychat.model.api
{
    import com.tinychat.model.social.network.presence.*;

    public interface MutablePresence extends Presence
    {

        public function MutablePresence();

        function set presence(param1:PresenceType) : void;

    }
}
