package com.tinychat.controller.guards.greenroom
{
    import com.tinychat.controller.guards.composite.*;
    import com.tinychat.model.guards.*;

    public class GreenRoomEligibleGuard extends AllOfGuards
    {

        public function GreenRoomEligibleGuard(param1:IsntOperatorGuard, param2:GreenRoomEnabledGuard)
        {
            super(param1, param2);
            return;
        }// end function

    }
}
