package com.tinychat.model.social.chat.encoding
{
    import flash.events.*;
    import flash.ui.*;

    public class MouseCursor extends Object
    {
        private var _dispatcher:EventDispatcher;
        private var cursorName:String;
        public static var IBEAM:MouseCursor = new MouseCursor(IBEAM, flash.ui::MouseCursor.IBEAM);
        public static var BUTTON:MouseCursor = new MouseCursor(BUTTON, flash.ui::MouseCursor.BUTTON);

        public function MouseCursor(param1:MouseCursor, param2:String)
        {
            this.cursorName = param2;
            return;
        }// end function

        public function set dispatcher(param1:EventDispatcher) : void
        {
            this._dispatcher = param1;
            this._dispatcher.addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverHandler);
            this._dispatcher.addEventListener(MouseEvent.MOUSE_OUT, this.mouseOutHandler);
            return;
        }// end function

        private function mouseOverHandler(event:Event) : void
        {
            Mouse.cursor = this.cursorName;
            return;
        }// end function

        private function mouseOutHandler(event:Event) : void
        {
            Mouse.cursor = MouseCursor.ARROW;
            return;
        }// end function

    }
}
