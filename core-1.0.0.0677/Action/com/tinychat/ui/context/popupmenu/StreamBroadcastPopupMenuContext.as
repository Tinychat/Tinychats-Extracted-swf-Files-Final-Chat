package com.tinychat.ui.context.popupmenu
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.sound.*;
    import com.tinychat.ui.mediators.sound.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;
    import spark.components.supportClasses.*;

    public class StreamBroadcastPopupMenuContext extends ModuleContext
    {
        private var broadcast:StreamBroadcast;

        public function StreamBroadcastPopupMenuContext(param1:DisplayObjectContainer, param2:IInjector, param3:StreamBroadcast)
        {
            this.broadcast = param3;
            super(param1, true, param2);
            return;
        }// end function

        override public function dispose() : void
        {
            super.dispose();
            this.broadcast = null;
            return;
        }// end function

        override protected function mapInjections() : void
        {
            var _loc_1:* = injector.mapValue(StreamBroadcast, this.broadcast);
            injector.mapRule(SoundControl, _loc_1);
            mediatorMap.mapView(MuteButton, BroadcastMuteButtonMediator);
            mediatorMap.mapView(HorizontalVolumeSlider, VolumeSliderMediator, SliderBase);
            super.mapInjections();
            return;
        }// end function

    }
}
