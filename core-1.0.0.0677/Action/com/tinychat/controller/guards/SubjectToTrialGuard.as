package com.tinychat.controller.guards
{
    import com.tinychat.model.guards.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;

    public class SubjectToTrialGuard extends AbstractLiveGuard
    {
        private var connection:RoomConnection;
        private var userCount:RoomUserCount;
        private var isPaidUser:IsPaidUserGuard;
        private var initialNumberOfUsers:uint;
        private var settings:RoomSettings;

        public function SubjectToTrialGuard(param1:RoomConnection, param2:RoomUserCount, param3:IsPaidUserGuard, param4:RoomSettings)
        {
            this.connection = param1;
            this.userCount = param2;
            this.isPaidUser = param3;
            this.settings = param4;
            return;
        }// end function

        override public function approve() : Boolean
        {
            if (this.isPaidUser)
            {
            }
            if (this.settings)
            {
                if (this.initialNumberOfUsers > 10)
                {
                }
                if (!this.isPaidUser.approve())
                {
                }
                return !this.settings.promoted;
            }
            return false;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.connection.joinsdone.addOnce(this.joinsdoneHandler);
            this.userCount.changed.addOnce(this.userCountHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.connection.joinsdone.remove(this.joinsdoneHandler);
            this.userCount.changed.remove(this.userCountHandler);
            return;
        }// end function

        private function joinsdoneHandler() : void
        {
            this.initialNumberOfUsers = this.userCount.count;
            triggerChange();
            return;
        }// end function

        private function userCountHandler(param1:uint) : void
        {
            this.initialNumberOfUsers = param1;
            triggerChange();
            return;
        }// end function

    }
}
