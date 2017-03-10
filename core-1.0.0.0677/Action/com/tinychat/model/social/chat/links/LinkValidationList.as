package com.tinychat.model.social.chat.links
{
    import com.tinychat.model.utils.url.*;

    public class LinkValidationList extends Object
    {
        private var source:Array;

        public function LinkValidationList()
        {
            this.source = [];
            return;
        }// end function

        public function load(param1:Array) : void
        {
            this.source = param1;
            return;
        }// end function

        public function approve(param1:Url) : Boolean
        {
            var _loc_3:String = null;
            var _loc_4:RegExp = null;
            var _loc_2:* = param1.hostname.toLowerCase();
            var _loc_5:uint = 0;
            while (_loc_5 < this.source.length)
            {
                
                _loc_3 = this.source[_loc_5];
                if (_loc_3.indexOf("/") == 0)
                {
                    _loc_4 = new RegExp(_loc_3.substring(1, _loc_3.lastIndexOf("/")), _loc_3.substr((_loc_3.lastIndexOf("/") + 1)));
                    if (_loc_4.test(_loc_2))
                    {
                        return true;
                    }
                }
                else if (_loc_3 == _loc_2)
                {
                    return true;
                }
                _loc_5 = _loc_5 + 1;
            }
            return false;
        }// end function

    }
}
