package com.tinychat.model.api
{
    import org.osflash.signals.*;

    public interface UserBroadcast extends User, Broadcast, AudioActivity, VideoActivity, VideoFilterable
    {

        public function UserBroadcast();

        function get unpublished() : ISignal;

    }
}
