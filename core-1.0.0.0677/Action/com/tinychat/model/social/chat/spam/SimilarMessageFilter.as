package com.tinychat.model.social.chat.spam
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.message.*;

    public class SimilarMessageFilter extends Object implements SpamFilter
    {
        private var _maxConsecutive:uint;
        private var _maxCommonRatio:Number;
        private var _maxLcsLength:uint;
        private var _minimumCharacterCount:uint;

        public function SimilarMessageFilter(param1:uint = 2, param2:Number = 0.9, param3:uint = 25, param4:uint = 10)
        {
            this._maxConsecutive = param1;
            this._maxCommonRatio = param2;
            this._maxLcsLength = param3;
            this._minimumCharacterCount = param4;
            return;
        }// end function

        public function set maxConsecutive(param1:uint) : void
        {
            this._maxConsecutive = param1;
            return;
        }// end function

        public function set maxCommonRatio(param1:Number) : void
        {
            this._maxCommonRatio = param1;
            return;
        }// end function

        public function set maxLcsLength(param1:Number) : void
        {
            this._maxLcsLength = param1;
            return;
        }// end function

        public function set minimumCharacterCount(param1:uint) : void
        {
            this._minimumCharacterCount = param1;
            return;
        }// end function

        public function filter(param1:TimestampedMessage, param2:Vector.<TimestampedMessage>) : Boolean
        {
            var _loc_5:uint = 0;
            var _loc_6:Number = NaN;
            var _loc_7:TimestampedMessage = null;
            var _loc_8:int = 0;
            var _loc_3:Boolean = true;
            var _loc_4:* = param1;
            if (_loc_4.length >= this._minimumCharacterCount)
            {
            }
            if (param2.length >= this._maxConsecutive)
            {
                _loc_8 = param2.length - 1;
                while (_loc_8 >= param2.length - this._maxConsecutive)
                {
                    
                    _loc_7 = param2[_loc_8];
                    _loc_5 = longestCommonSubstring(_loc_4.text, _loc_7.text);
                    _loc_6 = _loc_5 / Math.max(_loc_4.length, _loc_7.length);
                    if (_loc_5 <= this._maxLcsLength)
                    {
                    }
                    if (_loc_6 >= this._maxCommonRatio)
                    {
                        _loc_3 = false;
                        break;
                    }
                    _loc_8 = _loc_8 - 1;
                }
            }
            return _loc_3;
        }// end function

    }
}
