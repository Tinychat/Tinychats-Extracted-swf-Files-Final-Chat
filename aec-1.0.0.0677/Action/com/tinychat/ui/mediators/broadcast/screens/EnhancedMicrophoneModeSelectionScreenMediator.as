package com.tinychat.ui.mediators.broadcast.screens
{
    import com.tinychat.model.proxies.*;
    import com.tinychat.ui.components.broadcast.screens.*;

    public class EnhancedMicrophoneModeSelectionScreenMediator extends MicrophoneModeSelectionScreenMediatorBase
    {
        public var deviceProxy:EnhancedBroadcastDeviceProxy;

        public function EnhancedMicrophoneModeSelectionScreenMediator(param1:MicrophoneModeSelectionScreen)
        {
            super(param1);
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            if (!this.deviceProxy.selectedMicrophoneIsEnhanced)
            {
                view.selectionInfoDisplayText = "If you choose \"Open Microphone\" we strongly advise the use of headphones.";
            }
            return;
        }// end function

    }
}
