package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class InviteButtonMediator extends Mediator
    {
        public var view:InviteButton;
        public var triggerStateAction:TriggerStateAction;

        public function InviteButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.label = "Share";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.triggerStateAction.dispatch(StateAction.SHOW_INVITE_SELECTION);
            return;
        }// end function

    }
}
