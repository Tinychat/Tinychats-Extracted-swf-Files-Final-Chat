package com.tinychat.model.user
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;

    public class UserPermissions extends Object
    {
        private var actions:Vector.<UserAction>;
        private var currentUser:User;
        private static const operatorActions:Vector.<UserAction> = UserPermissions.Vector.<UserAction>([UserAction.BAN, UserAction.BANLIST, UserAction.BROADCAST, UserAction.CLOSE, UserAction.FORGIVE, UserAction.MUTE, UserAction.PUSH2TALK]);
        private static const baseActions:Vector.<UserAction> = UserPermissions.Vector.<UserAction>([UserAction.HELP, UserAction.IGNORE, UserAction.PRIVATE_CHAT, UserAction.PUBLIC_CHAT, UserAction.UNIGNORE, UserAction.VERSION]);

        public function UserPermissions(param1:RoomUsers)
        {
            this.currentUser = param1.currentUser;
            this.actions = baseActions;
            this.toggleOperatorActions(this.currentUser.operator);
            this.currentUser.operatorChange.add(this.operatorChangeHandler);
            return;
        }// end function

        private function operatorChangeHandler(param1:Boolean) : void
        {
            this.toggleOperatorActions(param1);
            return;
        }// end function

        public function add(param1:UserAction) : void
        {
            if (!this.hasAction(param1))
            {
                this.actions.push(param1);
            }
            return;
        }// end function

        public function remove(param1:UserAction) : void
        {
            var _loc_2:* = this.actions.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.actions.splice(_loc_2, 1);
            }
            return;
        }// end function

        public function isAllowed(param1:UserAction) : Boolean
        {
            return this.hasAction(param1);
        }// end function

        public function get all() : Vector.<UserAction>
        {
            return this.actions.concat();
        }// end function

        public function toggleOperatorActions(param1:Boolean) : void
        {
            var _loc_2:UserAction = null;
            if (param1)
            {
                for each (_loc_2 in operatorActions)
                {
                    
                    this.add(_loc_2);
                }
            }
            else
            {
                for each (_loc_2 in operatorActions)
                {
                    
                    this.remove(_loc_2);
                }
            }
            return;
        }// end function

        private function hasAction(param1:UserAction) : Boolean
        {
            return this.actions.indexOf(param1) != -1;
        }// end function

    }
}
