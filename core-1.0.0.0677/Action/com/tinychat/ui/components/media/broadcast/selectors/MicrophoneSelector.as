package com.tinychat.ui.components.broadcast.selectors
{
    import com.tinychat.model.lists.*;
    import com.tinychat.model.proxies.*;
    import mx.core.*;

    public class MicrophoneSelector extends DeviceSelectorBase
    {
        private static const microphoneItemRenderer:IFactory = new ClassFactory(MicrophoneItemRenderer);
        private static var _skinParts:Object = {iconItemRenderer:true, dataGroup:false, deviceItemRenderer:true};

        public function MicrophoneSelector()
        {
            super(IconListItem.NO_MICROPHONE_DETECTED, IconListItem.CAMERA_ONLY, BroadcastDeviceConstants.CAMERA_ONLY);
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
