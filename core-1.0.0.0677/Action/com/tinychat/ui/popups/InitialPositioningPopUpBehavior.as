package com.tinychat.ui.popups
{
    import com.adobe.popup.*;

    public class InitialPositioningPopUpBehavior extends Object implements IPopUpBehavior
    {
        private var opener:PopUpBase;
        private var _x:Number;
        private var _y:Number;

        public function InitialPositioningPopUpBehavior()
        {
            return;
        }// end function

        public function get x() : Number
        {
            return this._x;
        }// end function

        public function set x(param1:Number) : void
        {
            this._x = param1;
            return;
        }// end function

        public function get y() : Number
        {
            return this._y;
        }// end function

        public function set y(param1:Number) : void
        {
            this._y = param1;
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
            this.opener.removeEventListener(PopUpEvent.OPENING, this.openingHandler);
            this.opener = null;
            event.popup.move(this._x, this._y);
            return;
        }// end function

    }
}
