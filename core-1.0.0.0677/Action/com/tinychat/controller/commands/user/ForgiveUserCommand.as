package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.mvcs.*;

    public class ForgiveUserCommand extends Command
    {
        public var userName:String;
        public var banList:BanListProxy;
        public var postNotice:PostActionNotice;

        public function ForgiveUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = this.banList.forgiveByName(this.userName);
            if (_loc_1)
            {
                this.postNotice.dispatch("*User " + this.userName + " has been forgiven.*");
            }
            return;
        }// end function

    }
}
