package com.tinychat.model.menuoption
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;

    public class DemoteBroadcastMenuOption extends AbstractMenuOption
    {

        public function DemoteBroadcastMenuOption(param1:IsPaidUserGuard, param2:IsBroadcaster, param3:IsPromotedBroadcast, param4:MoreThanOneBroadcast)
        {
            super("Minimize video", this.Vector.<IdentityValidation>([param2, param3, param4]));
            return;
        }// end function

    }
}
