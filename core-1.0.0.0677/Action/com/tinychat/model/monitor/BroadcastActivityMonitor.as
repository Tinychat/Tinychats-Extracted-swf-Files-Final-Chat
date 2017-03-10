package com.tinychat.model.monitor
{
    import com.tinychat.model.api.*;

    public interface BroadcastActivityMonitor extends ActivityMonitor
    {

        public function BroadcastActivityMonitor();

        function set broadcast(param1:UserBroadcast) : void;

    }
}
