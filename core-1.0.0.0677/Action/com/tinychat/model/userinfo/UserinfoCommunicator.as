package com.tinychat.model.userinfo
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.room.connection.calls.*;
    import org.osflash.signals.*;

    public class UserinfoCommunicator extends Object
    {
        private var parser:RoomConnection;
        private var sender:UserinfoSender;
        private var _userinfoRequestSatisfied:Signal;
        private var pendingUser:UserIdentity;
        public static const REQUEST_TOKEN:String = "$request";
        public static const NO_INFO_TOKEN:String = "$noinfo";

        public function UserinfoCommunicator(param1:RoomConnection, param2:UserinfoSender)
        {
            this.parser = param1;
            this.sender = param2;
            this._userinfoRequestSatisfied = new Signal(String, UserIdentity);
            this.parser.account.add(this.userinfoHandler);
            return;
        }// end function

        public function get userinfoRequestSatisfied() : ISignal
        {
            return this._userinfoRequestSatisfied;
        }// end function

        public function sendUserinfoRequest(param1:UserIdentity) : void
        {
            this.pendingUser = param1;
            this.sender.send(param1);
            return;
        }// end function

        private function userinfoHandler(param1:RoomCallbackUserinfoArguments) : void
        {
            if (param1.tinychatUsername)
            {
            }
            if (this.pendingUser)
            {
                this._userinfoRequestSatisfied.dispatch(param1.tinychatUsername, this.pendingUser);
                this.pendingUser = null;
            }
            return;
        }// end function

    }
}
