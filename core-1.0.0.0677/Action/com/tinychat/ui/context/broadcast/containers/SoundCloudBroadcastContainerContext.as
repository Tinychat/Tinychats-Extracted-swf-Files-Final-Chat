package com.tinychat.ui.context.broadcast.containers
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.broadcast.soundcloud.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.model.validation.media.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class SoundCloudBroadcastContainerContext extends BroadcastContainerContext
    {
        private var broadcast:SoundCloudBroadcast;

        public function SoundCloudBroadcastContainerContext(param1:DisplayObjectContainer, param2:IInjector, param3:SoundCloudBroadcast)
        {
            this.broadcast = param3;
            super(param1, param2, param3);
            return;
        }// end function

        override public function dispose() : void
        {
            this.broadcast = null;
            super.dispose();
            return;
        }// end function

        override protected function mapInjections() : void
        {
            var _loc_1:* = undefined;
            injector.mapValue(SoundCloudBroadcast, this.broadcast);
            _loc_1 = injector.mapValue(Broadcasts, injector.getInstance(SoundCloudBroadcasts));
            injector.mapRule(MediaBroadcasts, _loc_1);
            mediatorMap.mapView(UserPopupMenu, SoundCloudBroadcastPopupMenuMediator);
            mediatorMap.mapView(VideoControlsOverlay, VideoControlsOverlayMediator);
            injector.mapSingleton(IsBroadcaster);
            injector.mapSingleton(MediaIsPaused);
            injector.mapSingleton(MediaIsPlaying);
            injector.mapSingleton(CloseMediaBroadcastMenuOption);
            injector.mapSingleton(EditableDurationMediaBroadcastMenuOption);
            injector.mapSingleton(PauseMediaMenuOption);
            injector.mapSingleton(PlayMediaMenuOption);
            injector.mapSingleton(ReadOnlyDurationMediaBroadcastMenuOption);
            injector.mapSingleton(VolumeBroadcastMenuOption);
            super.mapInjections();
            return;
        }// end function

    }
}
