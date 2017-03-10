package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;

    public class IdItemList extends AbstractItemList
    {

        public function IdItemList(param1:Array = null)
        {
            super("id", param1);
            return;
        }// end function

        public function getItemBy(param1:Identity) : Object
        {
            return _getItemBy(param1);
        }// end function

        public function getItemByIdString(param1:String) : Object
        {
            return _getItemByField(param1);
        }// end function

        public function removeItemBy(param1:Identity) : void
        {
            _removeItemBy(param1);
            return;
        }// end function

        public function hasItemWith(param1:Identity) : Boolean
        {
            return _hasItemWith(param1);
        }// end function

        public function hasItemByIdString(param1:String) : Object
        {
            return _hasItemWithField(param1);
        }// end function

    }
}
