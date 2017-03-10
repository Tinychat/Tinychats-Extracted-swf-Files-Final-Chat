package com.tinychat.controller.commands.userinfo
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.userinfo.*;
    import org.robotlegs.mvcs.*;

    public class RequestUserinfoCommand extends Command
    {
        public var user:UserIdentity;
        public var userinfoCommunicator:UserinfoCommunicator;

        public function RequestUserinfoCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.userinfoCommunicator.sendUserinfoRequest(this.user);
            return;
        }// end function

    }
}
