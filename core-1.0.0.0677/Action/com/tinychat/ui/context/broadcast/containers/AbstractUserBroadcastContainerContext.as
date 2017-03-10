package com.tinychat.ui.context.broadcast.containers
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;
    import flash.display.*;
    import org.robotlegs.core.*;

    public class AbstractUserBroadcastContainerContext extends BroadcastContainerContext
    {

        public function AbstractUserBroadcastContainerContext(param1:DisplayObjectContainer, param2:IInjector, param3:Broadcast)
        {
            super(param1, param2, param3);
            return;
        }// end function

        override protected function mapInjections() : void
        {
            injector.mapSingleton(IsBroadcaster);
            injector.mapSingleton(BroadcastIsHidden);
            injector.mapSingleton(BroadcastIsntHidden);
            injector.mapSingleton(BanUserMenuOption);
            injector.mapSingleton(CloseUserBroadcastMenuOption);
            injector.mapSingleton(DemoteBroadcastMenuOption);
            injector.mapSingleton(HideBroadcastMenuOption);
            injector.mapSingleton(IgnoreUserMenuOption);
            injector.mapSingleton(ProfileUserMenuOption);
            injector.mapSingleton(FollowUserMenuOption);
            injector.mapSingleton(PromoteBroadcastMenuOption);
            injector.mapSingleton(ReportUserMenuOption);
            injector.mapSingleton(ShowBroadcastMenuOption);
            injector.mapSingleton(TinychatMessageUserMenuOption);
            injector.mapSingleton(UnignoreUserMenuOption);
            injector.mapSingleton(VolumeBroadcastMenuOption);
            injector.mapSingleton(GiftUserMenuOption);
            injector.mapSingleton(UpgradeUserMenuOption);
            super.mapInjections();
            return;
        }// end function

    }
}
