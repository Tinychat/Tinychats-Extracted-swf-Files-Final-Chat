package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class NameMap extends ValueMap
    {

        public function NameMap()
        {
            super("name");
            return;
        }// end function

        public function add(param1:Named) : void
        {
            _add(param1);
            return;
        }// end function

        public function remove(param1:Named) : void
        {
            _remove(param1);
            return;
        }// end function

        public function get(param1:Named) : Named
        {
            return Named(_get(param1));
        }// end function

        public function getByString(param1:String) : Named
        {
            return Named(_getByField(param1));
        }// end function

        public function has(param1:Named) : Boolean
        {
            return _has(param1);
        }// end function

        public function hasByString(param1:String) : Boolean
        {
            return _hasByField(param1);
        }// end function

        public function get list() : Array
        {
            return _list;
        }// end function

        public function forEach(param1:Function) : void
        {
            return _forEach(param1);
        }// end function

    }
}
