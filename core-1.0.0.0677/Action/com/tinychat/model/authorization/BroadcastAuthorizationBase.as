package com.tinychat.model.authorization
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.*;
    import com.tinychat.services.vo.*;
    import org.osflash.signals.*;

    public class BroadcastAuthorizationBase extends Object
    {
        private var service:BroadcastAuthenticationService;
        private var users:Users;
        private var settings:RoomSettingsProxy;
        private var info:BroadcastAuthenticationInfo;
        private var _refreshed:Signal;

        public function BroadcastAuthorizationBase(param1:BroadcastAuthenticationService, param2:Users, param3:RoomSettingsProxy)
        {
            this.service = param1;
            this.users = param2;
            this.settings = param3;
            this._refreshed = new Signal();
            param1.success.add(this.loadedHandler);
            param1.failure.add(this.failureHandler);
            return;
        }// end function

        public function get refreshed() : ISignal
        {
            return this._refreshed;
        }// end function

        public function get status() : BroadcastAuthorizationStatus
        {
            return this.info ? (this.info.status) : (BroadcastAuthorizationStatus.UNKNOWN);
        }// end function

        public function get token() : String
        {
            return this.info ? (this.info.token) : ("");
        }// end function

        public function refresh() : void
        {
            this.service.load(this.users.currentUser.id, this.users.currentUser.name, this.settings.name, this.settings.namespace, this.settings.broadcastPassword);
            return;
        }// end function

        private function loadedHandler(param1:BroadcastAuthenticationInfo) : void
        {
            this.info = param1;
            this._refreshed.dispatch();
            return;
        }// end function

        private function failureHandler(param1:String) : void
        {
            this._refreshed.dispatch();
            return;
        }// end function

    }
}
