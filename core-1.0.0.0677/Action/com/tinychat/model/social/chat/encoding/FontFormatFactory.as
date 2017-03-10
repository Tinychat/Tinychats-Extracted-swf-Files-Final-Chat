package com.tinychat.model.social.chat.encoding
{
    import flash.text.engine.*;

    public class FontFormatFactory extends Object
    {
        private var _family:String;
        private var _weight:String;
        private var _size:Number;
        private var _color:uint;
        private var _format:ElementFormat;
        private var formatChanged:Boolean;

        public function FontFormatFactory(param1:ElementFormat)
        {
            this._format = param1;
            this.family = this._format.fontDescription.fontName;
            this.size = this._format.fontSize;
            this.color = this._format.color;
            return;
        }// end function

        public function get family() : String
        {
            return this._family;
        }// end function

        public function set family(param1:String) : void
        {
            if (this._family != param1)
            {
                this._family = param1;
                this.formatChanged = true;
            }
            return;
        }// end function

        public function get size() : Number
        {
            return this._size;
        }// end function

        public function set size(param1:Number) : void
        {
            if (this._size != param1)
            {
                this._size = param1;
                this.formatChanged = true;
            }
            return;
        }// end function

        public function get color() : uint
        {
            return this._color;
        }// end function

        public function set color(param1:uint) : void
        {
            if (this._color != param1)
            {
                this._color = param1;
                this.formatChanged = true;
            }
            return;
        }// end function

        public function get weight() : String
        {
            return this._weight;
        }// end function

        public function set weight(param1:String) : void
        {
            if (this._weight != param1)
            {
                this._weight = param1;
                this.formatChanged = true;
            }
            return;
        }// end function

        public function get format() : ElementFormat
        {
            if (this.formatChanged)
            {
                this._format = new ElementFormat(new FontDescription(this.family, this.weight ? (this.weight) : (this._format.fontDescription.fontWeight), this._format.fontDescription.fontPosture, FontLookup.EMBEDDED_CFF), this.size, this.color);
                this.formatChanged = false;
            }
            return this._format;
        }// end function

    }
}
