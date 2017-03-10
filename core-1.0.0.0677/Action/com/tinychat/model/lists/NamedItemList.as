package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class NamedItemList extends AbstractItemList
    {

        public function NamedItemList(param1:Array = null)
        {
            super("name", param1);
            return;
        }// end function

        public function getItemBy(param1:Named) : Object
        {
            return _getItemBy(param1);
        }// end function

        public function removeItemBy(param1:Named) : void
        {
            _removeItemBy(param1);
            return;
        }// end function

        public function removeItemByName(param1:String) : void
        {
            _removeItemByField(param1);
            return;
        }// end function

        public function hasItemWith(param1:Named) : Boolean
        {
            return _hasItemWith(param1);
        }// end function

        public function hasItemWithName(param1:String) : Boolean
        {
            return _hasItemWithField(param1);
        }// end function

    }
}
