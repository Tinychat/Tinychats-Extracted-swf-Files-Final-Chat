package com.tinychat.controller.commands.broadcast
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.*;
    import com.tinychat.controller.state.*;
    import org.robotlegs.utilities.macrobot.*;

    public class VerifyAvailableBroadcastSlot extends AsyncCommand
    {
        public var broadcastSlotAvailable:BroadcastSlotAvailableGuard;
        public var triggerStateAction:TriggerStateAction;

        public function VerifyAvailableBroadcastSlot()
        {
            return;
        }// end function

        override public function execute() : void
        {
            addCompletionListener(this.completionHandler);
            dispatchComplete(this.broadcastSlotAvailable.approve());
            return;
        }// end function

        private function completionHandler(param1:Boolean) : void
        {
            if (!param1)
            {
                this.triggerStateAction.dispatch(StateAction.NO_AVAILABLE_BROADCAST_SLOT);
            }
            return;
        }// end function

    }
}
