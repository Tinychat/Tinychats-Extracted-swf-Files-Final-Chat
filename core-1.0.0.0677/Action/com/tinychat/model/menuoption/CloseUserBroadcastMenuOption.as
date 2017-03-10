package com.tinychat.model.menuoption
{
    import com.tinychat.model.user.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;
    import com.tinychat.model.validation.user.*;

    public class CloseUserBroadcastMenuOption extends AbstractOperatorUserMenuOption
    {

        public function CloseUserBroadcastMenuOption(param1:RoomUsers, param2:IsntCurrentUser, param3:IsBroadcaster)
        {
            super("Close broadcast", param1, this.Vector.<IdentityValidation>([param2, param3]));
            return;
        }// end function

    }
}
