package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import flash.net.*;

    public interface StreamBroadcastFactory
    {

        public function StreamBroadcastFactory();

        function newInstance(param1:User, param2:NetStream, param3:BroadcastPlatform) : StreamBroadcast;

    }
}
