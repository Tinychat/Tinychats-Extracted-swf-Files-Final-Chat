package com.tinychat.controller.context
{
    import com.tinychat.model.api.*;
    import com.tinychat.ui.components.social.userlist.greenroom.renderer.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.mediators.social.userslist.greenroom.renderer.*;
    import com.tinychat.ui.mediators.video.controls.*;
    import flash.display.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.mvcs.*;

    public class GreenRoomStreamItemRendererContext extends ModuleContext
    {
        private var streamBroadcast:StreamBroadcast;

        public function GreenRoomStreamItemRendererContext(param1:DisplayObjectContainer, param2:IInjector, param3:StreamBroadcast)
        {
            this.streamBroadcast = param3;
            super(param1, true, param2);
            return;
        }// end function

        override public function dispose() : void
        {
            this.streamBroadcast = null;
            mediatorMap.removeMediatorByView(contextView);
            super.dispose();
            return;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            var _loc_1:* = injector.mapValue(UserBroadcast, this.streamBroadcast);
            injector.mapRule(RenameableUser, _loc_1);
            injector.mapRule(UserIdentity, _loc_1);
            mediatorMap.mapView(GreenRoomAllowButton, GreenRoomAllowButtonMediator);
            mediatorMap.mapView(BanButton, BanButtonMediator);
            return;
        }// end function

    }
}
