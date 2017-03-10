package com.tinychat.ui.popups
{
    import com.adobe.popup.*;
    import flash.display.*;
    import flash.utils.*;

    public class DelayOpeningPopUpBehavior extends Object implements IPopUpBehavior
    {
        public var delay:Number;
        private var popupEvent:PopUpEvent;

        public function DelayOpeningPopUpBehavior()
        {
            this.delay = 0;
            return;
        }// end function

        public function apply(param1:PopUpBase) : void
        {
            param1.addEventListener(PopUpEvent.OPENING, this.onOpening);
            return;
        }// end function

        private function onOpening(event:PopUpEvent) : void
        {
            if (this.delay > 0)
            {
                this.popupEvent = event;
                this.popupEvent.suspendClosure();
                setTimeout(this.delayCompleteHandler, this.delay);
            }
            return;
        }// end function

        private function delayCompleteHandler() : void
        {
            if (!DisplayObject(this.popupEvent.popup).stage)
            {
                this.popupEvent.resumeClosure();
            }
            this.popupEvent = null;
            return;
        }// end function

    }
}
