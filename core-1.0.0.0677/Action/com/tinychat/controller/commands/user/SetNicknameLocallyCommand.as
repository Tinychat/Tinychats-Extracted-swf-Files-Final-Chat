package com.tinychat.controller.commands.user
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.nick.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class SetNicknameLocallyCommand extends Command
    {
        public var newName:String;
        public var users:RoomUsers;
        public var flashCookie:FlashCookieProxy;
        public var nickFormatter:NickFormatter;

        public function SetNicknameLocallyCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.nickFormatter.format(this.newName);
            var _loc_2:uint = 0;
            var _loc_3:* = _loc_1;
            do
            {
                
                _loc_2 = _loc_2 + 1;
                _loc_3 = _loc_1 + _loc_2.toString();
                if (!this.isUsersCurrentNameToIgnoreCase(_loc_3))
                {
                }
            }while (this.nameIsOccupied(_loc_3))
            _loc_1 = _loc_3;
            if (!this.isUsersCurrentName(_loc_1))
            {
            }
            if (_loc_1 != "")
            {
                this.flashCookie.username = _loc_1;
                this.users.currentUserName = _loc_1;
            }
            return;
        }// end function

        private function isUsersCurrentName(param1:String) : Boolean
        {
            return this.users.currentUser.name == param1;
        }// end function

        private function isUsersCurrentNameToIgnoreCase(param1:String) : Boolean
        {
            return this.users.currentUser.name.toLowerCase() == param1.toLowerCase();
        }// end function

        private function nameIsOccupied(param1:String) : Boolean
        {
            return this.users.hasUserByName(param1);
        }// end function

    }
}
