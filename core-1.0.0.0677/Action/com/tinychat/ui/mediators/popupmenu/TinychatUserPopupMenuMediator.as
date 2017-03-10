package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class TinychatUserPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var ban:BanUserMenuOption;
        public var close:CloseUserBroadcastMenuOption;
        public var ignore:IgnoreUserMenuOption;
        public var message:TinychatMessageUserMenuOption;
        public var profile:ProfileUserMenuOption;
        public var follow:FollowUserMenuOption;
        public var report:ReportUserMenuOption;
        public var unignore:UnignoreUserMenuOption;
        public var gift:GiftUserMenuOption;

        public function TinychatUserPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.ban, this.close, this.ignore, this.message, this.gift, this.profile, this.follow, this.report, this.unignore];
        }// end function

    }
}
