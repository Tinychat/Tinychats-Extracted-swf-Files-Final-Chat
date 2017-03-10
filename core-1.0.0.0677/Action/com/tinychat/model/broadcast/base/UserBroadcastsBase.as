package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;

    public class UserBroadcastsBase extends BroadcastsBase
    {
        private var users:Users;

        public function UserBroadcastsBase(param1:Users)
        {
            this.users = param1;
            this.users.removed.add(this.userRemovedHandler);
            return;
        }// end function

        protected function userRemovedHandler(param1:UserIdentity) : void
        {
            if (has(param1))
            {
                _stop(get(param1));
            }
            return;
        }// end function

    }
}
