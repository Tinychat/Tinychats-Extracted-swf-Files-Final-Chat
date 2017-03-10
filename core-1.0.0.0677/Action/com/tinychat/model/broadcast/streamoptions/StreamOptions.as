package com.tinychat.model.broadcast.streamoptions
{
    import flash.net.*;

    public interface StreamOptions
    {

        public function StreamOptions();

        function apply(param1:NetStream) : void;

    }
}
