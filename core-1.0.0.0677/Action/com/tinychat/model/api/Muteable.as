package com.tinychat.model.api
{

    public interface Muteable
    {

        public function Muteable();

        function get muted() : Boolean;

        function mute() : void;

        function unmute() : void;

    }
}
