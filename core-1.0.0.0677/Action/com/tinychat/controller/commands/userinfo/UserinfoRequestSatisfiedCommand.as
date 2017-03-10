package com.tinychat.controller.commands.userinfo
{
    import com.tinychat.controller.commands.userinfo.signals.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.services.vo.*;
    import org.robotlegs.mvcs.*;

    public class UserinfoRequestSatisfiedCommand extends Command
    {
        public var identity:UserIdentity;
        public var displayUserinfo:DisplayUserinfo;
        public var javascript:ApplicationJavascript;

        public function UserinfoRequestSatisfiedCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.identity)
            {
            }
            if (this.identity.account)
            {
            }
            if (this.identity.account.length > 0)
            {
                this.javascript.openProfileInfo(this.identity.account);
                return;
            }
            this.displayUserinfo.dispatch(new TinychatUserinfo(""), this.identity);
            return;
        }// end function

    }
}
