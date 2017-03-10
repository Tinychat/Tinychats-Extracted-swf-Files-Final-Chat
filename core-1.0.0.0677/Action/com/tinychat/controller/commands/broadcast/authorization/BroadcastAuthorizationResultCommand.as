package com.tinychat.controller.commands.broadcast.authorization
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.guards.greenroom.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.model.authorization.*;
    import org.robotlegs.mvcs.*;

    public class BroadcastAuthorizationResultCommand extends Command
    {
        public var authorization:BroadcastAuthorizationBase;
        public var triggerStateAction:TriggerStateAction;
        public var greenRoomEligible:GreenRoomEligibleGuard;

        public function BroadcastAuthorizationResultCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            switch(this.authorization.status)
            {
                case BroadcastAuthorizationStatus.AUTHORIZED:
                {
                    this.toggleState(StateAction.SUCCESS);
                    break;
                }
                case BroadcastAuthorizationStatus.BLOCKED:
                {
                    this.toggleState(StateAction.BROADCAST_BLOCKED);
                    break;
                }
                case BroadcastAuthorizationStatus.PASSWORD_PROTECTED:
                {
                    if (this.authorization is RoomBroadcastAuthorization)
                    {
                    }
                    if (this.greenRoomEligible.approve())
                    {
                        this.toggleState(StateAction.GREENROOM);
                    }
                    else
                    {
                        this.toggleState(StateAction.PROMPT_PASSWORD);
                    }
                    break;
                }
                case BroadcastAuthorizationStatus.UNKNOWN:
                {
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
