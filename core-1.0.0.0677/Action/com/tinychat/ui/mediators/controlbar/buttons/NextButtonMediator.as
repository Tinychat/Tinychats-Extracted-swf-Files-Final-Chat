package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.broadcast.signals.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class NextButtonMediator extends Mediator
    {
        public var view:NextButton;
        public var connectToNextRoom:ConnectToNextRoom;

        public function NextButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            super.onRegister();
            this.view.label = "Next Room";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        override public function onRemove() : void
        {
            super.onRemove();
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.connectToNextRoom.dispatch();
            return;
        }// end function

    }
}
