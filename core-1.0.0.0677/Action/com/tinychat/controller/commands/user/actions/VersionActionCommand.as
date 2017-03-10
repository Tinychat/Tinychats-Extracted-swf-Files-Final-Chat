package com.tinychat.controller.commands.user.actions
{
    import com.tinychat.controller.commands.chat.signals.*;
    import org.robotlegs.mvcs.*;

    public class VersionActionCommand extends Command
    {
        public var postNotice:PostActionNotice;

        public function VersionActionCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = "*You are running TinyChat version " + "1.0.0.0677" + ".*";
            this.postNotice.dispatch(_loc_1);
            return;
        }// end function

    }
}
