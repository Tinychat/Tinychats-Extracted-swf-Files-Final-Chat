package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.model.validation.user.*;

    public class VolumeBroadcastMenuOption extends AbstractMenuOption
    {

        public function VolumeBroadcastMenuOption(param1:IsntCurrentUser, param2:IsBroadcaster)
        {
            super("Volume", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
