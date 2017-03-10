package com.tinychat.model.guards
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class AbstractOperatorGuard extends AbstractLiveGuard
    {
        protected var users:RoomUsers;

        public function AbstractOperatorGuard(param1:RoomUsers)
        {
            this.users = param1;
            return;
        }// end function

        override protected function enableChangeListening() : void
        {
            this.users.currentUserChanged.add(this.currentUserChangedHandler);
            return;
        }// end function

        override protected function disableChangeListening() : void
        {
            this.users.currentUserChanged.remove(this.currentUserChangedHandler);
            if (this.users.currentUser)
            {
                this.users.currentUser.operatorChange.remove(this.operatorChangeHandler);
            }
            return;
        }// end function

        private function currentUserChangedHandler(param1:User, param2:User) : void
        {
            if (param1)
            {
                param1.operatorChange.remove(this.operatorChangeHandler);
            }
            triggerChange();
            if (param2)
            {
                param2.operatorChange.add(this.operatorChangeHandler);
            }
            return;
        }// end function

        private function operatorChangeHandler(param1:Boolean) : void
        {
            triggerChange();
            return;
        }// end function

    }
}
