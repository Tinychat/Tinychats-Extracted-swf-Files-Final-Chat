package com.tinychat.controller.commands.room.connection
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.info.*;
    import org.robotlegs.utilities.macrobot.*;

    public class ConnectToRoomCommand extends AsyncCommand
    {
        public var settings:RoomSettingsProxy;
        public var connection:RoomConnection;
        private static var connectionFailureCount:uint = 0;

        public function ConnectToRoomCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = connectionFailureCount == 1 ? (new AlternatePortRoomConnectInfo(this.settings)) : (this.settings);
            this.connection.connectionAttemptSuccess.addOnce(this.successHandler);
            this.connection.connectionAttemptFailed.addOnce(this.failureHandler);
            this.connection.connect(new RoomCallConnect(_loc_1));
            return;
        }// end function

        private function successHandler() : void
        {
            this.finish(true);
            return;
        }// end function

        private function failureHandler() : void
        {
            var _loc_2:* = connectionFailureCount + 1;
            connectionFailureCount = _loc_2;
            this.finish(false);
            return;
        }// end function

        private function finish(param1:Boolean) : void
        {
            this.connection.connectionAttemptSuccess.remove(this.successHandler);
            this.connection.connectionAttemptFailed.remove(this.failureHandler);
            dispatchComplete(param1);
            return;
        }// end function

    }
}
