package com.tinychat.model.greenroom
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.vo.*;

    public class GreenRoomConnectionController extends Object
    {
        private var connection:GreenRoomConnection;
        private var users:RoomUsers;
        private var roomSettings:RoomSettingsProxy;
        private var greenRoomSettings:GreenRoomSettings;
        private var connectionFailureCount:uint;

        public function GreenRoomConnectionController(param1:GreenRoomConnection, param2:RoomUsers, param3:RoomSettingsProxy, param4:GreenRoomSettings)
        {
            this.connection = param1;
            this.users = param2;
            this.roomSettings = param3;
            this.greenRoomSettings = param4;
            this.users.currentUserChanged.add(this.currentUserChangedHandler);
            this.roomSettings.roomInfoChanged.add(this.roomInfoChangedHandler);
            this.connectionFailureCount = 0;
            return;
        }// end function

        public function get connected() : Boolean
        {
            return this.connection.connected;
        }// end function

        public function connect() : void
        {
            this.addConnectionHandlers();
            this.greenRoomSettings.refresh();
            return;
        }// end function

        public function disconnect() : void
        {
            this.connection.disconnect();
            return;
        }// end function

        private function updateConnectionState() : void
        {
            if (this.users.currentUser)
            {
            }
            if (this.roomSettings.greenRoomEnabled)
            {
                if (!this.connection.connected)
                {
                    this.connect();
                }
            }
            else
            {
                if (!this.connection.connected)
                {
                }
                if (this.connection.connecting)
                {
                    this.disconnect();
                }
            }
            return;
        }// end function

        private function roomInfoChangedHandler() : void
        {
            this.updateConnectionState();
            return;
        }// end function

        private function currentUserChangedHandler(param1:User, param2:User) : void
        {
            this.updateConnectionState();
            return;
        }// end function

        private function greenRoomInfoChangedHandler() : void
        {
            var _loc_1:RoomConnectInfo = null;
            if (this.greenRoomSettings.access == RoomAccess.OK)
            {
                _loc_1 = this.connectionFailureCount == 1 ? (new AlternatePortRoomConnectInfo(this.greenRoomSettings)) : (this.greenRoomSettings);
                this.connection.connect(new RoomCallConnect(_loc_1));
            }
            return;
        }// end function

        private function connectionAttemptSuccessHandler() : void
        {
            if (this.users.currentUser)
            {
                this.connection.call(new RoomCallNick(this.users.currentUser.id));
            }
            this.removeConnectionHandlers();
            return;
        }// end function

        private function serviceFailedHandler(param1:String) : void
        {
            this.failureHandler();
            return;
        }// end function

        private function connectionAttemptFailedHandler() : void
        {
            var _loc_1:String = this;
            var _loc_2:* = this.connectionFailureCount + 1;
            _loc_1.connectionFailureCount = _loc_2;
            this.failureHandler();
            return;
        }// end function

        private function failureHandler() : void
        {
            this.removeConnectionHandlers();
            return;
        }// end function

        private function addConnectionHandlers() : void
        {
            this.greenRoomSettings.roomInfoChanged.addOnce(this.greenRoomInfoChangedHandler);
            this.connection.connectionAttemptSuccess.addOnce(this.connectionAttemptSuccessHandler);
            this.connection.connectionAttemptFailed.addOnce(this.connectionAttemptFailedHandler);
            return;
        }// end function

        private function removeConnectionHandlers() : void
        {
            this.greenRoomSettings.roomInfoChanged.remove(this.greenRoomInfoChangedHandler);
            this.connection.connectionAttemptSuccess.remove(this.connectionAttemptSuccessHandler);
            this.connection.connectionAttemptFailed.remove(this.connectionAttemptFailedHandler);
            return;
        }// end function

    }
}
