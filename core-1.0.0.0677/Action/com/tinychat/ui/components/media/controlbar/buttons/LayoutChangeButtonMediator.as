package com.tinychat.ui.components.controlbar.buttons
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.layout.*;
    import flash.events.*;
    import org.robotlegs.mvcs.*;

    public class LayoutChangeButtonMediator extends Mediator
    {
        public var view:LayoutChangeButton;
        public var flashvars:FlashvarsProxy;
        public var applicationLayout:ApplicationLayout;

        public function LayoutChangeButtonMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, MouseEvent.CLICK, this.clickedHandler, MouseEvent);
            return;
        }// end function

        private function clickedHandler(event:MouseEvent) : void
        {
            var _loc_2:ApplicationLayoutState = null;
            if (this.view.selected)
            {
                _loc_2 = ApplicationLayoutState.CHAT_BELOW;
            }
            else
            {
                _loc_2 = ApplicationLayoutState.CHAT_RIGHT;
            }
            this.applicationLayout.currentState = _loc_2;
            return;
        }// end function

    }
}
