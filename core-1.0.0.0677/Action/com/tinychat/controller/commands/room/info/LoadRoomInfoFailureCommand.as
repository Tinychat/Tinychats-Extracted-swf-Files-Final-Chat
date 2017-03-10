package com.tinychat.controller.commands.room.info
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.vo.*;
    import org.robotlegs.mvcs.*;

    public class LoadRoomInfoFailureCommand extends Command
    {
        public var settings:RoomSettingsProxy;
        public var triggerStateAction:TriggerStateAction;

        public function LoadRoomInfoFailureCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            switch(this.settings.access)
            {
                case RoomAccess.CLOSED:
                {
                    this.toggleState(StateAction.ROOM_CLOSED);
                    break;
                }
                case RoomAccess.DOMAIN_BLOCK:
                {
                    this.toggleState(StateAction.DOMAIN_BLOCKED);
                    break;
                }
                case RoomAccess.PASSWORD_PROTECTED:
                {
                    this.toggleState(StateAction.PROMPT_PASSWORD);
                    break;
                }
                default:
                {
                    this.toggleState(StateAction.FAILURE);
                    break;
                }
            }
            return;
        }// end function

        private function toggleState(param1:StateAction) : void
        {
            this.triggerStateAction.dispatch(param1);
            return;
        }// end function

    }
}
