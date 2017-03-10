package com.tinychat.ui.components.invite
{
    import com.tinychat.model.social.network.presence.*;

    public interface PresenceIndicator
    {

        public function PresenceIndicator();

        function set presence(param1:PresenceType) : void;

    }
}
