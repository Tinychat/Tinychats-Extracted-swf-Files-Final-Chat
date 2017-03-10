package com.tinychat.controller.commands.broadcast.authorization
{
    import com.tinychat.model.authorization.*;
    import org.robotlegs.utilities.macrobot.*;

    public class AbstractBroadcastAuthorizationSequenceCommand extends SequenceCommand
    {
        private var authorization:BroadcastAuthorizationBase;

        public function AbstractBroadcastAuthorizationSequenceCommand(param1:BroadcastAuthorizationBase)
        {
            this.authorization = param1;
            return;
        }// end function

        override public function execute() : void
        {
            addCommand(BroadcastAuthorizationCommand, this.authorization, BroadcastAuthorizationBase);
            addCommand(BroadcastAuthorizationResultCommand, this.authorization, BroadcastAuthorizationBase);
            super.execute();
            return;
        }// end function

    }
}
