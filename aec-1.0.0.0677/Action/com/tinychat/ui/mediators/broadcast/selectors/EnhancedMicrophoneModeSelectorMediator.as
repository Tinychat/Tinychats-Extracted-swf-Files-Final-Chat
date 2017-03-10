package com.tinychat.ui.mediators.broadcast.selectors
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.proxies.*;

    public class EnhancedMicrophoneModeSelectorMediator extends MicrophoneModeSelectorMediatorBase
    {
        public var deviceProxy:EnhancedBroadcastDeviceProxy;

        public function EnhancedMicrophoneModeSelectorMediator()
        {
            return;
        }// end function

        override protected function get openMicIconItem() : IconListItem
        {
            if (this.deviceProxy.selectedMicrophoneIsEnhanced)
            {
                return IconListItem.OPEN_MIC_ACC;
            }
            return IconListItem.OPEN_MIC_NO_ACC;
        }// end function

    }
}
