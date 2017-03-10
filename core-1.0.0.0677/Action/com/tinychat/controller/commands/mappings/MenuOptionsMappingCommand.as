package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.mqtt.*;

    public class MenuOptionsMappingCommand extends MappingCommand
    {

        public function MenuOptionsMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingleton(BanUserMenuOption);
            injector.mapSingleton(CloseUserBroadcastMenuOption);
            injector.mapSingleton(DemoteBroadcastMenuOption);
            injector.mapSingleton(IgnoreUserMenuOption);
            injector.mapSingleton(UnignoreUserMenuOption);
            injector.mapSingleton(ProfileUserMenuOption);
            injector.mapSingleton(FollowUserMenuOption);
            injector.mapSingleton(PromoteBroadcastMenuOption);
            injector.mapSingleton(ReportUserMenuOption);
            injector.mapSingleton(TinychatMessageUserMenuOption);
            injector.mapSingleton(GiftUserMenuOption);
            injector.mapSingleton(UpgradeUserMenuOption);
            injector.mapSingleton(SocialNetworkInviteUserMenuOption);
            injector.mapSingleton(SocialNetworkMessageUserMenuOption);
            injector.mapSingleton(MqttBlockUserMenuOption);
            injector.mapSingleton(MqttUnblockUserMenuOption);
            return;
        }// end function

    }
}
