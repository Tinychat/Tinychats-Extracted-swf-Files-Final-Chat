package com.tinychat.model.utils.iterator
{

    public interface Iterator
    {

        public function Iterator();

        function hasNext() : Boolean;

        function next();

        function reset() : void;

    }
}
