package com.tinychat.model.utils.bencode
{
    import Bencoder.as$15.*;

    public class Bencoder extends Object
    {

        public function Bencoder()
        {
            return;
        }// end function

        public static function encode(param1) : String
        {
            var _loc_2:String = "";
            if (param1 is String)
            {
                _loc_2 = encodeString(param1);
            }
            else if (param1 is int)
            {
                _loc_2 = encodeInteger(param1);
            }
            else if (param1 is Array)
            {
                _loc_2 = encodeList(param1);
            }
            else if (param1 is Object)
            {
                _loc_2 = encodeDictionary(param1);
            }
            return _loc_2;
        }// end function

        public static function decode(param1:String)
        {
            var _loc_2:* = decodeNext(param1);
            return _loc_2.item;
        }// end function

        private static function decodeNext(param1:String) : BencoderResult
        {
            var _loc_2:* = param1.charAt(0);
            switch(_loc_2)
            {
                case "d":
                {
                    return decodeDictionary(param1);
                }
                case "l":
                {
                    return decodeList(param1);
                }
                case "i":
                {
                    return decodeInteger(param1);
                }
                default:
                {
                    return decodeString(param1);
                    break;
                }
            }
        }// end function

        private static function encodeString(param1:String) : String
        {
            return param1.length + ":" + param1;
        }// end function

        private static function decodeString(param1:String) : BencoderResult
        {
            var _loc_2:* = param1.indexOf(":");
            if (_loc_2 == -1)
            {
                return new BencoderResult("", 0);
            }
            var _loc_3:* = int(param1.substr(0, _loc_2));
            var _loc_4:* = param1.substr((_loc_2 + 1), _loc_3);
            return new BencoderResult(_loc_4, _loc_2 + _loc_3 + 1);
        }// end function

        private static function encodeInteger(param1:int) : String
        {
            return "i" + param1.toString() + "e";
        }// end function

        private static function decodeInteger(param1:String) : BencoderResult
        {
            var _loc_2:* = param1.indexOf("e");
            var _loc_3:* = int(param1.substr(1, (_loc_2 - 1)));
            return new BencoderResult(_loc_3, (_loc_2 + 1));
        }// end function

        private static function encodeList(param1:Array) : String
        {
            var _loc_2:String = "l";
            var _loc_3:int = 0;
            while (_loc_3 < param1.length)
            {
                
                _loc_2 = _loc_2 + encode(param1[_loc_3]);
                _loc_3 = _loc_3 + 1;
            }
            _loc_2 = _loc_2 + "e";
            return _loc_2;
        }// end function

        private static function decodeList(param1:String) : BencoderResult
        {
            var _loc_4:BencoderResult = null;
            var _loc_2:Array = [];
            var _loc_3:int = 1;
            while (param1.indexOf("e", _loc_3) > _loc_3)
            {
                
                _loc_4 = decodeNext(param1.substr(_loc_3));
                _loc_2.push(_loc_4.item);
                _loc_3 = _loc_3 + _loc_4.index;
            }
            return new BencoderResult(_loc_2, (_loc_3 + 1));
        }// end function

        private static function encodeDictionary(param1:Object) : String
        {
            var _loc_3:String = null;
            var _loc_2:String = "d";
            for (_loc_3 in param1)
            {
                
                _loc_2 = _loc_2 + encodeString(_loc_3);
                _loc_2 = _loc_2 + encode(param1[_loc_3]);
            }
            _loc_2 = _loc_2 + "e";
            return _loc_2;
        }// end function

        private static function decodeDictionary(param1:String) : BencoderResult
        {
            var _loc_5:BencoderResult = null;
            var _loc_6:BencoderResult = null;
            var _loc_2:* = new Object();
            var _loc_3:* = param1;
            var _loc_4:int = 1;
            while (param1.indexOf("e", _loc_4) > _loc_4)
            {
                
                _loc_5 = decodeString(param1.substr(_loc_4));
                _loc_4 = _loc_4 + _loc_5.index;
                _loc_6 = decodeNext(param1.substr(_loc_4));
                _loc_4 = _loc_4 + _loc_6.index;
                _loc_2[_loc_5.item] = _loc_6.item;
            }
            return new BencoderResult(_loc_2, (_loc_4 + 1));
        }// end function

    }
}
