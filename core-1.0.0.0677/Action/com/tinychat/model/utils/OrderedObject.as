package com.tinychat.model.utils
{
    import flash.utils.*;

    dynamic public class OrderedObject extends Proxy
    {
        private var properties:Array;
        private var values:Object;

        public function OrderedObject(param1:Object = null)
        {
            this.properties = [];
            this.values = {};
            if (param1)
            {
                this.parse(param1);
            }
            return;
        }// end function

        public function get length() : uint
        {
            return this.properties.length;
        }// end function

        public function concat(param1:Object) : void
        {
            var _loc_2:String = null;
            for (_loc_2 in param1)
            {
                
                this[_loc_2] = param1[_loc_2];
            }
            return;
        }// end function

        override function setProperty(param1, param2) : void
        {
            if (this.properties.indexOf(String(param1)) == -1)
            {
                this.properties.push(param1);
            }
            this.values[param1] = param2;
            return;
        }// end function

        override function getProperty(param1)
        {
            return this.values[param1];
        }// end function

        override function nextNameIndex(param1:int) : int
        {
            if (param1 < this.properties.length)
            {
                return (param1 + 1);
            }
            return 0;
        }// end function

        override function nextName(param1:int) : String
        {
            return this.properties[(param1 - 1)];
        }// end function

        override function nextValue(param1:int)
        {
            return this.values[this.properties[(param1 - 1)]];
        }// end function

        override function deleteProperty(param1) : Boolean
        {
            var _loc_2:* = this.properties.indexOf(param1);
            if (_loc_2 == -1)
            {
                return false;
            }
            delete this.values[this.properties[_loc_2]];
            this.properties.splice(_loc_2, 1);
            return true;
        }// end function

        override function hasProperty(param1) : Boolean
        {
            return this.values.hasOwnProperty(param1);
        }// end function

        override function getDescendants(param1)
        {
            return this.values[param1];
        }// end function

        public function parse(param1:Object) : void
        {
            var _loc_2:String = null;
            for (_loc_2 in param1)
            {
                
                this.setProperty(_loc_2, param1[_loc_2]);
            }
            return;
        }// end function

        public function toString() : String
        {
            return this.values.toString();
        }// end function

    }
}
