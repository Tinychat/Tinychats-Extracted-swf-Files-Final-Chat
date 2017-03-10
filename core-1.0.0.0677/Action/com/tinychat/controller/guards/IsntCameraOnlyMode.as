package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.proxies.*;

    public class IsntCameraOnlyMode extends AbstractLiveGuard
    {
        private var broadcastDevices:BroadcastDeviceProxy;

        public function IsntCameraOnlyMode(param1:BroadcastDeviceProxy)
        {
            this.broadcastDevices = param1;
            return;
        }// end function

        override public function approve() : Boolean
        {
            return this.broadcastDevices.selectedMicrophoneName != BroadcastDeviceConstants.CAMERA_ONLY;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.broadcastDevices.selectedMicrophoneChanged.add(this.selectedMicrophoneChangedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.broadcastDevices.selectedMicrophoneChanged.remove(this.selectedMicrophoneChangedHandler);
            return;
        }// end function

        private function selectedMicrophoneChangedHandler() : void
        {
            triggerChange();
            return;
        }// end function

    }
}
