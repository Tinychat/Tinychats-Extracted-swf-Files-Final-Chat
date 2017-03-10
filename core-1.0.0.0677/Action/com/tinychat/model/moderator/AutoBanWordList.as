package com.tinychat.model.moderator
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.lists.*;
    import mx.collections.*;

    public class AutoBanWordList extends Object
    {
        private var cookie:FlashCookieProxy;
        private var words:NamedItemList;

        public function AutoBanWordList(param1:FlashCookieProxy)
        {
            var _loc_2:String = null;
            this.cookie = param1;
            this.words = new NamedItemList();
            for each (_loc_2 in param1.autoBanWordList)
            {
                
                this.add(_loc_2);
            }
            return;
        }// end function

        public function get list() : IList
        {
            return this.words;
        }// end function

        public function add(param1:String) : void
        {
            if (!this.has(param1))
            {
                this.words.addItem(new NamedListItem(param1));
            }
            return;
        }// end function

        public function remove(param1:String) : void
        {
            if (this.has(param1))
            {
                this.words.removeItem(param1);
            }
            return;
        }// end function

        public function has(param1:String) : Boolean
        {
            return this.words.hasItemWithName(param1);
        }// end function

        public function match(param1:String) : Boolean
        {
            var value:* = param1;
            return !this.words.source.every(function (param1:NamedListItem, param2:int, param3:Array) : Boolean
            {
                return value.indexOf(param1.name) == -1;
            }// end function
            );
        }// end function

        public function updateCookie() : void
        {
            this.cookie.autoBanWordList = this.words.source.map(function (param1:NamedListItem, param2:int, param3:Array) : String
            {
                return param1.name;
            }// end function
            );
            return;
        }// end function

    }
}
