package com.tinychat.model.room.connection
{
    import flash.net.*;

    public interface AS3NetConnection
    {

        public function AS3NetConnection();

        function connect(param1:String, ... args) : void;

        function call(param1:String, param2:Responder, ... args) : void;

    }
}
