package com.tinychat.ui.components.social.effects.video
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.videoeffects.*;
    import com.tinychat.ui.components.spark.*;
    import mx.collections.*;

    public class VideoFiltersList extends AdvancedButtonBarBase
    {
        private var _broadcast:CameraBroadcast;
        private var _dataProvider:IList;
        private var broadcastChanged:Boolean;
        private var dataProviderChanged:Boolean;
        private static var _skinParts:Object = {dataGroup:false};

        public function VideoFiltersList()
        {
            requireSelection = true;
            return;
        }// end function

        public function get broadcast() : CameraBroadcast
        {
            return this._broadcast;
        }// end function

        public function set broadcast(param1:CameraBroadcast) : void
        {
            if (this._broadcast != param1)
            {
                this._broadcast = param1;
                this.broadcastChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function dispose() : void
        {
            if (super.dataProvider)
            {
                super.dataProvider.removeAll();
            }
            return;
        }// end function

        override public function get selectedItem()
        {
            var _loc_1:VideoFilter = null;
            var _loc_2:* = undefined;
            if (selectedIndex > -1)
            {
            }
            if (super.dataProvider)
            {
            }
            if (super.dataProvider.length > 0)
            {
                _loc_2 = super.selectedItem;
                if (_loc_2 is CameraBroadcastVideoFilter)
                {
                    _loc_1 = CameraBroadcastVideoFilter(_loc_2).videoFilter;
                }
            }
            return _loc_1;
        }// end function

        override public function set selectedItem(param1) : void
        {
            if (this._dataProvider)
            {
                selectedIndex = this._dataProvider.getItemIndex(param1) + 1;
            }
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                selectedIndex = 0;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:IList = null;
            var _loc_2:uint = 0;
            var _loc_3:VideoFilter = null;
            var _loc_4:CameraBroadcast = null;
            if (!this.dataProviderChanged)
            {
            }
            if (this.broadcastChanged)
            {
                if (this._dataProvider)
                {
                }
                if (this._broadcast)
                {
                    _loc_1 = new ArrayList();
                    _loc_1.addItem(new CameraBroadcastNormal(this._broadcast));
                    _loc_2 = 0;
                    while (_loc_2 < this._dataProvider.length)
                    {
                        
                        _loc_3 = this._dataProvider.getItemAt(_loc_2) as VideoFilter;
                        _loc_4 = new CameraBroadcastVideoFilter(this._broadcast, _loc_3);
                        _loc_1.addItem(_loc_4);
                        _loc_2 = _loc_2 + 1;
                    }
                }
                super.dataProvider = _loc_1;
                this.dataProviderChanged = false;
                this.broadcastChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
