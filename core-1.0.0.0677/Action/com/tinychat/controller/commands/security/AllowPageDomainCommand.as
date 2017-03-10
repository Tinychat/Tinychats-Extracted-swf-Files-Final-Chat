package com.tinychat.controller.commands.security
{
    import com.tinychat.model.javascript.*;
    import flash.system.*;
    import org.robotlegs.mvcs.*;

    public class AllowPageDomainCommand extends Command
    {
        public var javascript:ApplicationJavascript;

        public function AllowPageDomainCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            if (this.javascript.pageDomain != "")
            {
                Security.allowDomain(this.javascript.pageDomain);
            }
            return;
        }// end function

    }
}
