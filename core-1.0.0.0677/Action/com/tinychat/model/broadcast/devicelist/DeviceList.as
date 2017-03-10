package com.tinychat.model.broadcast.devicelist
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import flash.errors.*;

    public class DeviceList extends UntypedItemList
    {
        private var deviceNameFunction:Function;
        private var deviceGetterFunction:Function;

        public function DeviceList(param1:Function, param2:Function)
        {
            super("name");
            this.deviceNameFunction = param1;
            this.deviceGetterFunction = param2;
            return;
        }// end function

        public function refresh() : void
        {
            this.update(function (param1:Object) : Boolean
            {
                return true;
            }// end function
            );
            return;
        }// end function

        protected function update(param1:Function) : void
        {
            var _loc_3:* = undefined;
            var _loc_6:DeviceListItem = null;
            var _loc_7:uint = 0;
            var _loc_2:Array = [];
            var _loc_4:* = this.assembleAvailableInputDeviceArray();
            var _loc_5:* = this.deviceNames;
            _loc_7 = 0;
            while (_loc_7 < _loc_4.length)
            {
                
                _loc_3 = _loc_4[_loc_7];
                if (hasItemWith(_loc_3))
                {
                    _loc_6 = DeviceListItem(getItemBy(_loc_3));
                    if (this.param1(_loc_6))
                    {
                        _loc_6.device = _loc_3;
                    }
                }
                else
                {
                    _loc_6 = this.getNewListDeviceItemFrom(_loc_3);
                    addItemAt(_loc_6, 0);
                }
                _loc_7 = _loc_7 + 1;
            }
            for each (_loc_6 in this)
            {
                
                if (_loc_5.indexOf(_loc_6.name) == -1)
                {
                    _loc_2.push(_loc_6);
                }
            }
            for each (_loc_6 in _loc_2)
            {
                
                removeItemBy(_loc_6);
            }
            return;
        }// end function

        protected function assembleAvailableInputDeviceArray() : Array
        {
            var _loc_3:* = undefined;
            var _loc_1:Array = [];
            var _loc_2:uint = 0;
            while (_loc_2 < this.deviceNames.length)
            {
                
                _loc_3 = this.deviceGetterFunction.call(null, _loc_2.toString());
                if (_loc_3 != null)
                {
                    _loc_1.push(_loc_3);
                }
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        protected function getNewListDeviceItemFrom(param1:Object) : DeviceListItem
        {
            throw new IllegalOperationError("Must be overriden in subclass");
        }// end function

        private function get deviceNames() : Array
        {
            return this.deviceNameFunction.call();
        }// end function

    }
}
