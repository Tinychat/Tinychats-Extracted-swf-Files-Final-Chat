package com.tinychat.model.broadcast.media
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.media.*;

    public interface MediaBroadcasts extends Broadcasts
    {

        public function MediaBroadcasts();

        function get currentBroadcast() : MediaBroadcast;

        function start(param1:Media, param2:Number, param3:UserIdentity, param4:Boolean = false) : void;

        function stop() : void;

    }
}
