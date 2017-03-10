package com.tinychat.model.report
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.model.user.*;

    public class ReportUsersProxy extends Object
    {
        private var connection:ConnectionCallbackReceiver;
        private var roomInfo:RoomConnectInfo;
        private var reportedUsers:IdentityMap;
        private var sender:PrivateMessageSender;

        public function ReportUsersProxy(param1:ConnectionCallbackReceiver, param2:RoomConnectInfo, param3:PrivateMessageSender)
        {
            this.connection = param1;
            this.roomInfo = param2;
            this.sender = param3;
            this.reportedUsers = new IdentityMap();
            return;
        }// end function

        public function report(param1:UserIdentity) : void
        {
            var _loc_2:RoomCallReport = null;
            if (!this.isReported(param1))
            {
                _loc_2 = new RoomCallReport(param1, this.roomInfo.name);
                this.sender.send(UserAction.REPORTED.input, param1);
                this.connection.call(_loc_2);
                this.reportedUsers.add(param1);
            }
            return;
        }// end function

        public function isReported(param1:UserIdentity) : Boolean
        {
            return this.reportedUsers.has(param1);
        }// end function

    }
}
