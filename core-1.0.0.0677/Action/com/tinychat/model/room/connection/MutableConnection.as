package com.tinychat.model.room.connection
{
    import com.tinychat.model.room.connection.calls.*;
    import flash.net.*;

    public interface MutableConnection extends ImmutableConnection
    {

        public function MutableConnection();

        function connect(param1:RoomCallConnect) : void;

        function disconnect() : void;

        function call(param1:RoomMethod) : void;

        function newStream() : NetStream;

    }
}
