package com.tinychat.ui.context.popupmenu
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.ui.components.sound.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.mediators.sound.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;
    import spark.components.supportClasses.*;

    public class SoundCloudBroadcastPopupMenuContext extends ModuleContext
    {
        private var broadcast:SoundCloudBroadcast;

        public function SoundCloudBroadcastPopupMenuContext(param1:DisplayObjectContainer, param2:IInjector, param3:SoundCloudBroadcast)
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
            var _loc_1:* = injector.mapValue(SoundCloudBroadcast, this.broadcast);
            injector.mapRule(SoundControl, _loc_1);
            injector.mapRule(MediaBroadcast, _loc_1);
            mediatorMap.mapView(MuteButton, BroadcastMuteButtonMediator);
            mediatorMap.mapView(HorizontalVolumeSlider, VolumeSliderMediator, SliderBase);
            mediatorMap.mapView(HorizontalDurationSlider, HorizontalDurationSliderMediator);
            super.mapInjections();
            return;
        }// end function

    }
}
