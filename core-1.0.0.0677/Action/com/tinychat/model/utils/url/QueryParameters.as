package com.tinychat.model.utils.url
{
    import com.tinychat.model.utils.*;

    dynamic public class QueryParameters extends OrderedObject
    {

        public function QueryParameters(param1:String = "")
        {
            this.addString(param1);
            return;
        }// end function

        public function get queryString() : String
        {
            var _loc_2:String = null;
            var _loc_3:String = null;
            var _loc_1:Array = [];
            for (_loc_2 in this)
            {
                
                _loc_3 = _loc_2;
                if (this[_loc_2] != "")
                {
                    _loc_3 = _loc_3 + ("=" + this[_loc_2]);
                }
                _loc_1.push(_loc_3);
            }
            if (_loc_1.length > 0)
            {
                return _loc_1.join("&");
            }
            return "";
        }// end function

        public function set queryString(param1:String) : void
        {
            super.clear();
            this.addString(param1);
            return;
        }// end function

        override function setProperty(param1, param2) : void
        {
            var _loc_3:RegExp = null;
            if (param1)
            {
            }
            if (param2)
            {
                _loc_3 = /\s+/g;
                param1 = String(param1).replace(_loc_3, "_");
                param2 = encodeURIComponent(String(param2));
                super.setProperty(param1, param2);
            }
            return;
        }// end function

        private function addString(param1:String) : void
        {
            var _loc_3:String = null;
            var _loc_4:Array = null;
            var _loc_2:* = param1.split("&");
            for each (_loc_3 in _loc_2)
            {
                
                if (_loc_3.indexOf("=") >= 0)
                {
                    _loc_4 = _loc_3.split("=");
                    if (_loc_4.length == 2)
                    {
                        this[_loc_4[0]] = _loc_4[1];
                    }
                    continue;
                }
                if (_loc_3.length > 0)
                {
                    this[_loc_3] = "";
                }
            }
            return;
        }// end function

        public function valueOf() : Object
        {
            return this.queryString;
        }// end function

        override public function toString() : String
        {
            return this.queryString;
        }// end function

    }
}
