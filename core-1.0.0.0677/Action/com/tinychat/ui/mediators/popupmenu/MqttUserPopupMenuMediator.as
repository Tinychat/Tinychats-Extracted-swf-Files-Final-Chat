package com.tinychat.ui.mediators.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.mqtt.*;
    import com.tinychat.ui.components.popupmenu.*;

    public class MqttUserPopupMenuMediator extends UserPopupMenuMediatorBase
    {
        public var block:MqttBlockUserMenuOption;
        public var message:SocialNetworkMessageUserMenuOption;
        public var unblock:MqttUnblockUserMenuOption;

        public function MqttUserPopupMenuMediator(param1:UserPopupMenu)
        {
            super(param1);
            return;
        }// end function

        override protected function get menuOptions() : Array
        {
            return [this.block, this.message, this.unblock];
        }// end function

    }
}
