package by.blooddy.crypto.serialization
{
    import flash.utils.*;

    final public class SerializationHelper extends Object
    {
        private static const _EMPTY_ARR:Array = new Array();
        private static const _HASH_CLASS:Dictionary = new Dictionary(true);
        private static const _HASH_INSTANCE:Dictionary = new Dictionary(true);

        public function SerializationHelper()
        {
            Error.throwError(ArgumentError, 2012, getQualifiedClassName(this));
            return;
        }// end function

        public static function getPropertyNames(o:Object) : Array
        {
            var arr:Array;
            var c:Object;
            var n:String;
            var list:XMLList;
            var x:XML;
            var o:* = o;
            if (typeof(o) == "object")
            {
            }
            if (!o)
            {
                Error.throwError(TypeError, 2007, "o");
            }
            var isClass:* = o is Class;
            if (isClass)
            {
                c = o as Class;
                arr = _HASH_CLASS[c];
            }
            else
            {
                c = o.constructor as Class;
                arr = _HASH_CLASS[c];
            }
            if (!arr)
            {
                arr = new Array();
                var _loc_3:int = 0;
                var _loc_4:* = describeType(o).*;
                while (_loc_4 in _loc_3)
                {
                    
                    x = _loc_4[_loc_3];
                    n = x.name();
                    if (n == "accessor")
                    {
                    }
                    if (x.@access.charAt(0) != "r")
                    {
                    }
                    if (n != "variable")
                    {
                    }
                    if (n == "constant")
                    {
                    }
                    if (x.@uri.length() <= 0)
                    {
                        list = x.metadata;
                        if (list.length() > 0)
                        {
                            var _loc_6:int = 0;
                            var _loc_7:* = list;
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
                        if (_loc_5.length() <= 0)
                        {
                            arr.push(x.@name.toString());
                        }
                    }
                }
                if (isClass)
                {
                    _HASH_CLASS[c] = arr;
                }
                else
                {
                    _HASH_INSTANCE[c] = arr;
                }
            }
            return arr.slice();
        }// end function

    }
}
