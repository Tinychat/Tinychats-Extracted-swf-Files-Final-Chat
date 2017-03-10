package com.tinychat.model.room.connection
{
    import flash.net.*;

    public class RoomNetConnection extends Object implements AS3NetConnection
    {
        private var decorated:NetConnection;

        public function RoomNetConnection(param1:NetConnection)
        {
            this.decorated = param1;
            return;
        }// end function

        public function get connection() : NetConnection
        {
            return this.decorated;
        }// end function

        public function connect(param1:String, ... args) : void
        {
            this.decorated.connect.apply(null, [param1].concat(args));
            return;
        }// end function

        public function call(param1:String, param2:Responder, ... args) : void
        {
            this.decorated.call.apply(null, [param1, param2].concat(args));
            return;
        }// end function

    }
}
