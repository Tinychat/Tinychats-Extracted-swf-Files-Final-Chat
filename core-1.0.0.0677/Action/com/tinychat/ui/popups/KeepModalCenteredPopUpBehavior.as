package com.tinychat.ui.popups
{
    import com.adobe.popup.*;
    import flash.display.*;
    import flash.events.*;
    import mx.core.*;

    public class KeepModalCenteredPopUpBehavior extends Object implements IPopUpBehavior
    {
        private var popup:IFlexDisplayObject;
        private var opener:PopUpBase;

        public function KeepModalCenteredPopUpBehavior()
        {
            return;
        }// end function

        public function apply(param1:PopUpBase) : void
        {
            this.opener = param1;
            param1.addEventListener(PopUpEvent.OPENING, this.openingHandler);
            return;
        }// end function

        private function openingHandler(event:PopUpEvent) : void
        {
            if (this.opener.modal)
            {
                this.popup = event.popup;
                this.opener.addEventListener(PopUpEvent.CLOSED, this.closedHandler);
                this.opener.parent.addEventListener(Event.RESIZE, this.resizeHandler);
                this.popup.addEventListener(Event.RESIZE, this.resizeHandler);
            }
            return;
        }// end function

        private function closedHandler(event:PopUpEvent) : void
        {
            if (this.popup)
            {
                this.opener.removeEventListener(PopUpEvent.CLOSED, this.closedHandler);
                this.opener.parent.removeEventListener(Event.RESIZE, this.resizeHandler);
                this.popup.removeEventListener(Event.RESIZE, this.resizeHandler);
                this.popup = null;
            }
            return;
        }// end function

        private function resizeHandler(event:Event) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_2:* = this.popup.parent;
            if (_loc_2)
            {
                _loc_3 = Math.round((_loc_2.width - this.popup.width) / 2);
                _loc_4 = Math.round((_loc_2.height - this.popup.height) / 2);
                this.popup.move(_loc_3, _loc_4);
            }
            return;
        }// end function

    }
}
