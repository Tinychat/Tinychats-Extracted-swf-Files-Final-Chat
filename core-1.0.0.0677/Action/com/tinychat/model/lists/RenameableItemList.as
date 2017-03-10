package com.tinychat.model.lists
{
    import com.tinychat.model.api.*;
    import untyped.*;

    public class RenameableItemList extends AbstractItemList
    {

        public function RenameableItemList(param1:Array = null)
        {
            super("name", param1);
            return;
        }// end function

        public function getItemBy(param1:Renameable) : Object
        {
            return _getItemBy(param1);
        }// end function

        public function removeItemBy(param1:Renameable) : void
        {
            _removeItemBy(param1);
            return;
        }// end function

        public function hasItemWith(param1:Renameable) : Boolean
        {
            return _hasItemWith(param1);
        }// end function

        public function hasItemWithName(param1:String) : Boolean
        {
            return _hasItemWithField(param1);
        }// end function

        override public function addItemAt(param1:Object, param2:int) : void
        {
            super.addItemAt(param1, param2);
            Renameable(param1).renamed.add(this.renamedHandler);
            return;
        }// end function

        override public function removeItemAt(param1:int) : Object
        {
            var _loc_2:* = Renameable(super.removeItemAt(param1));
            _loc_2.renamed.remove(this.renamedHandler);
            return _loc_2;
        }// end function

        private function renamedHandler(param1:String, param2:String) : void
        {
            valueMap.updateField(param1, param2);
            return;
        }// end function

    }
}
