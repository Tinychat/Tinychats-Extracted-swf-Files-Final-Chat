package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.proxies.*;
    import com.tinychat.model.sounds.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.mediators.broadcast.screens.*;
    import com.tinychat.ui.mediators.broadcast.selectors.*;

    public class StandardBroadcastDeviceMappingCommand extends MappingCommand
    {

        public function StandardBroadcastDeviceMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = injector.mapSingleton(StandardBroadcastDeviceProxy);
            injector.mapRule(BroadcastDeviceProxy, _loc_1);
            var _loc_2:* = new MicrophoneOutbundVolumeControl(null, 1, 10);
            injector.mapValue(MicrophoneOutbundVolumeControl, _loc_2);
            mediatorMap.mapView(MicrophoneModeSelectionScreen, StandardMicrophoneModeSelectionScreenMediator);
            mediatorMap.mapView(MicrophoneModeSelector, StandardMicrophoneModeSelectorMediator);
            return;
        }// end function

    }
}
