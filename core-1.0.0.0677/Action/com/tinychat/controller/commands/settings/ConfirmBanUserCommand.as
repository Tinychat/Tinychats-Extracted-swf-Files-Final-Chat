package com.tinychat.controller.commands.settings
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.controller.commands.user.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.validation.*;

    public class ConfirmBanUserCommand extends ConfirmUserActionBaseCommand
    {
        public var flashCookie:FlashCookieProxy;
        public var postLocalNotice:PostActionNotice;
        public var isBannableUser:IsBannableUser;
        public var banUser:BanUser;
        private var user:UserIdentity;

        public function ConfirmBanUserCommand(param1:UserIdentity)
        {
            this.user = param1;
            super(StateAction.CONFIRM_BAN_USER, param1);
            return;
        }// end function

        override public function execute() : void
        {
            if (!this.isBannableUser.isValid(this.user))
            {
                this.postLocalNotice.dispatch("*Only room owners can ban other moderators.*");
            }
            else if (this.flashCookie.confirmBans)
            {
                super.execute();
            }
            else
            {
                this.banUser.dispatch(this.user);
            }
            return;
        }// end function

    }
}
