package com.tinychat.model.lists
{
    import untyped.*;

    public class ValueMap extends Object
    {
        private var field:String;
        private var valueMap:Object;

        public function ValueMap(param1:String)
        {
            this.field = param1;
            this.valueMap = {};
            return;
        }// end function

        function add(param1:Object) : void
        {
            this._add(param1);
            return;
        }// end function

        function remove(param1:Object) : void
        {
            this._remove(param1);
            return;
        }// end function

        function removeAll() : void
        {
            this._removeAll();
            return;
        }// end function

        function get(param1:Object) : Object
        {
            return this._get(param1);
        }// end function

        function getByField(param1:String) : Object
        {
            return this._getByField(param1);
        }// end function

        function has(param1:Object) : Boolean
        {
            return this._has(param1);
        }// end function

        function hasByField(param1:String) : Boolean
        {
            return this._hasByField(param1);
        }// end function

        function updateField(param1:String, param2:String) : void
        {
            this._updateField(param1, param2);
            return;
        }// end function

        function get list() : Array
        {
            return this._list;
        }// end function

        function get length() : uint
        {
            return this._length;
        }// end function

        function forEach(param1:Function) : void
        {
            this._forEach(param1);
            return;
        }// end function

        protected function _add(param1:Object) : void
        {
            if (this.field == "name")
            {
                this.valueMap[String(param1[this.field]).toLowerCase()] = param1;
                return;
            }
            this.valueMap[param1[this.field]] = param1;
            return;
        }// end function

        protected function _remove(param1:Object) : void
        {
            if (this.field == "name")
            {
                delete this.valueMap[String(param1[this.field]).toLowerCase()];
                return;
            }
            delete this.valueMap[param1[this.field]];
            return;
        }// end function

        protected function _removeAll() : void
        {
            var _loc_1:String = null;
            for (_loc_1 in this.valueMap)
            {
                
                delete this.valueMap[_loc_1];
            }
            return;
        }// end function

        protected function _get(param1:Object) : Object
        {
            if (this.field == "name")
            {
                return this.valueMap[String(param1[this.field]).toLowerCase()];
            }
            return this.valueMap[param1[this.field]];
        }// end function

        protected function _getByField(param1:String) : Object
        {
            if (this.field == "name")
            {
                return this.valueMap[param1.toLowerCase()];
            }
            return this.valueMap[param1];
        }// end function

        protected function _has(param1:Object) : Boolean
        {
            if (this.field == "name")
            {
                if (param1)
                {
                }
                return this.valueMap.hasOwnProperty([String(param1[this.field]).toLowerCase()]);
            }
            if (param1)
            {
            }
            return this.valueMap.hasOwnProperty([param1[this.field]]);
        }// end function

        protected function _hasByField(param1:String) : Boolean
        {
            if (this.field == "name")
            {
                return this.valueMap.hasOwnProperty(param1.toLowerCase());
            }
            return this.valueMap.hasOwnProperty(param1);
        }// end function

        protected function _updateField(param1:String, param2:String) : void
        {
            var _loc_3:* = this._getByField(param1);
            if (this.field == "name")
            {
                delete this.valueMap[param1.toLowerCase()];
            }
            else
            {
                delete this.valueMap[param1];
            }
            this._add(_loc_3);
            return;
        }// end function

        protected function get _list() : Array
        {
            var _loc_2:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in this.valueMap)
            {
                
                _loc_1.push(this.valueMap[_loc_2]);
            }
            return _loc_1;
        }// end function

        protected function get _length() : uint
        {
            var _loc_2:String = null;
            var _loc_1:uint = 0;
            for (_loc_2 in this.valueMap)
            {
                
                _loc_1 = _loc_1 + 1;
            }
            return _loc_1;
        }// end function

        protected function _forEach(param1:Function) : void
        {
            var _loc_2:String = null;
            for (_loc_2 in this.valueMap)
            {
                
                param1.call(null, this.valueMap[_loc_2]);
            }
            return;
        }// end function

    }
}
