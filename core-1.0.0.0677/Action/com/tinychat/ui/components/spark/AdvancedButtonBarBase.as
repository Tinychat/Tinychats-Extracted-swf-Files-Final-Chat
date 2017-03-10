package com.tinychat.ui.components.spark
{
    import flash.events.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class AdvancedButtonBarBase extends ButtonBarBase
    {
        private var _allowDeselection:Boolean;
        private var allowDeselectionChanged:Boolean;
        private var mostRecentlySelectedItem:Object;
        private static var _skinParts:Object = {dataGroup:false};

        public function AdvancedButtonBarBase()
        {
            this._allowDeselection = true;
            addEventListener(Event.CHANGE, this.changeHandler);
            addEventListener(FlexEvent.VALUE_COMMIT, this.changeHandler);
            return;
        }// end function

        public function get hasSelectedItem() : Boolean
        {
            return selectedItem != undefined;
        }// end function

        public function set allowDeselection(param1:Boolean) : void
        {
            if (this._allowDeselection != param1)
            {
                this._allowDeselection = param1;
                this.allowDeselectionChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:IUIComponent = null;
            var _loc_2:ButtonBarButton = null;
            var _loc_3:uint = 0;
            if (!dataGroup)
            {
                return;
            }
            if (this.hasSelectedItem)
            {
                _loc_1 = dataGroup.getElementAt(_selectedIndex) as IUIComponent;
                if (_loc_1)
                {
                    if (!_loc_1.visible)
                    {
                    }
                }
                if (!_loc_1.includeInLayout)
                {
                    _proposedSelectedIndex = Math.max(0, Math.min((_selectedIndex - 1), (dataGroup.numElements - 1)));
                }
            }
            if (_proposedSelectedIndex == NO_SELECTION)
            {
            }
            if (_selectedIndex != NO_SELECTION)
            {
            }
            if (dataGroup.numElements > _selectedIndex)
            {
                _loc_2 = dataGroup.getElementAt(_selectedIndex) as ButtonBarButton;
                if (_loc_2)
                {
                }
                if (_loc_2.selected)
                {
                }
                if (!_loc_2.allowDeselection)
                {
                    _proposedSelectedIndex = _selectedIndex;
                }
            }
            if (requireSelection)
            {
            }
            if (!this.hasSelectedItem)
            {
                if (_proposedSelectedIndex != NO_PROPOSED_SELECTION)
                {
                }
            }
            if (_proposedSelectedIndex == NO_SELECTION)
            {
            }
            if (dataGroup.numElements > 0)
            {
                _proposedSelectedIndex = Math.max(0, Math.min((_selectedIndex - 1), (dataGroup.numElements - 1)));
            }
            if (this.allowDeselectionChanged)
            {
                _loc_3 = 0;
                while (_loc_3 < dataGroup.numElements)
                {
                    
                    _loc_2 = dataGroup.getElementAt(_loc_3) as ButtonBarButton;
                    if (_loc_2)
                    {
                        _loc_2.allowDeselection = this._allowDeselection;
                    }
                    _loc_3 = _loc_3 + 1;
                }
                this.allowDeselectionChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                dataGroup.addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == dataGroup)
            {
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                dataGroup.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
            }
            return;
        }// end function

        override protected function dataProvider_collectionChangeHandler(event:Event) : void
        {
            var _loc_3:int = 0;
            var _loc_2:* = event as CollectionEvent;
            if (this.mostRecentlySelectedItem)
            {
            }
            if (_loc_2)
            {
            }
            if (_loc_2.kind == CollectionEventKind.REFRESH)
            {
                _loc_3 = dataProvider.getItemIndex(this.mostRecentlySelectedItem);
                setSelectedIndex(_loc_3);
            }
            else
            {
                super.dataProvider_collectionChangeHandler(event);
            }
            return;
        }// end function

        protected function rendererAddHandler(event:RendererExistenceEvent) : void
        {
            var _loc_2:* = event.renderer as ButtonBarButton;
            if (_loc_2)
            {
                _loc_2.allowDeselection = this._allowDeselection;
            }
            return;
        }// end function

        protected function rendererRemoveHandler(event:RendererExistenceEvent) : void
        {
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this.mostRecentlySelectedItem = selectedItem;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
