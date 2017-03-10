package com.tinychat.model.social.chat
{
    import __AS3__.vec.*;

    public class MessageHistory extends Object
    {
        private var messages:Vector.<String>;
        private var _limit:uint;
        private var currentIndex:uint;
        private static const DEFAULT_LIMIT:uint = 20;

        public function MessageHistory(param1:uint = 20)
        {
            this.messages = new Vector.<String>;
            this._limit = param1;
            this.currentIndex = 0;
            return;
        }// end function

        public function get length() : uint
        {
            return this.messages.length;
        }// end function

        public function get limit() : uint
        {
            return this._limit;
        }// end function

        public function set limit(param1:uint) : void
        {
            this._limit = param1;
            if (this.messages.length >= this._limit)
            {
                this.messages.splice(param1, this.messages.length - param1);
            }
            return;
        }// end function

        public function add(param1:String) : void
        {
            this.messages.unshift(param1);
            if (this.messages.length > this._limit)
            {
                this.messages.pop();
            }
            return;
        }// end function

        public function updateCurrent(param1:String) : void
        {
            this.messages[this.currentIndex] = param1;
            return;
        }// end function

        public function messageAt(param1:uint) : String
        {
            return this.messages[param1];
        }// end function

        public function next() : String
        {
            this.currentIndex = Math.min((this.currentIndex + 1), (this.messages.length - 1));
            return this.messages[this.currentIndex];
        }// end function

        public function previous() : String
        {
            this.currentIndex = Math.max((this.currentIndex - 1), 0);
            return this.messages[this.currentIndex];
        }// end function

        public function resetIteration() : void
        {
            this.currentIndex = 0;
            return;
        }// end function

    }
}
