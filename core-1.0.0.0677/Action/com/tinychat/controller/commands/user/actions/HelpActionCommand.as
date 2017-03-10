package com.tinychat.controller.commands.user.actions
{
    import __AS3__.vec.*;
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.user.*;
    import flash.utils.*;

    public class HelpActionCommand extends Object
    {
        private var usersPermissions:UserPermissions;
        private var postNotice:PostActionNotice;
        private static var helpDescriptionLookup:Dictionary;
        private static var initializeHelpDescriptionLookup:Boolean = createHelpDescriptionLookup();

        public function HelpActionCommand(param1:UserPermissions, param2:PostActionNotice)
        {
            this.usersPermissions = param1;
            this.postNotice = param2;
            return;
        }// end function

        public function execute() : void
        {
            var _loc_1:* = this.usersPermissions.all;
            var _loc_2:String = "Commands:";
            var _loc_3:uint = 0;
            while (_loc_3 < _loc_1.length)
            {
                
                if (helpDescriptionLookup[_loc_1[_loc_3]])
                {
                    _loc_2 = _loc_2 + ("\n" + helpDescriptionLookup[_loc_1[_loc_3]]);
                }
                _loc_3 = _loc_3 + 1;
            }
            this.postNotice.dispatch(_loc_2);
            return;
        }// end function

        private static function createHelpDescriptionLookup() : Boolean
        {
            helpDescriptionLookup = new Dictionary();
            helpDescriptionLookup[UserAction.BAN] = "*/ban nickname* (kicks and bans the user from this room)";
            helpDescriptionLookup[UserAction.BANLIST] = "*/banlist* (displays the ban/forgive list)";
            helpDescriptionLookup[UserAction.BROADCAST] = "*/broadcast nickname* (allows that user to broadcast)";
            helpDescriptionLookup[UserAction.CLOSE] = "*/close nickname* (closes that user\'s broadcast)";
            helpDescriptionLookup[UserAction.FORGIVE] = "*/forgive nickname* (enable a banned user to re-enter the room)";
            helpDescriptionLookup[UserAction.IGNORE] = "*/ignore nickname* (blocks their chat messages)";
            helpDescriptionLookup[UserAction.MUTE] = "*/mute* (temporarily mutes all non-moderator broadcasts)";
            helpDescriptionLookup[UserAction.NICK] = "*/nick nickname* (changes your nickname)";
            helpDescriptionLookup[UserAction.OPER] = "*/oper nickname* (makes that user a room moderator like you)";
            helpDescriptionLookup[UserAction.PUSH2TALK] = "*/push2talk* (puts all non-operators in push2talk mode)";
            helpDescriptionLookup[UserAction.UNIGNORE] = "*/unignore nickname* (unblock a previously blocked user)";
            return true;
        }// end function

    }
}
