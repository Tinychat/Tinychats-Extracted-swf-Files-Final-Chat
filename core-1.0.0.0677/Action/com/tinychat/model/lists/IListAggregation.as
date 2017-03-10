package com.tinychat.model.lists
{
    import __AS3__.vec.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.events.*;

    public class IListAggregation extends EventDispatcher implements IList
    {
        private var _lists:Vector.<IList>;

        public function IListAggregation()
        {
            this._lists = new Vector.<IList>;
            return;
        }// end function

        public function get length() : int
        {
            var _loc_1:int = 0;
            var _loc_2:uint = 0;
            while (_loc_2 < this._lists.length)
            {
                
                _loc_1 = _loc_1 + this._lists[_loc_2].length;
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        public function addItem(param1:Object) : void
        {
            this.addItemAt(param1, this._lists.length);
            return;
        }// end function

        public function addItemAt(param1:Object, param2:int) : void
        {
            var _loc_3:* = param1 as IList;
            if (_loc_3)
            {
                this._lists.splice(param2, 0, _loc_3);
                _loc_3.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            }
            return;
        }// end function

        public function getItemAt(param1:int, param2:int = 0) : Object
        {
            var _loc_5:uint = 0;
            var _loc_3:uint = 0;
            var _loc_4:uint = 0;
            while (_loc_4 < this._lists.length)
            {
                
                _loc_5 = this._lists[_loc_4].length;
                if (_loc_5 + _loc_3 > param1)
                {
                    return this._lists[_loc_4].getItemAt(param1 - _loc_3);
                }
                _loc_3 = _loc_3 + _loc_5;
                _loc_4 = _loc_4 + 1;
            }
            throw new RangeError("Index " + param1 + " exceeds collection length.");
        }// end function

        public function getItemIndex(param1:Object) : int
        {
            var _loc_2:uint = 0;
            var _loc_3:int = -1;
            var _loc_4:int = 0;
            do
            {
                
                _loc_3 = this._lists[_loc_2].getItemIndex(param1);
                if (_loc_3 == -1)
                {
                    _loc_4 = _loc_4 + this._lists[_loc_2].length;
                }
                _loc_2 = _loc_2 + 1;
                if (_loc_3 == -1)
                {
                }
            }while (_loc_2 < this._lists.length)
            return _loc_3 + _loc_4;
        }// end function

        public function itemUpdated(param1:Object, param2:Object = null, param3:Object = null, param4:Object = null) : void
        {
            return;
        }// end function

        public function removeAll() : void
        {
            this._lists.splice(0, (this._lists.length - 1));
            return;
        }// end function

        public function removeItemAt(param1:int) : Object
        {
            var _loc_2:* = this._lists.splice(param1, 1)[0];
            _loc_2.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            return _loc_2;
        }// end function

        public function setItemAt(param1:Object, param2:int) : Object
        {
            var _loc_3:* = this.removeItemAt(param2);
            this.addItemAt(param1, param2);
            return _loc_3;
        }// end function

        public function toArray() : Array
        {
            var _loc_1:Array = [];
            var _loc_2:uint = 0;
            while (_loc_2 < this._lists.length)
            {
                
                _loc_1 = _loc_1.concat(this._lists[_loc_2].toArray());
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        private function collectionChangeHandler(event:CollectionEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

    }
}
