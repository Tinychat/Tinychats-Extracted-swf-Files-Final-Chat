package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class IdentityMap extends ValueMap
    {

        public function IdentityMap()
        {
            super("id");
            return;
        }// end function

        public function add(param1:Identity) : void
        {
            _add(param1);
            return;
        }// end function

        public function remove(param1:Identity) : void
        {
            _remove(param1);
            return;
        }// end function

        public function removeAll() : void
        {
            _removeAll();
            return;
        }// end function

        public function get(param1:Identity) : Identity
        {
            return Identity(_get(param1));
        }// end function

        public function getByField(param1:String) : Identity
        {
            return Identity(_getByField(param1));
        }// end function

        public function has(param1:Identity) : Boolean
        {
            return _has(param1);
        }// end function

        public function get list() : Array
        {
            return _list;
        }// end function

        public function get length() : uint
        {
            return _length;
        }// end function

        public function forEach(param1:Function) : void
        {
            return _forEach(param1);
        }// end function

    }
}
