package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.proxies.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.mediators.broadcast.screens.*;
    import com.tinychat.ui.mediators.broadcast.selectors.*;

    public class EnhancedBroadcastDeviceMappingCommand extends MappingCommand
    {

        public function EnhancedBroadcastDeviceMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = injector.mapSingleton(EnhancedBroadcastDeviceProxy);
            injector.mapRule(BroadcastDeviceProxy, _loc_1);
            var _loc_2:* = new MicrophoneOutbundVolumeControl(null, 0.5, 0);
            injector.mapValue(MicrophoneOutbundVolumeControl, _loc_2);
            mediatorMap.mapView(MicrophoneModeSelectionScreen, EnhancedMicrophoneModeSelectionScreenMediator);
            mediatorMap.mapView(MicrophoneModeSelector, EnhancedMicrophoneModeSelectorMediator);
            return;
        }// end function

    }
}
