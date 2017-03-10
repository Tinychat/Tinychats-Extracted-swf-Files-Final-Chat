package com.adobe.serialization.json
{
    import flash.utils.*;

    public class JSONEncoder extends Object
    {
        private var jsonString:String;

        public function JSONEncoder(value)
        {
            this.jsonString = this.convertToString(value);
            return;
        }// end function

        private function escapeString(str:String) : String
        {
            var _loc_3:String = null;
            var _loc_6:String = null;
            var _loc_7:String = null;
            var _loc_2:String = "";
            var _loc_4:* = str.length;
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                _loc_3 = str.charAt(_loc_5);
                switch(_loc_3)
                {
                    case "\"":
                    {
                        _loc_2 = _loc_2 + "\\\"";
                        break;
                    }
                    case "\\":
                    {
                        _loc_2 = _loc_2 + "\\\\";
                        break;
                    }
                    case "\b":
                    {
                        _loc_2 = _loc_2 + "\\b";
                        break;
                    }
                    case "\f":
                    {
                        _loc_2 = _loc_2 + "\\f";
                        break;
                    }
                    case "\n":
                    {
                        _loc_2 = _loc_2 + "\\n";
                        break;
                    }
                    case "\r":
                    {
                        _loc_2 = _loc_2 + "\\r";
                        break;
                    }
                    case "\t":
                    {
                        _loc_2 = _loc_2 + "\\t";
                        break;
                    }
                    default:
                    {
                        if (_loc_3 < " ")
                        {
                            _loc_6 = _loc_3.charCodeAt(0).toString(16);
                            _loc_7 = _loc_6.length == 2 ? ("00") : ("000");
                            _loc_2 = _loc_2 + ("\\u" + _loc_7 + _loc_6);
                        }
                        else
                        {
                            _loc_2 = _loc_2 + _loc_3;
                        }
                        break;
                    }
                }
                _loc_5 = _loc_5 + 1;
            }
            return "\"" + _loc_2 + "\"";
        }// end function

        private function arrayToString(a:Array) : String
        {
            var _loc_2:String = "";
            var _loc_3:int = 0;
            while (_loc_3 < a.length)
            {
                
                if (_loc_2.length > 0)
                {
                    _loc_2 = _loc_2 + ",";
                }
                _loc_2 = _loc_2 + this.convertToString(a[_loc_3]);
                _loc_3 = _loc_3 + 1;
            }
            return "[" + _loc_2 + "]";
        }// end function

        public function getString() : String
        {
            return this.jsonString;
        }// end function

        private function objectToString(o:Object) : String
        {
            var value:Object;
            var key:String;
            var v:XML;
            var o:* = o;
            var s:String;
            var classInfo:* = describeType(o);
            if (classInfo.@name.toString() == "Object")
            {
                var _loc_3:int = 0;
                var _loc_4:* = o;
                while (_loc_4 in _loc_3)
                {
                    
                    key = _loc_4[_loc_3];
                    value = o[key];
                    if (value is Function)
                    {
                        continue;
                    }
                    if (s.length > 0)
                    {
                        s = s + ",";
                    }
                    s = s + (this.escapeString(key) + ":" + this.convertToString(value));
                }
            }
            else
            {
                var _loc_3:int = 0;
                var _loc_6:int = 0;
                var _loc_7:* = classInfo..;
                var _loc_5:* = new XMLList("");
                for each (_loc_8 in _loc_7)
                {
                    
                    var _loc_9:* = _loc_8;
                    with (_loc_8)
                    {
                        if (name() != "variable")
                        {
                            if (name() == "accessor")
                            {
                            }
                        }
                        if (attribute("access").charAt(0) == "r")
                        {
                            _loc_5[_loc_6] = _loc_8;
                        }
                    }
                }
                var _loc_4:* = _loc_5;
                while (_loc_4 in _loc_3)
                {
                    
                    v = _loc_4[_loc_3];
                    if (v.metadata)
                    {
                        var _loc_6:int = 0;
                        var _loc_7:* = v.metadata;
                        var _loc_5:* = new XMLList("");
                        for each (_loc_8 in _loc_7)
                        {
                            
                            var _loc_9:* = _loc_8;
                            with (_loc_8)
                            {
                                if (@name == "Transient")
                                {
                                    _loc_5[_loc_6] = _loc_8;
                                }
                            }
                        }
                    }
                    if (_loc_5.length() > 0)
                    {
                        continue;
                    }
                    if (s.length > 0)
                    {
                        s = s + ",";
                    }
                    s = s + (this.escapeString(v.@name.toString()) + ":" + this.convertToString(o[v.@name]));
                }
            }
            return "{" + s + "}";
        }// end function

        private function convertToString(value) : String
        {
            if (value is String)
            {
                return this.escapeString(value as String);
            }
            if (value is Number)
            {
                return isFinite(value as Number) ? (value.toString()) : ("null");
            }
            else if (value is Boolean)
            {
                return value ? ("true") : ("false");
            }
            else
            {
                if (value is Array)
                {
                    return this.arrayToString(value as Array);
                }
                if (value is Object)
                {
                }
                if (value != null)
                {
                    return this.objectToString(value);
                }
            }
            return "null";
        }// end function

    }
}
