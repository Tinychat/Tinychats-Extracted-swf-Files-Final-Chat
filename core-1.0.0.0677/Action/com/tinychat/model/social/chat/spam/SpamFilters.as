package com.tinychat.model.social.chat.spam
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.message.*;

    public class SpamFilters extends Object
    {
        private var filters:Vector.<SpamFilter>;
        private var history:Vector.<TimestampedMessage>;
        private var _historyTimeLength:Number;
        private var _maxHistoryLength:uint;

        public function SpamFilters(param1:Vector.<SpamFilter>, param2:Number = 30000, param3:uint = 5)
        {
            this.filters = param1;
            this.history = new Vector.<TimestampedMessage>;
            this._historyTimeLength = param2;
            this._maxHistoryLength = param3;
            return;
        }// end function

        public function set maxHistoryLength(param1:uint) : void
        {
            if (this._maxHistoryLength != param1)
            {
                this._maxHistoryLength = param1;
                this.trimHistoryToMaxLimit();
            }
            return;
        }// end function

        public function set historyTimeLength(param1:Number) : void
        {
            this._historyTimeLength = param1;
            return;
        }// end function

        public function filter(param1:TimestampedMessage) : Boolean
        {
            var _loc_3:SpamFilter = null;
            var _loc_2:Boolean = true;
            this.removeExpiredHistory();
            for each (_loc_3 in this.filters)
            {
                
                if (!_loc_3.filter(param1, this.history))
                {
                    _loc_2 = false;
                    break;
                }
            }
            this.history.push(param1);
            this.trimHistoryToMaxLimit();
            return _loc_2;
        }// end function

        private function trimHistoryToMaxLimit() : void
        {
            while (this.history.length > this._maxHistoryLength)
            {
                
                this.history.shift();
            }
            return;
        }// end function

        private function removeExpiredHistory() : void
        {
            do
            {
                
                this.history.shift();
                if (this.history.length > 0)
                {
                }
            }while (this.hasExpired(this.history[0], this._historyTimeLength))
            return;
        }// end function

        public function hasExpired(param1:TimestampedMessage, param2:Number) : Boolean
        {
            var _loc_3:* = new Date().time;
            return _loc_3 - param1.timestamp >= param2;
        }// end function

    }
}
