package com.tinychat.ui.components.broadcast.selectors
{
    import __AS3__.vec.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.proxies.*;
    import flash.events.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class CameraSelector extends DeviceSelectorBase
    {
        private var activitySignals:Vector.<ISignal>;
        private var hideInactiveChanged:Boolean;
        private var dataProviderChanged:Boolean;
        private static var _skinParts:Object = {iconItemRenderer:true, dataGroup:false, deviceItemRenderer:true};

        public function CameraSelector()
        {
            super(IconListItem.NO_CAMERA_DETECTED, IconListItem.MICROPHONE_ONLY, BroadcastDeviceConstants.MICROPHONE_ONLY);
            this.activitySignals = new Vector.<ISignal>;
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        override public function set dataProvider(param1:IList) : void
        {
            if (dataProvider != param1)
            {
                super.dataProvider = param1;
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function set selectedItem(param1) : void
        {
            var _loc_2:* = param1 as CameraListItem;
            if (_loc_2)
            {
                if (_loc_2.isActive)
                {
                    super.selectedItem = _loc_2;
                }
                else
                {
                    super.selectedItem = undefined;
                }
            }
            else
            {
                super.selectedItem = param1;
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:uint = 0;
            var _loc_2:CameraListItem = null;
            super.commitProperties();
            if (this.dataProviderChanged)
            {
            }
            if (dataProvider)
            {
                _loc_1 = 0;
                while (_loc_1 < dataProvider.length)
                {
                    
                    _loc_2 = dataProvider.getItemAt(_loc_1) as CameraListItem;
                    if (_loc_2)
                    {
                        this.addActivityListener(_loc_2);
                    }
                    _loc_1 = _loc_1 + 1;
                }
                this.dataProviderChanged = true;
            }
            return;
        }// end function

        override protected function itemAdded(param1:int) : void
        {
            super.itemAdded(param1);
            var _loc_2:* = dataProvider.getItemAt(param1) as CameraListItem;
            if (_loc_2)
            {
                this.addActivityListener(_loc_2);
            }
            return;
        }// end function

        private function addActivityListener(param1:CameraListItem) : void
        {
            this.activitySignals.push(param1.activityChange);
            param1.activityChange.add(this.activityChangeHandler);
            return;
        }// end function

        private function activityChangeHandler(param1:Boolean) : void
        {
            if (param1)
            {
            }
            if (!hasSelectedItem)
            {
                preselectItem();
            }
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            var _loc_2:ISignal = null;
            for each (_loc_2 in this.activitySignals)
            {
                
                _loc_2.remove(this.activityChangeHandler);
            }
            this.activitySignals.splice(0, (this.activitySignals.length - 1));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
