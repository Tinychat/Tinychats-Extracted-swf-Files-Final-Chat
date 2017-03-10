package com.tinychat.model.menuoption.mqtt
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.mqtt.*;
    import com.tinychat.model.validation.user.*;

    public class MqttUnblockUserMenuOption extends AbstractSocialNetworkUserMenuOption
    {

        public function MqttUnblockUserMenuOption(param1:IsntCurrentSocialNetworkUser, param2:IsBlocked)
        {
            super("Unblock", param1, this.Vector.<IdentityValidation>([param2]));
            return;
        }// end function

    }
}
