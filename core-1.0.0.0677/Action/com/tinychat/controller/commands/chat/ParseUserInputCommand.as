package com.tinychat.controller.commands.chat
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.controller.commands.settings.signals.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.social.chat.*;
    import com.tinychat.model.user.*;
    import org.robotlegs.mvcs.*;

    public class ParseUserInputCommand extends Command
    {
        public var input:String;
        public var invokeUserAction:InvokeUserAction;
        public var triggerStateAction:TriggerStateAction;
        public var usersProxy:RoomUsers;
        public var userPermissions:UserPermissions;

        public function ParseUserInputCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = UserInputMatcher.match(this.input);
            if (this.userPermissions.isAllowed(_loc_1.type))
            {
                switch(_loc_1.type)
                {
                    case UserAction.BAN:
                    {
                        this.invokeOnUser(ConfirmBan, _loc_1.args[0]);
                        break;
                    }
                    case UserAction.BANLIST:
                    {
                        this.triggerStateAction.dispatch(StateAction.SHOW_BAN_LIST);
                        break;
                    }
                    case UserAction.CLOSE:
                    {
                        this.invokeOnUser(CloseBroadcast, _loc_1.args[0]);
                        break;
                    }
                    case UserAction.FORGIVE:
                    {
                        this.invokeUserAction.dispatch(ForgiveUser, [_loc_1.args[0]]);
                        break;
                    }
                    case UserAction.HELP:
                    {
                        this.invokeUserAction.dispatch(InvokeHelpAction, []);
                        break;
                    }
                    case UserAction.IGNORE:
                    {
                        this.invokeOnUser(IgnoreUser, _loc_1.args[0], true);
                        break;
                    }
                    case UserAction.MUTE:
                    {
                        this.invokeUserAction.dispatch(MuteRoom, []);
                        break;
                    }
                    case UserAction.OPER:
                    {
                        this.invokeOnUser(OpUser, _loc_1.args[0]);
                        break;
                    }
                    case UserAction.PUBLIC_CHAT:
                    {
                        this.invokeUserAction.dispatch(PostChatMessage, [this.input]);
                        break;
                    }
                    case UserAction.PUSH2TALK:
                    {
                        this.invokeUserAction.dispatch(ForceRoomPush2Talk, []);
                        break;
                    }
                    case UserAction.UNIGNORE:
                    {
                        this.invokeOnUser(IgnoreUser, _loc_1.args[0], false);
                        break;
                    }
                    case UserAction.VERSION:
                    {
                        this.invokeUserAction.dispatch(InvokeVersionAction, []);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        private function invokeOnUser(param1:Class, param2:String, ... args) : void
        {
            args = this.usersProxy.userFromName(param2);
            if (!args)
            {
            }
            args = [];
            args.unshift(args);
            if (args)
            {
                this.invokeUserAction.dispatch(param1, args);
            }
            return;
        }// end function

    }
}
