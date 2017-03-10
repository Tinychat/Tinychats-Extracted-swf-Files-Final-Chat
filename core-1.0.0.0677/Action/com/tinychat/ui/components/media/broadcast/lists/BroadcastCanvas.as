package com.tinychat.ui.components.broadcast.lists
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.layout.*;
    import com.tinychat.model.utils.iterator.*;
    import com.tinychat.ui.layouts.video.*;
    import mx.collections.*;
    import mx.events.*;

    public class BroadcastCanvas extends BroadcastList
    {
        private var layoutFactory:VideoLayoutFactory;
        private var currentLayout:String;
        private var _broadcastLayout:BroadcastLayouts;
        private var _selectedItem:Broadcast;
        private var sort:Sort;
        private var selectedItemChanged:Boolean;

        public function BroadcastCanvas()
        {
            this.layoutFactory = new VideoLayoutFactory();
            return;
        }// end function

        public function get selectedItem() : Broadcast
        {
            return this._selectedItem;
        }// end function

        public function set selectedItem(param1:Broadcast) : void
        {
            if (this._selectedItem != param1)
            {
                this._selectedItem = param1;
                this.selectedItemChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get broadcastLayout() : BroadcastLayouts
        {
            return this._broadcastLayout;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.selectedItemChanged)
            {
                this.updateLayout();
                this.selectedItemChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function dataProviderChangedHandler(param1:ListCollectionView) : void
        {
            if (!this.sort)
            {
                this.sort = new Sort();
                this.sort.compareFunction = this.sortFunction;
            }
            param1.sort = this.sort;
            param1.refresh();
            super.dataProviderChangedHandler(param1);
            return;
        }// end function

        override protected function initializationComplete() : void
        {
            super.initializationComplete();
            this.changeLayout(BroadcastLayouts.ROWS);
            return;
        }// end function

        override protected function collectionAddHandler(event:CollectionEvent) : void
        {
            super.collectionAddHandler(event);
            this.updateLayout();
            return;
        }// end function

        override protected function collectionRemoveHandler(event:CollectionEvent) : void
        {
            super.collectionRemoveHandler(event);
            var _loc_2:* = new ArrayIterator(event.items);
            do
            {
                
                if (this._selectedItem == _loc_2.next())
                {
                    this._selectedItem = null;
                }
                if (this._selectedItem)
                {
                }
            }while (_loc_2.hasNext())
            this.updateLayout();
            return;
        }// end function

        override protected function collectionRefreshHandler(event:CollectionEvent) : void
        {
            super.collectionRefreshHandler(event);
            updateSort();
            return;
        }// end function

        private function updateLayout() : void
        {
            if (this._selectedItem)
            {
            }
            if (_dataProvider.length > 1)
            {
                this.changeLayout(BroadcastLayouts.PROMOTED);
            }
            else
            {
                this.changeLayout(BroadcastLayouts.ROWS);
            }
            _dataProvider.refresh();
            return;
        }// end function

        private function changeLayout(param1:BroadcastLayouts) : void
        {
            if (this._broadcastLayout != param1)
            {
                layout = this.layoutFactory.newInstance(param1);
                this._broadcastLayout = param1;
            }
            return;
        }// end function

        private function sortFunction(param1:Object, param2:Object, param3:Array = null) : int
        {
            var _loc_4:* = param1 as Broadcast;
            var _loc_5:* = param2 as Broadcast;
            if (_loc_4 == _loc_5)
            {
                return 0;
            }
            if (this._selectedItem)
            {
                if (_loc_4)
                {
                }
                if (_loc_4.id == this._selectedItem.id)
                {
                    return -1;
                }
                if (_loc_5)
                {
                }
                if (_loc_5.id == this._selectedItem.id)
                {
                    return 1;
                }
            }
            return 0;
        }// end function

    }
}
