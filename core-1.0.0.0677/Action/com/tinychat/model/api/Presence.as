package com.tinychat.model.api
{
    import com.tinychat.model.social.network.presence.*;
    import org.osflash.signals.*;

    public interface Presence
    {

        public function Presence();

        function get presence() : PresenceType;

        function get presenceChanged() : ISignal;

    }
}
