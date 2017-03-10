package com.tinychat.controller.commands.state
{
    import com.tinychat.controller.state.*;
    import org.osflash.statemachine.core.*;
    import org.robotlegs.mvcs.*;

    public class TriggerStateActionCommand extends SignalCommand
    {
        public var fsmController:IFSMController;
        private var action:StateAction;
        private var payload:Object;

        public function TriggerStateActionCommand(param1:StateAction, param2:Object = null)
        {
            this.action = param1;
            this.payload = param2 ? (param2) : ({});
            return;
        }// end function

        override public function execute() : void
        {
            this.fsmController.org.osflash.statemachine.core:IFSMController::action(this.action.toString(), this.payload);
            return;
        }// end function

    }
}
