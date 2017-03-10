package com.tinychat.controller.commands.state
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import org.robotlegs.utilities.macrobot.*;

    public class WaitForStateActionCommand extends AsyncCommand
    {
        public var triggerStateAction:TriggerStateAction;
        private var action:StateAction;

        public function WaitForStateActionCommand(param1:StateAction)
        {
            this.action = param1;
            return;
        }// end function

        override public function execute() : void
        {
            this.triggerStateAction.addOnce(this.triggerStateActionHandler);
            return;
        }// end function

        private function triggerStateActionHandler(param1:StateAction, param2:Object) : void
        {
            dispatchComplete(this.action == param1);
            return;
        }// end function

    }
}
