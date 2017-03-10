package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class HideBroadcastMenuOption extends AbstractMenuOption
    {

        public function HideBroadcastMenuOption(param1:IsntCurrentUser, param2:BroadcastIsntHidden)
        {
            super("Hide video", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
