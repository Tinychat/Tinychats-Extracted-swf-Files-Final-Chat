package com.tinychat.controller.commands.room.connection.callbacks
{
    import com.tinychat.controller.commands.chat.signals.*;
    import com.tinychat.model.parsers.fromowner.arguments.*;
    import org.robotlegs.mvcs.*;

    public class FromOwnerNoticeCommand extends Command
    {
        public var args:FromOwnerNoticeArguments;
        public var postNotice:PostActionNotice;

        public function FromOwnerNoticeCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.postNotice.dispatch(this.args.message);
            return;
        }// end function

    }
}
