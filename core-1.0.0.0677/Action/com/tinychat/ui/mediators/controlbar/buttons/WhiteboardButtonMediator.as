package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.whiteboard.signals.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class WhiteboardButtonMediator extends Mediator
    {
        public var view:WhiteboardButton;
        public var openWhiteboard:OpenWhiteboard;

        public function WhiteboardButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.toolTip = "ToolTipBundle.whiteboardButton";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.openWhiteboard.dispatch();
            return;
        }// end function

    }
}
