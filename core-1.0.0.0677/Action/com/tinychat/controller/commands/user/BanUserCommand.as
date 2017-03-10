package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.room.connection.calls.*;
    import com.tinychat.model.room.connection.calls.signals.*;
    import com.tinychat.model.user.*;
    import com.tinychat.model.validation.*;
    import org.robotlegs.mvcs.*;

    public class BanUserCommand extends Command
    {
        public var user:UserIdentity;
        public var message:String;
        public var usersProxy:RoomUsers;
        public var callRoom:CallRoom;
        public var postNotice:PostActionNotice;
        public var flashvars:FlashvarsProxy;
        public var isBannableUser:IsBannableUser;

        public function BanUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:String = null;
            if (this.usersProxy.currentUser.operator)
            {
            }
            if (this.isBannableUser.isValid(this.user))
            {
                _loc_1 = this.user.name + " was banned by " + this.usersProxy.currentUser.name;
                if (this.flashvars.account != "")
                {
                    _loc_1 = _loc_1 + (" (" + this.flashvars.account + ")");
                }
                if (this.message)
                {
                    _loc_1 = _loc_1 + (" " + this.message);
                }
                this.callRoom.dispatch(new RoomCallNotice(_loc_1));
                this.callRoom.dispatch(new RoomCallBan(this.user));
                this.postNotice.dispatch(_loc_1);
            }
            return;
        }// end function

    }
}
