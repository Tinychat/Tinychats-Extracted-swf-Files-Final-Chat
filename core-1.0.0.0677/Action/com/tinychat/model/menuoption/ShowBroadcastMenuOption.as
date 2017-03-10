package com.tinychat.model.menuoption
{
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.user.*;

    public class ShowBroadcastMenuOption extends AbstractMenuOption
    {

        public function ShowBroadcastMenuOption(param1:IsntCurrentUser, param2:BroadcastIsHidden)
        {
            super("Show video", this.Vector.<IdentityValidation>([param1, param2]));
            return;
        }// end function

    }
}
