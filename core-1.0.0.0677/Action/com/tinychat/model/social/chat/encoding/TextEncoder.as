package com.tinychat.model.social.chat.encoding
{
    import __AS3__.vec.*;
    import com.tinychat.model.utils.string.*;
    import flash.text.engine.*;

    public class TextEncoder extends Object implements FontSettings
    {
        private var encoders:Vector.<ElementEncoder>;
        private var splitters:Array;
        private var _family:String;
        private var _size:Number;
        private var _color:uint;
        private var _weight:String;

        public function TextEncoder(param1:Vector.<ElementEncoder>)
        {
            this.encoders = param1;
            this.splitters = [];
            var _loc_2:uint = 0;
            while (_loc_2 < this.encoders.length)
            {
                
                this.splitters.push(this.encoders[_loc_2].splitter);
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

        public function get family() : String
        {
            return this._family;
        }// end function

        public function set family(param1:String) : void
        {
            var _loc_2:ElementEncoder = null;
            if (this._family != param1)
            {
                this._family = param1;
                for each (_loc_2 in this.encoders)
                {
                    
                    _loc_2.family = param1;
                }
            }
            return;
        }// end function

        public function get size() : Number
        {
            return this._size;
        }// end function

        public function set size(param1:Number) : void
        {
            var _loc_2:ElementEncoder = null;
            if (this._size != param1)
            {
                this._size = param1;
                for each (_loc_2 in this.encoders)
                {
                    
                    _loc_2.size = param1;
                }
            }
            return;
        }// end function

        public function get color() : uint
        {
            return this._color;
        }// end function

        public function set color(param1:uint) : void
        {
            var _loc_2:ElementEncoder = null;
            if (this._color != param1)
            {
                this._color = param1;
                for each (_loc_2 in this.encoders)
                {
                    
                    _loc_2.color = param1;
                }
            }
            return;
        }// end function

        public function get weight() : String
        {
            return this._weight;
        }// end function

        public function set weight(param1:String) : void
        {
            var _loc_2:ElementEncoder = null;
            if (this._weight != param1)
            {
                this._weight = param1;
                for each (_loc_2 in this.encoders)
                {
                    
                    _loc_2.weight = param1;
                }
            }
            return;
        }// end function

        public function encode(param1:String) : ContentElement
        {
            var _loc_2:ContentElement = null;
            var _loc_4:Array = null;
            var _loc_6:String = null;
            var _loc_7:uint = 0;
            var _loc_8:ElementEncoder = null;
            var _loc_3:* = new Vector.<ContentElement>;
            _loc_4 = multiSplit(param1, this.splitters);
            var _loc_5:uint = 0;
            while (_loc_5 < _loc_4.length)
            {
                
                _loc_6 = _loc_4[_loc_5];
                _loc_7 = 0;
                while (_loc_7 < this.encoders.length)
                {
                    
                    _loc_8 = this.encoders[_loc_7];
                    if (_loc_8.test(_loc_6))
                    {
                        _loc_3.push(_loc_8.encode(_loc_6));
                        break;
                    }
                    _loc_7 = _loc_7 + 1;
                }
                _loc_5 = _loc_5 + 1;
            }
            if (_loc_3.length == 1)
            {
                _loc_2 = _loc_3[0];
            }
            else
            {
                _loc_2 = new GroupElement(_loc_3);
            }
            return _loc_2;
        }// end function

    }
}
