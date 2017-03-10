package com.adobe.popup
{
    import flash.events.*;
    import mx.core.*;

    public class PopUpEvent extends Event
    {
        private var suspendCallback:Function;
        private var resumeCallback:Function;
        private var _popup:IFlexDisplayObject;
        public static const OPENING:String = "opening";
        public static const OPENED:String = "opened";
        public static const CLOSING:String = "closing";
        public static const CLOSED:String = "closed";

        public function PopUpEvent(type:String, popup:IFlexDisplayObject, suspendCallback:Function, resumeCallback:Function)
        {
            super(type);
            this._popup = popup;
            this.suspendCallback = suspendCallback;
            this.resumeCallback = resumeCallback;
            return;
        }// end function

        public function get popup() : IFlexDisplayObject
        {
            return this._popup;
        }// end function

        public function suspendClosure() : void
        {
            if (this.suspendCallback != null)
            {
                this.suspendCallback();
            }
            return;
        }// end function

        public function resumeClosure() : void
        {
            if (this.resumeCallback != null)
            {
                this.resumeCallback();
            }
            return;
        }// end function

        override public function clone() : Event
        {
            return new PopUpEvent(type, this._popup, this.suspendCallback, this.resumeCallback);
        }// end function

    }
}
