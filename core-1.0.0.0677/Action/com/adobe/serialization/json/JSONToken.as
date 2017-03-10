package com.adobe.serialization.json
{

    public class JSONToken extends Object
    {
        private var _value:Object;
        private var _type:int;

        public function JSONToken(type:int = -1, value:Object = null)
        {
            this._type = type;
            this._value = value;
            return;
        }// end function

        public function get value() : Object
        {
            return this._value;
        }// end function

        public function get type() : int
        {
            return this._type;
        }// end function

        public function set type(value:int) : void
        {
            this._type = value;
            return;
        }// end function

        public function set value(v:Object) : void
        {
            this._value = v;
            return;
        }// end function

    }
}
