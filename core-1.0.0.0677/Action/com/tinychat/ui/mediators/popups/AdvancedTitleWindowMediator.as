package com.tinychat.ui.mediators.popups
{
    import com.tinychat.controller.commands.popup.signals.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.spark.*;
    import mx.events.*;
    import org.robotlegs.mvcs.*;

    public class AdvancedTitleWindowMediator extends Mediator
    {
        public var view:AdvancedTitleWindow;
        public var closePopup:ClosePopup;
        public var triggerStateAction:TriggerStateAction;

        public function AdvancedTitleWindowMediator()
        {
            return;
        }// end function

        override public function onRegister() : void
        {
            eventMap.mapListener(this.view, CloseEvent.CLOSE, this.closeHandler, CloseEvent);
            return;
        }// end function

        private function closeHandler(event:CloseEvent) : void
        {
            this.closePopup.close(this.view.getElementAt(0));
            this.triggerStateAction.dispatch(StateAction.CANCEL);
            return;
        }// end function

    }
}
