package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.devicelist.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.screens.*;

    public class MicrophoneSelectionScreenMediator extends SelectionScreenBaseMediator
    {
        public var securityPanelProxy:SecurityPanelProxy;
        public var deviceProxy:BroadcastDeviceProxy;
        public var microphoneList:MicrophoneList;
        private var view:MicrophoneSelectionScreen;

        public function MicrophoneSelectionScreenMediator(param1:MicrophoneSelectionScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.securityPanel = this.securityPanelProxy;
            this.view.deviceList = this.microphoneList;
            this.view.selectionChanged.add(this.selectionChangedHandler);
            this.view.title = "Select microphone";
            this.view.adjustVolume.label = "Adjust volume";
            this.view.selectionInfoDisplay.text = "Select the microphone you wish to broadcast with:";
            return;
        }// end function

        override protected function selectionMadeHandler(param1:Object) : void
        {
            if (param1 is MicrophoneListItem)
            {
                this.deviceProxy.selectedMicrophoneName = Named(param1).name;
            }
            else
            {
                this.deviceProxy.selectedMicrophoneName = BroadcastDeviceConstants.CAMERA_ONLY;
            }
            super.selectionMadeHandler(param1);
            return;
        }// end function

        override protected function updateConfirmedLabel() : void
        {
            if (this.view.selectedItem is IconListItem)
            {
                this.view.confirmLabel = "Finish";
            }
            else
            {
                super.updateConfirmedLabel();
            }
            return;
        }// end function

        private function selectionChangedHandler(param1:Object) : void
        {
            this.updateConfirmedLabel();
            return;
        }// end function

    }
}
