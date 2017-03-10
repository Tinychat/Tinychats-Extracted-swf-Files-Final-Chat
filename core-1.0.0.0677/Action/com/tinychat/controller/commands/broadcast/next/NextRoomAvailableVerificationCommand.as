package com.tinychat.controller.commands.broadcast.next
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.room.*;
    import org.robotlegs.utilities.macrobot.*;

    public class NextRoomAvailableVerificationCommand extends AsyncCommand
    {
        public var settings:RoomSettingsProxy;
        public var triggerStateAction:TriggerStateAction;
        private var currentRoomName:String;

        public function NextRoomAvailableVerificationCommand(param1:String)
        {
            this.currentRoomName = param1;
            return;
        }// end function

        override public function execute() : void
        {
            addCompletionListener(this.completionHandler);
            dispatchComplete(this.settings.name != this.currentRoomName);
            return;
        }// end function

        private function completionHandler(param1:Boolean) : void
        {
            if (!param1)
            {
                this.triggerStateAction.dispatch(StateAction.NO_NEXT_ROOM);
            }
            return;
        }// end function

    }
}
