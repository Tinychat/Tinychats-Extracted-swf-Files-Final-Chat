package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.screens.*;

    public class CameraSelectionScreenMediator extends SelectionScreenBaseMediator
    {
        public var deviceProxy:BroadcastDeviceProxy;
        private var view:CameraSelectionScreen;

        public function CameraSelectionScreenMediator(param1:CameraSelectionScreen)
        {
            super(param1);
            this.view = param1;
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.title = "Select Camera";
            this.view.selectionInfoDisplayText = "Select the camera you wish to broadcast with:";
            this.view.tosInfoDisplayText = "Inappropriate broadcasts will be banned (terms of service).";
            return;
        }// end function

        override protected function selectionMadeHandler(param1:Object) : void
        {
            if (param1 is CameraListItem)
            {
                this.deviceProxy.selectedCameraName = Named(param1).name;
            }
            else
            {
                this.deviceProxy.selectedCameraName = BroadcastDeviceConstants.MICROPHONE_ONLY;
            }
            super.selectionMadeHandler(param1);
            return;
        }// end function

    }
}
