package com.tinychat.ui.mediators.controlbar.buttons
{
    import com.tinychat.controller.commands.document.signals.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class DocumentButtonMediator extends Mediator
    {
        public var view:DocumentButton;
        public var openDocument:OpenDocument;

        public function DocumentButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            this.view.toolTip = "ToolTipBundle.documentButton";
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickHandler, MouseEvent);
            return;
        }// end function

        private function clickHandler(event:MouseEvent) : void
        {
            this.openDocument.dispatch();
            return;
        }// end function

    }
}
