package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class IgnoreUserCommand extends Command
    {
        public var toggle:Boolean;
        public var user:UserIdentity;
        public var usersProxy:RoomUsers;
        public var postNotice:PostActionNotice;

        public function IgnoreUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:String = null;
            if (this.user.id != this.usersProxy.currentUser.id)
            {
                this.usersProxy.ignore(this.user, this.toggle);
                if (this.toggle)
                {
                    _loc_1 = "*You are now ignoring ";
                }
                else
                {
                    _loc_1 = "*You are no longer ignoring ";
                }
                _loc_1 = _loc_1 + (this.user.name + ".*");
                this.postNotice.dispatch(_loc_1);
            }
            return;
        }// end function

    }
}
