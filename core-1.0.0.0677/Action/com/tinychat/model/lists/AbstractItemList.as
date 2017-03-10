package com.tinychat.model.lists
{
    import mx.collections.*;
    import untyped.*;

    public class AbstractItemList extends ArrayList
    {
        protected var valueMap:ValueMap;

        public function AbstractItemList(param1:String, param2:Array = null)
        {
            var field:* = param1;
            var source:* = param2;
            super(source);
            this.valueMap = new ValueMap(field);
            if (source)
            {
            }
            if (source.length > 0)
            {
                source.forEach(function (param1, param2:int, param3:Array) : void
            {
                valueMap.add(param1);
                return;
            }// end function
            );
            }
            return;
        }// end function

        override public function addItemAt(param1:Object, param2:int) : void
        {
            super.addItemAt(param1, param2);
            this.valueMap.add(param1);
            return;
        }// end function

        override public function removeItemAt(param1:int) : Object
        {
            var _loc_2:* = getItemAt(param1);
            this.valueMap.remove(_loc_2);
            return super.removeItemAt(param1);
        }// end function

        override public function removeAll() : void
        {
            this.valueMap.removeAll();
            super.removeAll();
            return;
        }// end function

        protected function _removeItemBy(param1:Object) : void
        {
            this._removeItem(this._getItemBy(param1));
            return;
        }// end function

        protected function _removeItemByField(param1:String) : void
        {
            this._removeItem(this._getItemByField(param1));
            return;
        }// end function

        protected function _getItemBy(param1:Object) : Object
        {
            return this.valueMap.get(param1);
        }// end function

        protected function _getItemByField(param1:String) : Object
        {
            return this.valueMap.getByField(param1);
        }// end function

        protected function _hasItemWith(param1:Object) : Boolean
        {
            return this.valueMap.has(param1);
        }// end function

        protected function _hasItemWithField(param1:String) : Boolean
        {
            return this.valueMap.hasByField(param1);
        }// end function

        private function _removeItem(param1:Object) : void
        {
            var _loc_2:* = getItemIndex(param1);
            this.removeItemAt(_loc_2);
            return;
        }// end function

    }
}
