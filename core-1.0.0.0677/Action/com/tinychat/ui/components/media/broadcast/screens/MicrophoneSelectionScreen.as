package com.tinychat.ui.components.broadcast.screens
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.securitypanel.*;
    import flash.events.*;
    import mx.events.*;
    import spark.components.*;

    public class MicrophoneSelectionScreen extends SelectionScreenBase
    {
        public var adjustVolume:Button;
        private var _securityPanel:SecurityPanelProxy;
        private var securityPanelChanged:Boolean;
        private var _deviceList:DeviceList;
        private var deviceListChanged:Boolean;
        private var deviceListLengthChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, adjustVolume:true, loadingIndicator:false, selector:true, titleDisplay:false, statusLabel:false, selectionInfoDisplay:true};

        public function MicrophoneSelectionScreen()
        {
            addEventListener(Event.REMOVED_FROM_STAGE, this.removedFromStageHandler);
            return;
        }// end function

        public function set securityPanel(param1:SecurityPanelProxy) : void
        {
            if (this._securityPanel != param1)
            {
                this._securityPanel = param1;
                this.securityPanelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set deviceList(param1:DeviceList) : void
        {
            if (this._deviceList != param1)
            {
                if (this._deviceList)
                {
                    this._deviceList.removeEventListener(CollectionEvent.COLLECTION_CHANGE, this.deviceListLengthChangedHandler);
                }
                this._deviceList = param1;
                if (this._deviceList)
                {
                    this._deviceList.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.deviceListLengthChangedHandler);
                    this.deviceListChanged = true;
                    invalidateProperties();
                }
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.securityPanelChanged)
            {
            }
            if (this.adjustVolume)
            {
                this.showAdjustVolumeButton = !this._securityPanel.isUnresponsive;
                this.securityPanelChanged = false;
            }
            if (!this.deviceListChanged)
            {
            }
            if (this.deviceListLengthChanged)
            {
            }
            if (this.adjustVolume)
            {
                this.adjustVolume.enabled = this._deviceList.length > 0;
                this.deviceListChanged = false;
                this.deviceListLengthChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.adjustVolume)
            {
                this.adjustVolume.addEventListener(MouseEvent.CLICK, this.adjustVolumeClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.adjustVolume)
            {
                this.adjustVolume.removeEventListener(MouseEvent.CLICK, this.adjustVolumeClickHandler);
            }
            return;
        }// end function

        private function adjustVolumeClickHandler(event:MouseEvent) : void
        {
            this._securityPanel.open(SecurityPanelNames.MICROPHONE);
            return;
        }// end function

        private function removedFromStageHandler(event:Event) : void
        {
            this._securityPanel.close();
            this.deviceList = null;
            return;
        }// end function

        private function set showAdjustVolumeButton(param1:Boolean) : void
        {
            this.adjustVolume.includeInLayout = param1;
            this.adjustVolume.visible = param1;
            return;
        }// end function

        private function deviceListLengthChangedHandler(event:CollectionEvent) : void
        {
            this.deviceListLengthChanged = true;
            invalidateProperties();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
