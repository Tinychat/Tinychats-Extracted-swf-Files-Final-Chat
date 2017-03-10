package com.tinychat.model.social.chat.spam
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.message.*;

    public class FloodFilter extends Object implements SpamFilter
    {
        private var maxMessages:uint;
        private var inInterval:Number;

        public function FloodFilter(param1:uint, param2:Number)
        {
            this.setLimit(param1, param2);
            return;
        }// end function

        public function setLimit(param1:uint, param2:Number) : void
        {
            this.maxMessages = param1;
            this.inInterval = param2;
            return;
        }// end function

        public function filter(param1:TimestampedMessage, param2:Vector.<TimestampedMessage>) : Boolean
        {
            var _loc_3:* = param2.length - this.maxMessages;
            if (this.maxMessages != 0)
            {
            }
            if (_loc_3 >= 0)
            {
                if (param2.length >= _loc_3)
                {
                }
            }
            return this.inInterval < param1.timestamp - param2[_loc_3].timestamp;
        }// end function

    }
}
