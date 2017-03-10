package com.tinychat.model.api
{

    public interface Timed
    {

        public function Timed();

        function get currentTime() : Number;

        function get duration() : Number;

        function seekTo(param1:Number, param2:Boolean) : void;

    }
}
