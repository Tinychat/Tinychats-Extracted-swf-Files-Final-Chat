package com.tinychat.controller.commands.gifts
{
    import com.tinychat.controller.commands.gifts.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.userinfo.*;
    import org.robotlegs.mvcs.*;

    public class GiftRequestSatisfiedCommand extends Command
    {
        public var tinychatName:String;
        public var user:UserIdentity;
        public var displaySendGift:DisplaySendGift;

        public function GiftRequestSatisfiedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.tinychatName == UserinfoCommunicator.NO_INFO_TOKEN)
            {
                this.displaySendGift.dispatch(this.user);
            }
            return;
        }// end function

    }
}
