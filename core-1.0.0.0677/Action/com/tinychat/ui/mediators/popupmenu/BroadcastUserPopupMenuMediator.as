package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class BroadcastUserPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var ban:BanUserMenuOption;
        public var close:CloseUserBroadcastMenuOption;
        public var demote:DemoteBroadcastMenuOption;
        public var hide:HideBroadcastMenuOption;
        public var ignore:IgnoreUserMenuOption;
        public var message:TinychatMessageUserMenuOption;
        public var profile:ProfileUserMenuOption;
        public var follow:FollowUserMenuOption;
        public var promote:PromoteBroadcastMenuOption;
        public var report:ReportUserMenuOption;
        public var show:ShowBroadcastMenuOption;
        public var unignore:UnignoreUserMenuOption;
        public var volume:VolumeBroadcastMenuOption;
        public var gift:GiftUserMenuOption;
        public var upgrade:UpgradeUserMenuOption;

        public function BroadcastUserPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.ban, this.close, this.demote, this.hide, this.ignore, this.gift, this.message, this.profile, this.follow, this.promote, this.report, this.show, this.upgrade, this.unignore, this.volume];
        }// end function

    }
}
