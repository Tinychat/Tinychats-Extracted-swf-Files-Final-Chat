package com.tinychat.model.menuoption
{
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.guards.youtube.*;
    import com.tinychat.model.validation.*;
    import com.tinychat.model.validation.broadcast.*;

    public class PromoteBroadcastMenuOption extends AbstractMenuOption
    {
        private var existsYouTubeBroadcast:ExistsYouTubeBroadcastGuard;

        public function PromoteBroadcastMenuOption(param1:IsPaidUserGuard, param2:IsBroadcaster, param3:IsntPromotedBroadcast, param4:MoreThanOneBroadcast, param5:ExistsYouTubeBroadcastGuard)
        {
            super("Maximize video", this.Vector.<IdentityValidation>([param2, param3, param4]));
            this.existsYouTubeBroadcast = param5;
            return;
        }// end function

    }
}
