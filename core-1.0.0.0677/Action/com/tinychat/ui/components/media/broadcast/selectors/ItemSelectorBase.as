package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.core.*;

    public class ItemSelectorBase extends AdvancedButtonBarBase implements ItemSelector
    {
        public var iconItemRenderer:IFactory;
        protected var userHasMadeSelection:Boolean;
        protected var _preselectedItemName:String;
        private var preselectedItemChanged:Boolean;
        private static var _skinParts:Object = {iconItemRenderer:true, dataGroup:false};

        public function ItemSelectorBase()
        {
            labelField = "";
            itemRendererFunction = this.defaultItemRendererFunction;
            addEventListener(Event.CHANGE, this.changeHandler);
            return;
        }// end function

        public function get preselectedItemName() : String
        {
            return this._preselectedItemName;
        }// end function

        public function set preselectedItemName(param1:String) : void
        {
            this._preselectedItemName = param1;
            this.preselectedItemChanged = true;
            invalidateProperties();
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (dataProvider != param1)
            {
                super.dataProvider = param1;
                this.preselectedItemChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        protected function preselectItem() : void
        {
            var _loc_1:uint = 0;
            var _loc_2:Named = null;
            if (!this.userHasMadeSelection)
            {
            }
            if (!hasSelectedItem)
            {
            }
            if (dataProvider)
            {
                _loc_1 = 0;
                while (_loc_1 < dataProvider.length)
                {
                    
                    _loc_2 = Named(dataProvider.getItemAt(_loc_1));
                    if (_loc_2.name == this._preselectedItemName)
                    {
                        selectedItem = _loc_2;
                    }
                    _loc_1 = _loc_1 + 1;
                }
            }
            return;
        }// end function

        protected function defaultItemRendererFunction(param1:Object) : IFactory
        {
            if (param1 is IconListItem)
            {
                return this.iconItemRenderer;
            }
            return null;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.preselectedItemChanged)
            {
                this.preselectItem();
                this.preselectedItemChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function itemAdded(param1:int) : void
        {
            super.itemAdded(param1);
            this.preselectItem();
            return;
        }// end function

        private function changeHandler(event:Event) : void
        {
            this.userHasMadeSelection = true;
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
