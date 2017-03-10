package com.tinychat.ui.components.social.chat.list
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.encoding.*;
    import flash.display.*;
    import flash.text.engine.*;
    import flashx.textLayout.compose.*;

    public class MessageText extends Sprite
    {
        protected var textBlock:TextBlock;
        protected var textLines:Vector.<TextLine>;
        protected var swfContext:ISWFContext;
        private var encoder:TextEncoder;
        private var encoding:ContentElement;
        private var encodingIsValid:Boolean;
        private var _text:String;
        private var _lineHeight:Number;
        private var _firstLineHeight:Number;
        private var _width:Number;
        private var _height:Number;

        public function MessageText(param1:TextEncoder, param2:ISWFContext)
        {
            this.encoder = param1;
            this.swfContext = param2;
            this.textBlock = new TextBlock();
            this.textBlock.baselineFontDescription = new FontDescription(param1.family);
            this.textLines = new Vector.<TextLine>;
            this._height = 0;
            return;
        }// end function

        override public function get width() : Number
        {
            return this._width;
        }// end function

        override public function get height() : Number
        {
            return this._height;
        }// end function

        public function get lineCount() : uint
        {
            return this.textLines.length;
        }// end function

        public function get firstLine() : TextLine
        {
            return this.textLines[0];
        }// end function

        public function get lastLine() : TextLine
        {
            return this.textLines[(this.textLines.length - 1)];
        }// end function

        public function set text(param1:String) : void
        {
            if (this._text != param1)
            {
                this._text = param1;
                this.encodingIsValid = false;
            }
            return;
        }// end function

        public function set color(param1:uint) : void
        {
            if (this.encoder.color != param1)
            {
                this.encoder.color = param1;
                this.encodingIsValid = false;
            }
            return;
        }// end function

        public function set weight(param1:String) : void
        {
            if (this.encoder.weight != param1)
            {
                this.encoder.weight = param1;
                this.encodingIsValid = false;
            }
            return;
        }// end function

        public function render(param1:Number, param2:Number, param3:Number, param4:Number) : void
        {
            var _loc_5:TextLine = null;
            this._height = param4;
            this._lineHeight = param3;
            this._firstLineHeight = param4;
            this.removeExistingLines();
            if (!this.encodingIsValid)
            {
                this.encoding = this.encoder.encode(this._text);
                this.encodingIsValid = true;
            }
            this.textBlock.content = this.encoding;
            this.textLines = new Vector.<TextLine>;
            if (this.swfContext)
            {
                _loc_5 = this.swfContext.callInContext(this.textBlock.createTextLine, this.textBlock, [null, param1]);
            }
            else
            {
                _loc_5 = this.textBlock.createTextLine(null, param1);
            }
            while (_loc_5)
            {
                
                this._width = _loc_5.width;
                this._height = this._height + this._lineHeight;
                this.textLines.push(_loc_5);
                if (this.swfContext)
                {
                    _loc_5 = this.swfContext.callInContext(this.textBlock.createTextLine, this.textBlock, [_loc_5, param2]);
                    continue;
                }
                _loc_5 = this.textBlock.createTextLine(_loc_5, param2);
            }
            return;
        }// end function

        public function layout(param1:Number = 0) : void
        {
            var _loc_4:TextLine = null;
            var _loc_2:* = param1;
            var _loc_3:Number = 0;
            this.removeExistingLines();
            var _loc_5:uint = 0;
            while (_loc_5 < this.textLines.length)
            {
                
                _loc_4 = this.textLines[_loc_5];
                addChild(_loc_4);
                if (_loc_5 == 0)
                {
                    _loc_3 = _loc_3 - _loc_4.descent;
                    _loc_3 = _loc_3 + this._firstLineHeight;
                }
                _loc_3 = _loc_3 + this._lineHeight;
                _loc_4.x = _loc_2;
                _loc_4.y = _loc_3;
                _loc_2 = 0;
                _loc_5 = _loc_5 + 1;
            }
            return;
        }// end function

        protected function removeExistingLines() : void
        {
            var _loc_1:TextLine = null;
            for each (_loc_1 in this.textLines)
            {
                
                if (contains(_loc_1))
                {
                    removeChild(_loc_1);
                }
            }
            return;
        }// end function

    }
}
