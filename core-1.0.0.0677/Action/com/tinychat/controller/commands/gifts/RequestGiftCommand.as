package com.tinychat.controller.commands.gifts
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.gifts.*;
    import org.robotlegs.mvcs.*;

    public class RequestGiftCommand extends Command
    {
        public var user:UserIdentity;
        public var giftCommunicator:GiftCommunicator;
        public var openLink:OpenLink;

        public function RequestGiftCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.user.account.length > 1)
            {
                this.openLink.dispatch("https://tinychat.com/gifts/?to=" + this.user.account);
            }
            else
            {
                this.giftCommunicator.sendGiftRequest(this.user);
            }
            return;
        }// end function

    }
}
