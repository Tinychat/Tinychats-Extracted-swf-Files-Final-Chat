package com.tinychat.ui.components.spark
{
    import flash.events.*;

    public class RemoveableItemList extends BaseInteractiveList
    {

        public function RemoveableItemList()
        {
            return;
        }// end function

        override protected function rendererClickHandler(event:MouseEvent) : void
        {
            super.rendererClickHandler(event);
            var _loc_2:* = event.currentTarget.data;
            var _loc_3:* = dataProvider.getItemIndex(_loc_2);
            if (_loc_3 != -1)
            {
                dataProvider.removeItemAt(_loc_3);
            }
            return;
        }// end function

    }
}
