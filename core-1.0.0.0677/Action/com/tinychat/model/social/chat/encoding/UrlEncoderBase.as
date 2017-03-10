package com.tinychat.model.social.chat.encoding
{
    import flash.events.*;
    import flash.text.engine.*;

    public class UrlEncoderBase extends BaseEncoder implements InteractiveElementEncoder
    {
        public static const COLOR:uint = 33972;

        public function UrlEncoderBase()
        {
            super(new FontFormatFactory(new ElementFormat()), MouseCursor.BUTTON);
            super.color = COLOR;
            return;
        }// end function

        override public function set color(param1:uint) : void
        {
            return;
        }// end function

        override protected function createContentElement(param1:String) : ContentElement
        {
            return new TextElement(param1, format, dispatcher);
        }// end function

        override public function test(param1:String) : Boolean
        {
            return splitter.test(param1);
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            dispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            dispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return this.dispatchEvent(event);
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return this.hasEventListener(param1);
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return this.willTrigger(param1);
        }// end function

    }
}
