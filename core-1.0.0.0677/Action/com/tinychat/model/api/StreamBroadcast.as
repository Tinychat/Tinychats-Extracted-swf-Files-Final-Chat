package com.tinychat.model.api
{
    import com.tinychat.model.broadcast.base.*;

    public interface StreamBroadcast extends UserBroadcast, StreamingVideoAttachable, MasterSoundControllable, Hideable
    {

        public function StreamBroadcast();

        function get platform() : BroadcastPlatform;

    }
}
