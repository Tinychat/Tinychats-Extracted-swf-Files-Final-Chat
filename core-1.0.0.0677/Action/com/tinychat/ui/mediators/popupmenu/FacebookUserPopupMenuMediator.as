package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class FacebookUserPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var invite:SocialNetworkInviteUserMenuOption;
        public var message:SocialNetworkMessageUserMenuOption;

        public function FacebookUserPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.invite, this.message];
        }// end function

    }
}
