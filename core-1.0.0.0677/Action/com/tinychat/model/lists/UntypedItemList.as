package com.tinychat.model.lists
{

    public class UntypedItemList extends AbstractItemList
    {

        public function UntypedItemList(param1:String, param2:Array = null)
        {
            super(param1, param2);
            return;
        }// end function

        public function removeItemBy(param1:Object) : void
        {
            _removeItemBy(param1);
            return;
        }// end function

        public function getItemBy(param1:Object) : Object
        {
            return _getItemBy(param1);
        }// end function

        public function hasItemWith(param1:Object) : Boolean
        {
            return _hasItemWith(param1);
        }// end function

    }
}
