package com.tinychat.ui.components.spark
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.events.*;
    import org.osflash.signals.*;

    public class MultipleSelectionList extends BaseInteractiveList
    {
        private var _selectedItems:Vector.<Selectable>;
        private var selectedItemsInvalidated:Boolean;
        private var _selectionChange:Signal;

        public function MultipleSelectionList()
        {
            this._selectedItems = new Vector.<Selectable>;
            this._selectionChange = new Signal(Selectable);
            return;
        }// end function

        public function get selectionChange() : ISignal
        {
            return this._selectionChange;
        }// end function

        public function get selectedItems() : Vector.<Selectable>
        {
            if (this.selectedItemsInvalidated)
            {
                this.calculateSelectedItems();
            }
            return this._selectedItems;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (dataProvider)
            {
                dataProvider.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            }
            super.dataProvider = param1;
            if (dataProvider)
            {
                dataProvider.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.collectionChangeHandler);
            }
            return;
        }// end function

        private function calculateSelectedItems() : void
        {
            var _loc_2:Selectable = null;
            this._selectedItems = new Vector.<Selectable>;
            var _loc_1:uint = 0;
            while (_loc_1 < dataProvider.length)
            {
                
                _loc_2 = Selectable(dataProvider.getItemAt(_loc_1));
                if (_loc_2.selected)
                {
                    this._selectedItems.push(_loc_2);
                }
                _loc_1 = _loc_1 + 1;
            }
            this.selectedItemsInvalidated = false;
            return;
        }// end function

        private function collectionChangeHandler(event:CollectionEvent) : void
        {
            if (event.kind != CollectionEventKind.REFRESH)
            {
            }
            if (event.kind != CollectionEventKind.REMOVE)
            {
            }
            if (event.kind != CollectionEventKind.REPLACE)
            {
            }
            if (event.kind == CollectionEventKind.RESET)
            {
                this.selectedItemsInvalidated = true;
            }
            return;
        }// end function

        override protected function rendererClickHandler(event:MouseEvent) : void
        {
            super.rendererClickHandler(event);
            var _loc_2:* = Selectable(event.currentTarget.data);
            _loc_2.selected = !_loc_2.selected;
            if (_loc_2.selected)
            {
                this._selectedItems.push(_loc_2);
            }
            else
            {
                this._selectedItems.splice(this._selectedItems.indexOf(_loc_2), 1);
            }
            this._selectionChange.dispatch(_loc_2);
            return;
        }// end function

    }
}
