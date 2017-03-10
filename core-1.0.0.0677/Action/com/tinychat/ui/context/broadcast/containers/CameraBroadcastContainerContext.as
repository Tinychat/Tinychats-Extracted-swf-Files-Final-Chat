package com.tinychat.ui.context.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.base.*;
    import com.tinychat.model.broadcast.room.*;
    import com.tinychat.ui.components.popupmenu.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.mediators.popupmenu.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class CameraBroadcastContainerContext extends AbstractUserBroadcastContainerContext
    {

        public function CameraBroadcastContainerContext(param1:DisplayObjectContainer, param2:IInjector, param3:CameraBroadcast)
        {
            super(param1, param2, param3);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapValue(Broadcasts, injector.getInstance(RoomCameraBroadcasts));
            mediatorMap.mapView(BroadcastUserPopupMenu, BroadcastUserPopupMenuMediator, UserPopupMenu);
            mediatorMap.mapView(VideoControlsOverlay, VideoControlsOverlayMediator);
            super.mapInjections();
            return;
        }// end function

    }
}
