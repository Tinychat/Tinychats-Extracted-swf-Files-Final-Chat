package com.tinychat.model.authorization
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.*;

    public class RoomBroadcastAuthorization extends BroadcastAuthorizationBase
    {

        public function RoomBroadcastAuthorization(param1:BroadcastAuthenticationService, param2:RoomUsers, param3:RoomSettingsProxy)
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
