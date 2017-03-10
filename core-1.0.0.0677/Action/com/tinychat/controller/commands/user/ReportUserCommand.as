package com.tinychat.controller.commands.user
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.report.*;
    import org.robotlegs.mvcs.*;

    public class ReportUserCommand extends Command
    {
        public var user:UserIdentity;
        public var proxy:ReportUsersProxy;
        public var postNotice:PostActionNotice;

        public function ReportUserCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.proxy.report(this.user);
            this.postNotice.dispatch("*You\'ve reported " + this.user.name + ".*");
            return;
        }// end function

    }
}
