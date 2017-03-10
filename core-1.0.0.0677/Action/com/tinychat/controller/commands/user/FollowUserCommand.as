package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.settings.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.commands.userinfo.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.chat.tinychat.*;
    import com.tinychat.services.vo.*;

    public class FollowUserCommand extends ConfirmUserActionBaseCommand
    {
        public var javascript:ApplicationJavascript;
        public var privateChat:TinychatPrivateChatService;
        public var users:RoomUsers;
        public var displayUserinfo:DisplayUserinfo;
        public var triggerStateAction:TriggerStateAction;
        private var user:UserIdentity;

        public function FollowUserCommand(param1:UserIdentity)
        {
            this.user = param1;
            super(StateAction.CONFIRM_FOLLOW_USER, param1);
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:String = null;
            var _loc_2:String = null;
            if (this.user)
            {
            }
            if (this.user.account)
            {
            }
            if (this.user.account.length <= 0)
            {
                this.displayUserinfo.dispatch(new TinychatUserinfo(""), this.user);
            }
            else
            {
                if (this.users.currentUser.account)
                {
                }
                if (this.users.currentUser.account.length > 0)
                {
                    _loc_1 = this.javascript.followMember(this.user.account);
                    _loc_2 = "";
                    switch(_loc_1)
                    {
                        case "success":
                        {
                            this.privateChat.send("I\'m now following you on Tinychat. " + "Click \'Follow\' to follow me back!", this.user);
                            _loc_2 = "You are now following " + this.user.name + ".";
                            break;
                        }
                        case "already":
                        {
                            _loc_2 = "You are already following " + this.user.name + ".";
                            break;
                        }
                        case "unknown":
                        case "error":
                        {
                            _loc_2 = "Failed to follow, please try later.";
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    injector.mapValue(String, _loc_2);
                    this.triggerStateAction.dispatch(StateAction.REPORT_USER_FOLLOW);
                    injector.unmap(String);
                }
                else
                {
                    super.execute();
                }
            }
            return;
        }// end function

    }
}
