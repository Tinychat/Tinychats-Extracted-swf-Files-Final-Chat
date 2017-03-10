package com.tinychat.model.moderator
{
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.model.parsers.privatemessage.*;
    import com.tinychat.model.parsers.privatemessage.arguments.*;
    import com.tinychat.model.validation.*;

    public class AutoBanner extends Object
    {
        private var parser:PrivateMessageParser;
        private var ban:BanUser;
        private var isBannableUser:IsBannableUser;
        private var _active:Boolean;
        private var isOperator:IsOperatorGuard;

        public function AutoBanner(param1:PrivateMessageParser, param2:BanUser, param3:IsBannableUser, param4:IsOperatorGuard)
        {
            this.parser = param1;
            this.ban = param2;
            this.isBannableUser = param3;
            this.isOperator = param4;
            param4.addChangeListener(this.isOperatorChangeHandler);
            this.isOperatorChangeHandler(param4.approve());
            return;
        }// end function

        private function isOperatorChangeHandler(param1:Boolean) : void
        {
            this.active = param1;
            return;
        }// end function

        public function set active(param1:Boolean) : void
        {
            if (this._active != param1)
            {
                this._active = param1;
                if (this._active)
                {
                    this.parser.publicChat.add(this.publicChatHandler);
                }
                else
                {
                    this.parser.publicChat.remove(this.publicChatHandler);
                }
            }
            return;
        }// end function

        private function publicChatHandler(param1:PrivateMessageChatArguments) : void
        {
            if (this.isBannableUser.isValid(param1.sender))
            {
            }
            return;
        }// end function

    }
}
