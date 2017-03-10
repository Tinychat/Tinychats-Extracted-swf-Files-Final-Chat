package com.tinychat.model.social.chat
{
    import __AS3__.vec.*;

    public class MessageAutoComplete extends Object
    {
        private var _dataProvider:Vector.<String>;
        private var matches:Vector.<String>;
        private var currentIndex:uint;

        public function MessageAutoComplete()
        {
            this._dataProvider = new Vector.<String>;
            return;
        }// end function

        public function set dataProvider(param1:Vector.<String>) : void
        {
            this._dataProvider = param1;
            return;
        }// end function

        public function match(param1:String) : String
        {
            var _loc_2:String = null;
            this.matches = new Vector.<String>;
            this.currentIndex = 0;
            for each (_loc_2 in this._dataProvider)
            {
                
                if (_loc_2.indexOf(param1) == 0)
                {
                    this.matches.push(_loc_2);
                }
            }
            return this.next();
        }// end function

        public function next() : String
        {
            var _loc_1:String = null;
            if (this.matches.length > 0)
            {
                _loc_1 = this.matches[this.currentIndex];
                this.currentIndex = (this.currentIndex + 1) % this.matches.length;
                return _loc_1;
            }
            return "";
        }// end function

    }
}
