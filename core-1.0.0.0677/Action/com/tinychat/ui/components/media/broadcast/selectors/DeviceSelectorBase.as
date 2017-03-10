package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.lists.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;

    public class DeviceSelectorBase extends ItemSelectorBase
    {
        public var deviceItemRenderer:IFactory;
        private var deviceListView:ListCollectionView;
        private var noDeviceDetectedIcon:IconListItem;
        private var dontUseDeviceIcon:IconListItem;
        private var dontUseDeviceConstant:String;
        private var _dataProvider:IList;
        private var dataProviderChanged:Boolean;
        private var deviceList:DeviceList;
        private var deviceListLengthChanged:Boolean;
        private var _canUseOtherDeviceOnly:Boolean;
        private var canUserOtherDeviceOnlyChanged:Boolean;
        private var addedToStage:Boolean;
        private static const STATE_LOADING:String = "loading";
        private static var _skinParts:Object = {iconItemRenderer:true, dataGroup:false, deviceItemRenderer:true};

        public function DeviceSelectorBase(param1:IconListItem, param2:IconListItem, param3:String)
        {
            this.dontUseDeviceConstant = param3;
            this.noDeviceDetectedIcon = param1;
            this.dontUseDeviceIcon = param2;
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStageHandler);
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        public function set canUserOtherDeviceOnly(param1:Boolean) : void
        {
            if (this._canUseOtherDeviceOnly != param1)
            {
                this._canUseOtherDeviceOnly = param1;
                this.canUserOtherDeviceOnlyChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function preselectItem() : void
        {
            if (dataProvider)
            {
            }
            if (!hasSelectedItem)
            {
            }
            if (_preselectedItemName == this.dontUseDeviceConstant)
            {
            }
            if (this._canUseOtherDeviceOnly)
            {
                selectedItem = this.dontUseDeviceIcon;
            }
            else
            {
                super.preselectItem();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.dataProviderChanged)
            {
                if (this.deviceList)
                {
                    this.deviceList.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.deviceListChangeHandler);
                }
                this.deviceList = this._dataProvider as DeviceList;
                if (this.addedToStage)
                {
                }
                if (this.deviceList)
                {
                    this.deviceList.refresh();
                    this.deviceList.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.deviceListChangeHandler);
                }
            }
            if (!this.dataProviderChanged)
            {
            }
            if (this.deviceListLengthChanged)
            {
                if (this.deviceList)
                {
                }
                if (this.addedToStage)
                {
                    this.deviceListView = new ListCollectionView(new ArrayList(this.deviceList.source.concat()));
                    this.deviceListView.addItem(this.noDeviceDetectedIcon);
                    this.deviceListView.addItem(this.dontUseDeviceIcon);
                    this.deviceListView.filterFunction = this.dataProviderFilterFunction;
                    this.deviceListView.refresh();
                    this.dataProviderChanged = false;
                    this.deviceListLengthChanged = false;
                    super.dataProvider = this.deviceListView;
                }
            }
            if (this.canUserOtherDeviceOnlyChanged)
            {
            }
            if (this.deviceListView)
            {
                this.deviceListView.refresh();
                this.canUserOtherDeviceOnlyChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function getCurrentSkinState() : String
        {
            if (!this.addedToStage)
            {
                return STATE_LOADING;
            }
            return super.getCurrentSkinState();
        }// end function

        override protected function defaultItemRendererFunction(param1:Object) : IFactory
        {
            if (!(param1 is IconListItem))
            {
                return this.deviceItemRenderer;
            }
            return super.defaultItemRendererFunction(param1);
        }// end function

        private function dataProviderFilterFunction(param1:Object) : Boolean
        {
            if (param1 == this.noDeviceDetectedIcon)
            {
                return this.deviceList.length == 0;
            }
            if (param1 == this.dontUseDeviceIcon)
            {
                return this._canUseOtherDeviceOnly;
            }
            return true;
        }// end function

        private function deviceListChangeHandler(event:CollectionEvent) : void
        {
            this.deviceListLengthChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function addedToStageHandler(event:Event) : void
        {
            var event:* = event;
            setTimeout(function () : void
            {
                addedToStage = true;
                invalidateSkinState();
                return;
            }// end function
            , 500);
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            this.addedToStage = false;
            if (this.deviceListView)
            {
                this.deviceListView.removeAll();
                this.deviceListView = null;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
