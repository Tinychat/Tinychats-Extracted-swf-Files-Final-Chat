package com.tinychat.ui.components.controlbar.buttons
{
    import flash.events.*;
    import spark.components.*;

    public class OpenGraphToggleToolTip extends SkinnableContainer
    {
        public var close:Button;
        private static var _skinParts:Object = {close:false, contentGroup:false};

        public function OpenGraphToggleToolTip()
        {
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.close)
            {
                this.close.addEventListener(MouseEvent.CLICK, this.closeClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.close)
            {
                this.close.removeEventListener(MouseEvent.CLICK, this.closeClickHandler);
            }
            return;
        }// end function

        private function closeClickHandler(event:MouseEvent) : void
        {
            dispatchEvent(new Event(Event.CLOSE, true));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
