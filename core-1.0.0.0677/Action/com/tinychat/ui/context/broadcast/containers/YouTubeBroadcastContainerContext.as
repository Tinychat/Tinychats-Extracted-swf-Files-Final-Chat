package com.tinychat.ui.context.broadcast.containers
{
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.media.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.model.validation.media.*;
    import com.tinychat.model.youtube.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class YouTubeBroadcastContainerContext extends BroadcastContainerContext
    {
        private var broadcast:YouTubeBroadcast;

        public function YouTubeBroadcastContainerContext(param1:DisplayObjectContainer, param2:IInjector, param3:YouTubeBroadcast)
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
            injector.mapValue(YouTubeBroadcast, this.broadcast);
            _loc_1 = injector.mapValue(Broadcasts, injector.getInstance(YouTubeBroadcasts));
            injector.mapRule(MediaBroadcasts, _loc_1);
            mediatorMap.mapView(UserPopupMenu, YouTubeBroadcastPopupMenuMediator);
            mediatorMap.mapView(VideoControlsOverlay, VideoControlsOverlayMediator);
            injector.mapSingleton(IsBroadcaster);
            injector.mapSingleton(BroadcastIsHidden);
            injector.mapSingleton(BroadcastIsntHidden);
            injector.mapSingleton(MediaIsPaused);
            injector.mapSingleton(MediaIsPlaying);
            injector.mapSingleton(CloseMediaBroadcastMenuOption);
            injector.mapSingleton(EditableDurationMediaBroadcastMenuOption);
            injector.mapSingleton(HideBroadcastMenuOption);
            injector.mapSingleton(PauseMediaMenuOption);
            injector.mapSingleton(PlayMediaMenuOption);
            injector.mapSingleton(ReadOnlyDurationMediaBroadcastMenuOption);
            injector.mapSingleton(ShowBroadcastMenuOption);
            injector.mapSingleton(VolumeBroadcastMenuOption);
            super.mapInjections();
            return;
        }// end function

    }
}
