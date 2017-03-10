package com.tinychat.ui.screensequence
{

    public interface Sequenced
    {

        public function Sequenced();

        function set goPrevious(param1:GoPrevious) : void;

        function set goNext(param1:GoNext) : void;

        function set complete(param1:GoComplete) : void;

        function get hasNext() : Boolean;

        function get hasPrevious() : Boolean;

    }
}
