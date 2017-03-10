package com.tinychat.model.menuoption.mqtt
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.mqtt.*;
    import com.tinychat.model.validation.user.*;

    public class MqttBlockUserMenuOption extends AbstractSocialNetworkUserMenuOption
    {

        public function MqttBlockUserMenuOption(param1:IsntCurrentSocialNetworkUser, param2:IsntBlocked)
        {
            super("Block", param1, this.Vector.<IdentityValidation>([param2]));
            return;
        }// end function

    }
}
