package com.tinychat.ui.popups
{
    import com.adobe.popup.*;
    import flash.display.*;
    import flash.events.*;

    public class OpenAfterEventPopUpBehavior extends Object implements IPopUpBehavior
    {
        private var popupEvent:PopUpEvent;
        private var dispatcher:IEventDispatcher;
        private var type:String;

        public function OpenAfterEventPopUpBehavior()
        {
            return;
        }// end function

        public function delayUntilEvent(param1:IEventDispatcher, param2:String) : void
        {
            this.dispatcher = param1;
            this.type = param2;
            param1.addEventListener(param2, this.dispatcherEventHandler);
            return;
        }// end function

        public function apply(param1:PopUpBase) : void
        {
            param1.addEventListener(PopUpEvent.OPENING, this.openingHandler);
            return;
        }// end function

        private function openingHandler(event:PopUpEvent) : void
        {
            if (this.dispatcher)
            {
                this.popupEvent = event;
                this.popupEvent.suspendClosure();
            }
            return;
        }// end function

        private function dispatcherEventHandler(event:Event) : void
        {
            if (this.popupEvent)
            {
            }
            if (!DisplayObject(this.popupEvent.popup).stage)
            {
                this.popupEvent.resumeClosure();
            }
            this.dispatcher.removeEventListener(this.type, this.dispatcherEventHandler);
            this.dispatcher = null;
            this.popupEvent = null;
            return;
        }// end function

    }
}
