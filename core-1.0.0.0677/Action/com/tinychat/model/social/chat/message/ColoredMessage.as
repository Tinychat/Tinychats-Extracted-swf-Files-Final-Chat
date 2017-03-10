package com.tinychat.model.social.chat.message
{

    public class ColoredMessage extends Object implements Message
    {
        private var _text:String;
        private var _color:uint;

        public function ColoredMessage(param1:String, param2:uint)
        {
            this._text = param1;
            this._color = param2;
            return;
        }// end function

        public function get text() : String
        {
            return this._text;
        }// end function

        public function get length() : int
        {
            return this._text.length;
        }// end function

        public function get color() : uint
        {
            return this._color;
        }// end function

        public function toString() : String
        {
            return this.text;
        }// end function

    }
}
