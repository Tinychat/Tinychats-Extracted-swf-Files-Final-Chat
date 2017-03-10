package com.tinychat.model.authorization
{
    import com.tinychat.model.greenroom.*;
    import com.tinychat.services.*;

    public class GreenRoomBroadcastAuthorization extends BroadcastAuthorizationBase
    {

        public function GreenRoomBroadcastAuthorization(param1:BroadcastAuthenticationService, param2:GreenRoomUsers, param3:GreenRoomSettings)
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
