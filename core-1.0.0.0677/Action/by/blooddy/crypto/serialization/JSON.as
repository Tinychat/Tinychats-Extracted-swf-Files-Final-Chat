package by.blooddy.crypto.serialization
{
    import __AS3__.vec.*;
    import flash.errors.*;
    import flash.system.*;
    import flash.utils.*;
    import flash.xml.*;

    public class JSON extends Object
    {

        public function JSON() : void
        {
            return;
        }// end function

        public static function encode(value) : String
        {
            var _loc_2:* = XML.settings();
            XML.setSettings({ignoreComments:true, ignoreProcessingInstructions:false, ignoreWhitespace:true, prettyIndent:false, prettyPrinting:false});
            var _loc_3:* = new ByteArray();
            _loc_3.writeUTFBytes("0123456789abcdef");
            var _loc_4:* = new ByteArray();
            _loc_4.endian = Endian.LITTLE_ENDIAN;
            var cvint:* = (new Vector.<int> as Object).constructor;
            var cvuint:* = (new Vector.<uint> as Object).constructor;
            var cvdouble:* = (new Vector.<Number> as Object).constructor;
            var cvobject:* = (new Vector.<Object> as Object).constructor;
            var writeValue:Function;
            writeValue = function (hash:Dictionary, bytes1:ByteArray, tmp1:ByteArray, value1)
            {
                var _loc_7:int = 0;
                var _loc_8:int = 0;
                var _loc_9:Number = NaN;
                var _loc_10:* = null as String;
                var _loc_11:Boolean = false;
                var _loc_12:* = null as Array;
                var _loc_13:* = null;
                var _loc_14:* = null as Array;
                var _loc_15:int = 0;
                var _loc_16:* = null;
                var _loc_17:Boolean = false;
                var _loc_18:uint = 0;
                var _loc_19:uint = 0;
                var _loc_20:uint = 0;
                var _loc_21:uint = 0;
                var _loc_22:uint = 0;
                var _loc_6:* = typeof(value1);
                if (_loc_6 == "number")
                {
                    if (isFinite(value1))
                    {
                        if (value1 >= 0)
                        {
                            if (value1 <= 9)
                            {
                            }
                        }
                        if (value1 % 1 == 0)
                        {
                            bytes1.writeByte(48 + value1);
                        }
                        else
                        {
                            bytes1.writeUTFBytes(value1.toString());
                        }
                    }
                    else
                    {
                        bytes1.writeInt(1819047278);
                    }
                }
                else if (_loc_6 == "boolean")
                {
                    if (value1)
                    {
                        bytes1.writeInt(1702195828);
                    }
                    else
                    {
                        bytes1.writeInt(1936482662);
                        bytes1.writeByte(101);
                    }
                }
                else
                {
                    if (_loc_6 == "xml")
                    {
                        value1 = value1.toXMLString();
                        _loc_6 = "string";
                    }
                    else
                    {
                        if (value1)
                        {
                        }
                        if (_loc_6 == "object")
                        {
                            if (value1 is XMLDocument)
                            {
                                if (value1.childNodes.length > 0)
                                {
                                    value1 = new XML(value1).toXMLString();
                                    _loc_6 = "string";
                                }
                                else
                                {
                                    bytes1.writeShort(8738);
                                }
                            }
                            else
                            {
                                if (value1 in hash)
                                {
                                    Error.throwError(StackOverflowError, 2024);
                                }
                                hash[value1] = true;
                                _loc_7 = 0;
                                if (!(value1 is Array))
                                {
                                }
                                if (value1 is cvobject)
                                {
                                    bytes1.writeByte(91);
                                    _loc_8 = value1.length - 1;
                                    do
                                    {
                                        
                                        _loc_8--;
                                        if (_loc_8 >= 0)
                                        {
                                        }
                                    }while (value1[_loc_8] == null)
                                    _loc_8++;
                                    if (_loc_8 > 0)
                                    {
                                        this.writeValue(hash, bytes1, tmp1, value1[0]);
                                        do
                                        {
                                            
                                            bytes1.writeByte(44);
                                            this.writeValue(hash, bytes1, tmp1, value1[_loc_7]);
                                            _loc_7++;
                                        }while (_loc_7 < _loc_8)
                                    }
                                    bytes1.writeByte(93);
                                }
                                else
                                {
                                    if (!(value1 is cvint))
                                    {
                                    }
                                    if (value1 is cvuint)
                                    {
                                        bytes1.writeByte(91);
                                        _loc_8 = value1.length;
                                        if (_loc_8 > 0)
                                        {
                                            _loc_9 = value1[0];
                                            if (_loc_9 >= 0)
                                            {
                                                if (_loc_9 <= 9)
                                                {
                                                }
                                            }
                                            if (_loc_9 % 1 == 0)
                                            {
                                                bytes1.writeByte(48 + _loc_9);
                                            }
                                            else
                                            {
                                                bytes1.writeUTFBytes(_loc_9.toString());
                                            }
                                            do
                                            {
                                                
                                                bytes1.writeByte(44);
                                                _loc_9 = value1[_loc_7];
                                                if (_loc_9 >= 0)
                                                {
                                                    if (_loc_9 <= 9)
                                                    {
                                                    }
                                                }
                                                if (_loc_9 % 1 == 0)
                                                {
                                                    bytes1.writeByte(48 + _loc_9);
                                                }
                                                else
                                                {
                                                    bytes1.writeUTFBytes(_loc_9.toString());
                                                }
                                                _loc_7++;
                                            }while (_loc_7 < _loc_8)
                                        }
                                        bytes1.writeByte(93);
                                    }
                                    else if (value1 is cvdouble)
                                    {
                                        bytes1.writeByte(91);
                                        _loc_8 = value1.length - 1;
                                        do
                                        {
                                            
                                            _loc_8--;
                                            if (_loc_8 >= 0)
                                            {
                                            }
                                        }while (!isFinite(value1[_loc_8]))
                                        _loc_8++;
                                        if (_loc_8 > 0)
                                        {
                                            _loc_9 = value1[0];
                                            if (isFinite(_loc_9))
                                            {
                                                if (_loc_9 >= 0)
                                                {
                                                    if (_loc_9 <= 9)
                                                    {
                                                    }
                                                }
                                                if (_loc_9 % 1 == 0)
                                                {
                                                    bytes1.writeByte(48 + _loc_9);
                                                }
                                                else
                                                {
                                                    bytes1.writeUTFBytes(_loc_9.toString());
                                                }
                                            }
                                            else
                                            {
                                                bytes1.writeInt(1819047278);
                                            }
                                            do
                                            {
                                                
                                                bytes1.writeByte(44);
                                                _loc_9 = value1[_loc_7];
                                                if (isFinite(_loc_9))
                                                {
                                                    if (_loc_9 >= 0)
                                                    {
                                                        if (_loc_9 <= 9)
                                                        {
                                                        }
                                                    }
                                                    if (_loc_9 % 1 == 0)
                                                    {
                                                        bytes1.writeByte(48 + _loc_9);
                                                    }
                                                    else
                                                    {
                                                        bytes1.writeUTFBytes(_loc_9.toString());
                                                    }
                                                }
                                                else
                                                {
                                                    bytes1.writeInt(1819047278);
                                                }
                                                _loc_7++;
                                            }while (_loc_7 < _loc_8)
                                        }
                                        bytes1.writeByte(93);
                                    }
                                    else
                                    {
                                        bytes1.writeByte(123);
                                        _loc_11 = false;
                                        _loc_13 = null;
                                        if (value1.constructor != Object)
                                        {
                                            if (value1 is Dictionary)
                                            {
                                                _loc_15 = 0;
                                                _loc_14 = [];
                                                _loc_16 = value1;
                                                while (_loc_16 in _loc_15)
                                                {
                                                    
                                                    _loc_14.push(_loc_16[_loc_15]);
                                                }
                                                _loc_12 = _loc_14;
                                                _loc_8 = _loc_12.length;
                                                _loc_7 = 0;
                                                while (_loc_7 < _loc_8)
                                                {
                                                    
                                                    _loc_13 = typeof(_loc_12[_loc_7]);
                                                    if (_loc_13 != "string")
                                                    {
                                                    }
                                                    if (_loc_13 != "number")
                                                    {
                                                        Error.throwError(TypeError, 0);
                                                    }
                                                    _loc_7++;
                                                }
                                            }
                                            _loc_12 = SerializationHelper.getPropertyNames(value1);
                                            _loc_8 = _loc_12.length;
                                            _loc_7 = 0;
                                            while (_loc_7 < _loc_8)
                                            {
                                                
                                                _loc_10 = _loc_12[_loc_7];
                                                _loc_13 = value1[_loc_10];
                                                _loc_17 = true;
                                                ;
                                                _loc_16 = null;
                                                _loc_17 = false;
                                                if (_loc_17)
                                                {
                                                    if (_loc_11)
                                                    {
                                                        bytes1.writeByte(44);
                                                    }
                                                    else
                                                    {
                                                        _loc_11 = true;
                                                    }
                                                    if (_loc_10.length <= 0)
                                                    {
                                                        bytes1.writeShort(8738);
                                                    }
                                                    else
                                                    {
                                                        bytes1.writeByte(34);
                                                        tmp1.position = 16;
                                                        tmp1.writeUTFBytes(_loc_10);
                                                        _loc_18 = tmp1.position;
                                                        _loc_19 = 16;
                                                        _loc_20 = _loc_19;
                                                        do
                                                        {
                                                            
                                                            _loc_22 = tmp1[_loc_19];
                                                            if (_loc_22 >= 32)
                                                            {
                                                                if (_loc_22 != 34)
                                                                {
                                                                    if (_loc_22 != 47)
                                                                    {
                                                                    }
                                                                }
                                                            }
                                                            if (_loc_22 == 92)
                                                            {
                                                                _loc_21 = _loc_19 - _loc_20;
                                                                if (_loc_21 > 0)
                                                                {
                                                                    bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                                                                }
                                                                _loc_20 = _loc_19 + 1;
                                                                if (_loc_22 == 10)
                                                                {
                                                                    bytes1.writeShort(28252);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 13)
                                                                {
                                                                    bytes1.writeShort(29276);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 9)
                                                                {
                                                                    bytes1.writeShort(29788);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 34)
                                                                {
                                                                    bytes1.writeShort(8796);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 47)
                                                                {
                                                                    bytes1.writeShort(12124);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 92)
                                                                {
                                                                    bytes1.writeShort(23644);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 11)
                                                                {
                                                                    bytes1.writeShort(30300);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 8)
                                                                {
                                                                    bytes1.writeShort(25180);
                                                                    continue;
                                                                }
                                                                if (_loc_22 == 12)
                                                                {
                                                                    bytes1.writeShort(26204);
                                                                    continue;
                                                                }
                                                                bytes1.writeInt(808482140);
                                                                bytes1.writeByte(tmp1[_loc_22 >>> 4]);
                                                                bytes1.writeByte(tmp1[_loc_22 & 15]);
                                                            }
                                                        }while (++_loc_19 < _loc_18)
                                                        _loc_21 = ++_loc_19 - _loc_20;
                                                        if (_loc_21 > 0)
                                                        {
                                                            bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                                                        }
                                                        bytes1.writeByte(34);
                                                    }
                                                    bytes1.writeByte(58);
                                                    this.writeValue(hash, bytes1, tmp1, _loc_13);
                                                }
                                                _loc_7++;
                                            }
                                        }
                                        _loc_15 = 0;
                                        _loc_14 = [];
                                        _loc_16 = value1;
                                        while (_loc_16 in _loc_15)
                                        {
                                            
                                            _loc_14.push(_loc_16[_loc_15]);
                                        }
                                        _loc_12 = _loc_14;
                                        _loc_8 = _loc_12.length;
                                        _loc_7 = 0;
                                        while (_loc_7 < _loc_8)
                                        {
                                            
                                            _loc_10 = _loc_12[_loc_7];
                                            _loc_13 = value1[_loc_10];
                                            if (!(_loc_13 is Function))
                                            {
                                                if (_loc_11)
                                                {
                                                    bytes1.writeByte(44);
                                                }
                                                else
                                                {
                                                    _loc_11 = true;
                                                }
                                                if (_loc_10.length <= 0)
                                                {
                                                    bytes1.writeShort(8738);
                                                }
                                                else
                                                {
                                                    bytes1.writeByte(34);
                                                    tmp1.position = 16;
                                                    tmp1.writeUTFBytes(_loc_10);
                                                    _loc_18 = tmp1.position;
                                                    _loc_19 = 16;
                                                    _loc_20 = _loc_19;
                                                    do
                                                    {
                                                        
                                                        _loc_22 = tmp1[_loc_19];
                                                        if (_loc_22 >= 32)
                                                        {
                                                            if (_loc_22 != 34)
                                                            {
                                                                if (_loc_22 != 47)
                                                                {
                                                                }
                                                            }
                                                        }
                                                        if (_loc_22 == 92)
                                                        {
                                                            _loc_21 = _loc_19 - _loc_20;
                                                            if (_loc_21 > 0)
                                                            {
                                                                bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                                                            }
                                                            _loc_20 = _loc_19 + 1;
                                                            if (_loc_22 == 10)
                                                            {
                                                                bytes1.writeShort(28252);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 13)
                                                            {
                                                                bytes1.writeShort(29276);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 9)
                                                            {
                                                                bytes1.writeShort(29788);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 34)
                                                            {
                                                                bytes1.writeShort(8796);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 47)
                                                            {
                                                                bytes1.writeShort(12124);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 92)
                                                            {
                                                                bytes1.writeShort(23644);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 11)
                                                            {
                                                                bytes1.writeShort(30300);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 8)
                                                            {
                                                                bytes1.writeShort(25180);
                                                                continue;
                                                            }
                                                            if (_loc_22 == 12)
                                                            {
                                                                bytes1.writeShort(26204);
                                                                continue;
                                                            }
                                                            bytes1.writeInt(808482140);
                                                            bytes1.writeByte(tmp1[_loc_22 >>> 4]);
                                                            bytes1.writeByte(tmp1[_loc_22 & 15]);
                                                        }
                                                    }while (++_loc_19 < _loc_18)
                                                    _loc_21 = ++_loc_19 - _loc_20;
                                                    if (_loc_21 > 0)
                                                    {
                                                        bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                                                    }
                                                    bytes1.writeByte(34);
                                                }
                                                bytes1.writeByte(58);
                                                this.writeValue(hash, bytes1, tmp1, _loc_13);
                                            }
                                            _loc_7++;
                                        }
                                        bytes1.writeByte(125);
                                    }
                                }
                                delete hash[value1];
                            }
                        }
                    }
                    if (_loc_6 == "string")
                    {
                        if (value1.length <= 0)
                        {
                            bytes1.writeShort(8738);
                        }
                        else
                        {
                            bytes1.writeByte(34);
                            tmp1.position = 16;
                            tmp1.writeUTFBytes(value1);
                            _loc_18 = tmp1.position;
                            _loc_19 = 16;
                            _loc_20 = _loc_19;
                            do
                            {
                                
                                _loc_22 = tmp1[_loc_19];
                                if (_loc_22 >= 32)
                                {
                                    if (_loc_22 != 34)
                                    {
                                        if (_loc_22 != 47)
                                        {
                                        }
                                    }
                                }
                                if (_loc_22 == 92)
                                {
                                    _loc_21 = _loc_19 - _loc_20;
                                    if (_loc_21 > 0)
                                    {
                                        bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                                    }
                                    _loc_20 = _loc_19 + 1;
                                    if (_loc_22 == 10)
                                    {
                                        bytes1.writeShort(28252);
                                        continue;
                                    }
                                    if (_loc_22 == 13)
                                    {
                                        bytes1.writeShort(29276);
                                        continue;
                                    }
                                    if (_loc_22 == 9)
                                    {
                                        bytes1.writeShort(29788);
                                        continue;
                                    }
                                    if (_loc_22 == 34)
                                    {
                                        bytes1.writeShort(8796);
                                        continue;
                                    }
                                    if (_loc_22 == 47)
                                    {
                                        bytes1.writeShort(12124);
                                        continue;
                                    }
                                    if (_loc_22 == 92)
                                    {
                                        bytes1.writeShort(23644);
                                        continue;
                                    }
                                    if (_loc_22 == 11)
                                    {
                                        bytes1.writeShort(30300);
                                        continue;
                                    }
                                    if (_loc_22 == 8)
                                    {
                                        bytes1.writeShort(25180);
                                        continue;
                                    }
                                    if (_loc_22 == 12)
                                    {
                                        bytes1.writeShort(26204);
                                        continue;
                                    }
                                    bytes1.writeInt(808482140);
                                    bytes1.writeByte(tmp1[_loc_22 >>> 4]);
                                    bytes1.writeByte(tmp1[_loc_22 & 15]);
                                }
                            }while (++_loc_19 < _loc_18)
                            _loc_21 = ++_loc_19 - _loc_20;
                            if (_loc_21 > 0)
                            {
                                bytes1.writeBytes(tmp1, _loc_20, _loc_21);
                            }
                            bytes1.writeByte(34);
                        }
                    }
                    else if (!value1)
                    {
                        bytes1.writeInt(1819047278);
                    }
                }
                return;
            }// end function
            ;
            JSON.writeValue(new Dictionary(), _loc_4, _loc_3, value);
            XML.setSettings(_loc_2);
            var _loc_5:* = _loc_4.position;
            _loc_4.position = 0;
            return _loc_4.readUTFBytes(_loc_5);
        }// end function

        public static function decode(value:String)
        {
            var _loc_4:* = null as ByteArray;
            var _loc_5:* = null as ByteArray;
            var _loc_6:uint = 0;
            var _loc_7:uint = 0;
            var _loc_8:uint = 0;
            var _loc_9:uint = 0;
            var _loc_10:uint = 0;
            var _loc_11:uint = 0;
            var _loc_12:Boolean = false;
            var _loc_13:* = null;
            if (value == null)
            {
                Error.throwError(TypeError, 2007, "value");
            }
            var _loc_3:* = undefined;
            if (value.length > 0)
            {
                _loc_4 = ApplicationDomain.currentDomain.domainMemory;
                _loc_5 = new ByteArray();
                _loc_5.writeUTFBytes(value);
                _loc_5.writeByte(0);
                if (_loc_5.length < ApplicationDomain.MIN_DOMAIN_MEMORY_LENGTH)
                {
                    _loc_5.length = ApplicationDomain.MIN_DOMAIN_MEMORY_LENGTH;
                }
                ApplicationDomain.currentDomain.domainMemory = _loc_5;
                _loc_6 = 0;
                do
                {
                    
                    _loc_9 = _loc_6;
                    _loc_6 = _loc_6 + 1;
                    _loc_8 = _loc_9;
                    if (_loc_8 != 13)
                    {
                        if (_loc_8 != 10)
                        {
                            if (_loc_8 != 32)
                            {
                                if (_loc_8 != 9)
                                {
                                    if (_loc_8 != 11)
                                    {
                                        if (_loc_8 != 8)
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (_loc_8 != 12)
                    {
                        if (_loc_8 == 47)
                        {
                            _loc_9 = _loc_6;
                            _loc_6 = _loc_6 + 1;
                            _loc_8 = _loc_9;
                            if (_loc_8 == 47)
                            {
                                do
                                {
                                    
                                    _loc_10 = _loc_6;
                                    _loc_6 = _loc_6 + 1;
                                    _loc_9 = _loc_10;
                                    if (_loc_9 != 10)
                                    {
                                        if (_loc_9 != 13)
                                        {
                                        }
                                    }
                                }while (_loc_9 != 0)
                                _loc_6 = _loc_6 - 1;
                                continue;
                            }
                            else if (_loc_8 == 42)
                            {
                                _loc_6 = _loc_6 - 2;
                                _loc_8 = _loc_6;
                                _loc_9 = _loc_6;
                                _loc_10 = _loc_6;
                                _loc_6 = _loc_6 + 1;
                                if (_loc_10 == 47)
                                {
                                    _loc_10 = _loc_6;
                                    _loc_6 = _loc_6 + 1;
                                }
                                if (_loc_10 != 42)
                                {
                                    _loc_6 = _loc_9;
                                }
                                else
                                {
                                    do
                                    {
                                        
                                        _loc_11 = _loc_6;
                                        _loc_6 = _loc_6 + 1;
                                        _loc_10 = _loc_11;
                                        if (_loc_10 == 42)
                                        {
                                            _loc_11 = _loc_6;
                                            _loc_6 = _loc_6 + 1;
                                            if (_loc_11 == 47)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                _loc_6 = _loc_6 - 1;
                                            }
                                            continue;
                                        }
                                        if (_loc_10 == 0)
                                        {
                                            _loc_6 = _loc_9;
                                            break;
                                        }
                                    }while (true)
                                }
                                if (_loc_8 != _loc_6)
                                {
                                    continue;
                                }
                            }
                            _loc_6 = _loc_6 - 1;
                            _loc_8 = 47;
                        }
                        break;
                    }
                }while (true)
                _loc_7 = _loc_8;
                if (_loc_7 != 0)
                {
                    var position:* = (_loc_6 - 1);
                    var readValue:Function;
                    readValue = function (memory:ByteArray, _position1:uint)
            {
                var _loc_3:* = null as String;
                var _loc_7:uint = 0;
                var _loc_8:uint = 0;
                var _loc_9:uint = 0;
                var _loc_10:uint = 0;
                var _loc_11:* = null as String;
                var _loc_12:* = null as String;
                var _loc_13:uint = 0;
                var _loc_14:uint = 0;
                var _loc_15:uint = 0;
                var _loc_16:* = null as Object;
                var _loc_17:* = null as String;
                var _loc_18:* = null as Array;
                var _loc_6:* = undefined;
                do
                {
                    
                    _loc_8 = _position1;
                    _position1 = _position1 + 1;
                    _loc_7 = _loc_8;
                    if (_loc_7 != 13)
                    {
                        if (_loc_7 != 10)
                        {
                            if (_loc_7 != 32)
                            {
                                if (_loc_7 != 9)
                                {
                                    if (_loc_7 != 11)
                                    {
                                        if (_loc_7 != 8)
                                        {
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (_loc_7 != 12)
                    {
                        if (_loc_7 == 47)
                        {
                            _loc_8 = _position1;
                            _position1 = _position1 + 1;
                            _loc_7 = _loc_8;
                            if (_loc_7 == 47)
                            {
                                do
                                {
                                    
                                    _loc_9 = _position1;
                                    _position1 = _position1 + 1;
                                    _loc_8 = _loc_9;
                                    if (_loc_8 != 10)
                                    {
                                        if (_loc_8 != 13)
                                        {
                                        }
                                    }
                                }while (_loc_8 != 0)
                                _position1 = _position1 - 1;
                                continue;
                            }
                            else if (_loc_7 == 42)
                            {
                                _position1 = _position1 - 2;
                                _loc_7 = _position1;
                                _loc_8 = _position1;
                                _loc_9 = _position1;
                                _position1 = _position1 + 1;
                                if (_loc_9 == 47)
                                {
                                    _loc_9 = _position1;
                                    _position1 = _position1 + 1;
                                }
                                if (_loc_9 != 42)
                                {
                                    _position1 = _loc_8;
                                }
                                else
                                {
                                    do
                                    {
                                        
                                        _loc_10 = _position1;
                                        _position1 = _position1 + 1;
                                        _loc_9 = _loc_10;
                                        if (_loc_9 == 42)
                                        {
                                            _loc_10 = _position1;
                                            _position1 = _position1 + 1;
                                            if (_loc_10 == 47)
                                            {
                                                break;
                                            }
                                            else
                                            {
                                                _position1 = _position1 - 1;
                                            }
                                            continue;
                                        }
                                        if (_loc_9 == 0)
                                        {
                                            _position1 = _loc_8;
                                            break;
                                        }
                                    }while (true)
                                }
                                if (_loc_7 != _position1)
                                {
                                    continue;
                                }
                            }
                            _position1 = _position1 - 1;
                            _loc_7 = 47;
                        }
                        break;
                    }
                }while (true)
                var _loc_5:* = _loc_7;
                if (_loc_5 != 39)
                {
                }
                if (_loc_5 == 34)
                {
                    _position1 = _position1 - 1;
                    _loc_7 = _position1;
                    _loc_9 = _position1;
                    _position1 = _position1 + 1;
                    _loc_8 = _loc_9;
                    if (_loc_8 != 39)
                    {
                    }
                    while (_loc_10 != _loc_8)
                    {
                        if (_loc_10 == 92)
                        {
                            if (_loc_10 == 110)
                            {
                                continue;
                            }
                            if (_loc_10 == 114)
                            {
                                continue;
                            }
                            if (_loc_10 == 116)
                            {
                                continue;
                            }
                            if (_loc_10 == 118)
                            {
                                continue;
                            }
                            if (_loc_10 == 102)
                            {
                                continue;
                            }
                            if (_loc_10 == 98)
                            {
                                continue;
                            }
                            if (_loc_10 == 120)
                            {
                                while (++_loc_14 < 2)
                                {
                                    if (_loc_13 >= 48)
                                    {
                                    }
                                    if (_loc_13 > 57)
                                    {
                                        if (_loc_13 >= 97)
                                        {
                                        }
                                        if (_loc_13 > 102)
                                        {
                                            if (_loc_13 >= 65)
                                            {
                                            }
                                        }
                                    }
                                    if (_loc_13 > 70)
                                    {
                                        break;
                                    }
                                }
                                if (_loc_12 != null)
                                {
                                }
                                else
                                {
                                }
                                continue;
                            }
                            if (_loc_10 == 117)
                            {
                                while (++_loc_14 < 4)
                                {
                                    if (_loc_13 >= 48)
                                    {
                                    }
                                    if (_loc_13 > 57)
                                    {
                                        if (_loc_13 >= 97)
                                        {
                                        }
                                        if (_loc_13 > 102)
                                        {
                                            if (_loc_13 >= 65)
                                            {
                                            }
                                        }
                                    }
                                    if (_loc_13 > 70)
                                    {
                                        break;
                                    }
                                }
                                if (_loc_12 != null)
                                {
                                    continue;
                                }
                                continue;
                            }
                            if (_loc_10 >= 128)
                            {
                                if (_loc_13 >= 128)
                                {
                                    if ((_loc_13 & 248) == 240)
                                    {
                                        continue;
                                    }
                                    if ((_loc_13 & 240) == 224)
                                    {
                                        continue;
                                    }
                                    if ((_loc_13 & 224) == 192)
                                    {
                                    }
                                }
                            }
                            continue;
                        }
                        if (_loc_10 != 0)
                        {
                            if (_loc_10 != 13)
                            {
                            }
                        }
                        if (_loc_10 == 10)
                        {
                            break;
                        }
                        if (_loc_13 >= 128)
                        {
                            if ((_loc_13 & 248) == 240)
                            {
                                continue;
                            }
                            if ((_loc_13 & 240) == 224)
                            {
                                continue;
                            }
                            if ((_loc_13 & 224) == 192)
                            {
                            }
                        }
                    }
                    if (_loc_9 != (_loc_2 - 1))
                    {
                    }
                    _loc_3 = _loc_10 == _loc_8 ? (_position1 = _position1 - 1, null) : (_loc_9 = _loc_7 + 1, _loc_11 = "", // Jump to 1433, // label, if (!(_loc_10 == 92)) goto 1391, memory.position = _loc_9, _loc_11 = _loc_11 + memory.readUTFBytes((_position1 - 1) - _loc_9), _loc_13 = _position1, _position1 = _position1 + 1, _loc_10 = _loc_13, if (!(_loc_10 == 110)) goto 632, _loc_11 = _loc_11 + "\n", // Jump to 1383, if (!(_loc_10 == 114)) goto 656, _loc_11 = _loc_11 + "\r", // Jump to 1383, if (!(_loc_10 == 116)) goto 680, _loc_11 = _loc_11 + "\t", // Jump to 1383, if (!(_loc_10 == 118)) goto 704, _loc_11 = _loc_11 + "\x0b", // Jump to 1383, if (!(_loc_10 == 102)) goto 728, _loc_11 = _loc_11 + "\f", // Jump to 1383, if (!(_loc_10 == 98)) goto 752, _loc_11 = _loc_11 + "\b", // Jump to 1383, if (!(_loc_10 == 120)) goto 970, _loc_14 = 0, // Jump to 771, // label, _loc_15 = _position1, _position1 = _position1 + 1, _loc_13 = _loc_15, if (_loc_13 < 48) goto 804, if (!(_loc_13 > 57)) goto 853, if (_loc_13 < 97) goto 828, if (!(_loc_13 > 102)) goto 852, if (_loc_13 < 65) goto 851, if (!(_loc_13 > 70)) goto 861, // Jump to 874, if (++_loc_14 < 2) goto 770, _loc_12 = ++_loc_14 != 2 ? (_position1 = _position1 - (_loc_14 + 1), null) : (memory.position = _position1 - 2, memory.readUTFBytes(2)), if (_loc_12 == null) goto 955, _loc_11 = _loc_11 + String.fromCharCode(parseInt(_loc_12, 16)), // Jump to 966, _loc_11 = _loc_11 + "x", // Jump to 1383, if (!(_loc_10 == 117)) goto 1188, _loc_14 = 0, // Jump to 989, // label, _loc_15 = _position1, _position1 = _position1 + 1, _loc_13 = _loc_15, if (_loc_13 < 48) goto 1022, if (!(_loc_13 > 57)) goto 1071, if (_loc_13 < 97) goto 1046, if (!(_loc_13 > 102)) goto 1070, if (_loc_13 < 65) goto 1069, if (!(_loc_13 > 70)) goto 1079, // Jump to 1092, if (++_loc_14 < 4) goto 988, _loc_12 = ++_loc_14 != 4 ? (_position1 = _position1 - (_loc_14 + 1), null) : (memory.position = _position1 - 4, memory.readUTFBytes(4)), if (_loc_12 == null) goto 1173, _loc_11 = _loc_11 + String.fromCharCode(parseInt(_loc_12, 16)), // Jump to 1184, _loc_11 = _loc_11 + "u", // Jump to 1383, if (!(_loc_10 >= 128)) goto 1365, _position1 = _position1 - 1, _loc_13 = _position1, if (!(_loc_13 >= 128)) goto 1356, if (!((_loc_13 & 248) == 240)) goto 1275, _loc_2 = ++_position1 + 1, _loc_13 = (_loc_13 & 7) << 18 | (++_position1 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 1356, if (!((_loc_13 & 240) == 224)) goto 1324, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 1356, if (!((_loc_13 & 224) == 192)) goto 1356, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 31) << 6 | _loc_2 & 63, _loc_2 = _loc_2 + 1, _loc_10 = _loc_13, _loc_11 = _loc_11 + String.fromCharCode(_loc_10), _loc_9 = _loc_2, // Jump to 1433, if (_loc_10 == 0) goto 1421, if (_loc_10 == 13) goto 1420, if (!(_loc_10 == 10)) goto 1433, _loc_2 = _loc_7, // Jump to 1605, _loc_13 = _loc_2, if (!(_loc_13 >= 128)) goto 1589, if (!((_loc_13 & 248) == 240)) goto 1508, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 7) << 18 | (++_loc_2 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 1589, if (!((_loc_13 & 240) == 224)) goto 1557, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 1589, if (!((_loc_13 & 224) == 192)) goto 1589, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 31) << 6 | _loc_2 & 63, _loc_2 = _loc_2 + 1, _loc_10 = _loc_13, if (!(_loc_10 == _loc_8)) goto 557, _loc_2 == _loc_7 ? (null) : (if (_loc_9 == (_loc_2 - 1)) goto 1656, memory.position = _loc_9, _loc_11 = _loc_11 + memory.readUTFBytes((_loc_2 - 1) - _loc_9), _loc_11));
                    if (_loc_3 != null)
                    {
                        _loc_6 = _loc_3;
                    }
                    else
                    {
                        Error.throwError(Error, 0);
                    }
                }
                else
                {
                    if (_loc_5 >= 48)
                    {
                    }
                    if (_loc_5 > 57)
                    {
                    }
                    if (_loc_5 == 46)
                    {
                        _loc_2 = _loc_2 - 1;
                        _loc_11 = null;
                        _loc_7 = _loc_2;
                        _loc_9 = _loc_2;
                        _loc_2 = _loc_2 + 1;
                        _loc_8 = _loc_9;
                        if (_loc_8 == 48)
                        {
                            _loc_10 = _loc_2;
                            _loc_2 = _loc_2 + 1;
                            _loc_8 = _loc_10;
                            if (_loc_8 != 120)
                            {
                            }
                            if (_loc_8 == 88)
                            {
                                _loc_9 = _loc_2;
                                do
                                {
                                    
                                    _loc_10 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_10;
                                    if (_loc_8 >= 48)
                                    {
                                    }
                                    if (_loc_8 > 57)
                                    {
                                        if (_loc_8 >= 97)
                                        {
                                        }
                                        if (_loc_8 > 102)
                                        {
                                            if (_loc_8 >= 65)
                                            {
                                            }
                                        }
                                    }
                                }while (_loc_8 <= 70)
                                if (_loc_2 == (_loc_9 + 1))
                                {
                                    _loc_2 = _loc_7 + 1;
                                    _loc_8 = 48;
                                }
                                else
                                {
                                    _loc_2 = _loc_2 - 1;
                                    memory.position = _loc_9;
                                    _loc_11 = parseInt(memory.readUTFBytes(_loc_2 - _loc_9), 16);
                                }
                            }
                            else
                            {
                                _loc_2 = _loc_2 - 1;
                                _loc_8 = 48;
                            }
                        }
                        if (_loc_11 == null)
                        {
                            do
                            {
                                
                                _loc_10 = _loc_2;
                                _loc_2 = _loc_2 + 1;
                                _loc_8 = _loc_10;
                                if (_loc_8 >= 48)
                                {
                                }
                            }while (_loc_8 <= 57)
                            if (_loc_8 == 46)
                            {
                                _loc_9 = _loc_2;
                                do
                                {
                                    
                                    _loc_10 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_10;
                                    if (_loc_8 >= 48)
                                    {
                                    }
                                }while (_loc_8 <= 57)
                                if (_loc_2 == (_loc_9 + 1))
                                {
                                    _loc_2 = _loc_2 - 1;
                                    _loc_8 = 46;
                                }
                            }
                            if (_loc_8 != 101)
                            {
                            }
                            if (_loc_8 == 69)
                            {
                                _loc_10 = _loc_2;
                                _loc_13 = _loc_2;
                                _loc_2 = _loc_2 + 1;
                                _loc_8 = _loc_13;
                                if (_loc_8 != 45)
                                {
                                }
                                if (_loc_8 == 43)
                                {
                                    _loc_13 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_13;
                                }
                                _loc_9 = _loc_2;
                                do
                                {
                                    
                                    _loc_13 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_13;
                                    if (_loc_8 >= 48)
                                    {
                                    }
                                }while (_loc_8 <= 57)
                                if (_loc_2 == _loc_9)
                                {
                                    _loc_2 = _loc_10;
                                }
                            }
                            _loc_2 = _loc_2 - 1;
                            if (_loc_2 != _loc_7)
                            {
                                memory.position = _loc_7;
                                _loc_11 = memory.readUTFBytes(_loc_2 - _loc_7);
                            }
                        }
                        _loc_3 = _loc_11;
                        if (_loc_3 != null)
                        {
                            _loc_6 = parseFloat(_loc_3);
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 45)
                    {
                        do
                        {
                            
                            _loc_8 = _loc_2;
                            _loc_2 = _loc_2 + 1;
                            _loc_7 = _loc_8;
                            if (_loc_7 != 13)
                            {
                                if (_loc_7 != 10)
                                {
                                    if (_loc_7 != 32)
                                    {
                                        if (_loc_7 != 9)
                                        {
                                            if (_loc_7 != 11)
                                            {
                                                if (_loc_7 != 8)
                                                {
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (_loc_7 != 12)
                            {
                                if (_loc_7 == 47)
                                {
                                    _loc_8 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_7 = _loc_8;
                                    if (_loc_7 == 47)
                                    {
                                        do
                                        {
                                            
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_8 = _loc_9;
                                            if (_loc_8 != 10)
                                            {
                                                if (_loc_8 != 13)
                                                {
                                                }
                                            }
                                        }while (_loc_8 != 0)
                                        _loc_2 = _loc_2 - 1;
                                        continue;
                                    }
                                    else if (_loc_7 == 42)
                                    {
                                        _loc_2 = _loc_2 - 2;
                                        _loc_7 = _loc_2;
                                        _loc_8 = _loc_2;
                                        _loc_9 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        if (_loc_9 == 47)
                                        {
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                        }
                                        if (_loc_9 != 42)
                                        {
                                            _loc_2 = _loc_8;
                                        }
                                        else
                                        {
                                            do
                                            {
                                                
                                                _loc_10 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_9 = _loc_10;
                                                if (_loc_9 == 42)
                                                {
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    if (_loc_10 == 47)
                                                    {
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        _loc_2 = _loc_2 - 1;
                                                    }
                                                    continue;
                                                }
                                                if (_loc_9 == 0)
                                                {
                                                    _loc_2 = _loc_8;
                                                    break;
                                                }
                                            }while (true)
                                        }
                                        if (_loc_7 != _loc_2)
                                        {
                                            continue;
                                        }
                                    }
                                    _loc_2 = _loc_2 - 1;
                                    _loc_7 = 47;
                                }
                                break;
                            }
                        }while (true)
                        _loc_5 = _loc_7;
                        if (_loc_5 >= 48)
                        {
                        }
                        if (_loc_5 > 57)
                        {
                        }
                        if (_loc_5 == 46)
                        {
                            _loc_2 = _loc_2 - 1;
                            _loc_11 = null;
                            _loc_7 = _loc_2;
                            _loc_9 = _loc_2;
                            _loc_2 = _loc_2 + 1;
                            _loc_8 = _loc_9;
                            if (_loc_8 == 48)
                            {
                                _loc_10 = _loc_2;
                                _loc_2 = _loc_2 + 1;
                                _loc_8 = _loc_10;
                                if (_loc_8 != 120)
                                {
                                }
                                if (_loc_8 == 88)
                                {
                                    _loc_9 = _loc_2;
                                    do
                                    {
                                        
                                        _loc_10 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_8 = _loc_10;
                                        if (_loc_8 >= 48)
                                        {
                                        }
                                        if (_loc_8 > 57)
                                        {
                                            if (_loc_8 >= 97)
                                            {
                                            }
                                            if (_loc_8 > 102)
                                            {
                                                if (_loc_8 >= 65)
                                                {
                                                }
                                            }
                                        }
                                    }while (_loc_8 <= 70)
                                    if (_loc_2 == (_loc_9 + 1))
                                    {
                                        _loc_2 = _loc_7 + 1;
                                        _loc_8 = 48;
                                    }
                                    else
                                    {
                                        _loc_2 = _loc_2 - 1;
                                        memory.position = _loc_9;
                                        _loc_11 = parseInt(memory.readUTFBytes(_loc_2 - _loc_9), 16);
                                    }
                                }
                                else
                                {
                                    _loc_2 = _loc_2 - 1;
                                    _loc_8 = 48;
                                }
                            }
                            if (_loc_11 == null)
                            {
                                do
                                {
                                    
                                    _loc_10 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_10;
                                    if (_loc_8 >= 48)
                                    {
                                    }
                                }while (_loc_8 <= 57)
                                if (_loc_8 == 46)
                                {
                                    _loc_9 = _loc_2;
                                    do
                                    {
                                        
                                        _loc_10 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_8 = _loc_10;
                                        if (_loc_8 >= 48)
                                        {
                                        }
                                    }while (_loc_8 <= 57)
                                    if (_loc_2 == (_loc_9 + 1))
                                    {
                                        _loc_2 = _loc_2 - 1;
                                        _loc_8 = 46;
                                    }
                                }
                                if (_loc_8 != 101)
                                {
                                }
                                if (_loc_8 == 69)
                                {
                                    _loc_10 = _loc_2;
                                    _loc_13 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_13;
                                    if (_loc_8 != 45)
                                    {
                                    }
                                    if (_loc_8 == 43)
                                    {
                                        _loc_13 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_8 = _loc_13;
                                    }
                                    _loc_9 = _loc_2;
                                    do
                                    {
                                        
                                        _loc_13 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_8 = _loc_13;
                                        if (_loc_8 >= 48)
                                        {
                                        }
                                    }while (_loc_8 <= 57)
                                    if (_loc_2 == _loc_9)
                                    {
                                        _loc_2 = _loc_10;
                                    }
                                }
                                _loc_2 = _loc_2 - 1;
                                if (_loc_2 != _loc_7)
                                {
                                    memory.position = _loc_7;
                                    _loc_11 = memory.readUTFBytes(_loc_2 - _loc_7);
                                }
                            }
                            _loc_3 = _loc_11;
                            if (_loc_3 != null)
                            {
                                _loc_6 = -parseFloat(_loc_3);
                            }
                            else
                            {
                                Error.throwError(Error, 0);
                            }
                        }
                        else if (_loc_5 == 110)
                        {
                            if (_loc_2 == 117)
                            {
                            }
                            if ((_loc_2 + 1) == 27756)
                            {
                                _loc_2 = _loc_2 + 3;
                                _loc_6 = 0;
                            }
                            else
                            {
                                Error.throwError(Error, 0);
                            }
                        }
                        else if (_loc_5 == 117)
                        {
                            if (_loc_2 == 1717920878)
                            {
                            }
                            if (_loc_2 + 4 == 1684369001)
                            {
                                _loc_2 = _loc_2 + 8;
                                _loc_6 = Number.NaN;
                            }
                            else
                            {
                                Error.throwError(Error, 0);
                            }
                        }
                        else if (_loc_5 == 78)
                        {
                            if (_loc_2 == 20065)
                            {
                                _loc_2 = _loc_2 + 2;
                                _loc_6 = Number.NaN;
                            }
                            else
                            {
                                Error.throwError(Error, 0);
                            }
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 110)
                    {
                        if (_loc_2 == 117)
                        {
                        }
                        if ((_loc_2 + 1) == 27756)
                        {
                            _loc_2 = _loc_2 + 3;
                            _loc_6 = null;
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 116)
                    {
                        if (_loc_2 == 114)
                        {
                        }
                        if ((_loc_2 + 1) == 25973)
                        {
                            _loc_2 = _loc_2 + 3;
                            _loc_6 = true;
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 102)
                    {
                        if (_loc_2 == 1702063201)
                        {
                            _loc_2 = _loc_2 + 4;
                            _loc_6 = false;
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 117)
                    {
                        if (_loc_2 == 1717920878)
                        {
                        }
                        if (_loc_2 + 4 == 1684369001)
                        {
                            _loc_2 = _loc_2 + 8;
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 78)
                    {
                        if (_loc_2 == 20065)
                        {
                            _loc_2 = _loc_2 + 2;
                            _loc_6 = Number.NaN;
                        }
                        else
                        {
                            Error.throwError(Error, 0);
                        }
                    }
                    else if (_loc_5 == 123)
                    {
                        _loc_16 = new Object();
                        _loc_11 = null;
                        do
                        {
                            
                            _loc_8 = _loc_2;
                            _loc_2 = _loc_2 + 1;
                            _loc_7 = _loc_8;
                            if (_loc_7 != 13)
                            {
                                if (_loc_7 != 10)
                                {
                                    if (_loc_7 != 32)
                                    {
                                        if (_loc_7 != 9)
                                        {
                                            if (_loc_7 != 11)
                                            {
                                                if (_loc_7 != 8)
                                                {
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            if (_loc_7 != 12)
                            {
                                if (_loc_7 == 47)
                                {
                                    _loc_8 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_7 = _loc_8;
                                    if (_loc_7 == 47)
                                    {
                                        do
                                        {
                                            
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_8 = _loc_9;
                                            if (_loc_8 != 10)
                                            {
                                                if (_loc_8 != 13)
                                                {
                                                }
                                            }
                                        }while (_loc_8 != 0)
                                        _loc_2 = _loc_2 - 1;
                                        continue;
                                    }
                                    else if (_loc_7 == 42)
                                    {
                                        _loc_2 = _loc_2 - 2;
                                        _loc_7 = _loc_2;
                                        _loc_8 = _loc_2;
                                        _loc_9 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        if (_loc_9 == 47)
                                        {
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                        }
                                        if (_loc_9 != 42)
                                        {
                                            _loc_2 = _loc_8;
                                        }
                                        else
                                        {
                                            do
                                            {
                                                
                                                _loc_10 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_9 = _loc_10;
                                                if (_loc_9 == 42)
                                                {
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    if (_loc_10 == 47)
                                                    {
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        _loc_2 = _loc_2 - 1;
                                                    }
                                                    continue;
                                                }
                                                if (_loc_9 == 0)
                                                {
                                                    _loc_2 = _loc_8;
                                                    break;
                                                }
                                            }while (true)
                                        }
                                        if (_loc_7 != _loc_2)
                                        {
                                            continue;
                                        }
                                    }
                                    _loc_2 = _loc_2 - 1;
                                    _loc_7 = 47;
                                }
                                break;
                            }
                        }while (true)
                        _loc_5 = _loc_7;
                        if (_loc_5 != 125)
                        {
                            _loc_2 = _loc_2 - 1;
                            do
                            {
                                
                                do
                                {
                                    
                                    _loc_8 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_7 = _loc_8;
                                    if (_loc_7 != 13)
                                    {
                                        if (_loc_7 != 10)
                                        {
                                            if (_loc_7 != 32)
                                            {
                                                if (_loc_7 != 9)
                                                {
                                                    if (_loc_7 != 11)
                                                    {
                                                        if (_loc_7 != 8)
                                                        {
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (_loc_7 != 12)
                                    {
                                        if (_loc_7 == 47)
                                        {
                                            _loc_8 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_7 = _loc_8;
                                            if (_loc_7 == 47)
                                            {
                                                do
                                                {
                                                    
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_9;
                                                    if (_loc_8 != 10)
                                                    {
                                                        if (_loc_8 != 13)
                                                        {
                                                        }
                                                    }
                                                }while (_loc_8 != 0)
                                                _loc_2 = _loc_2 - 1;
                                                continue;
                                            }
                                            else if (_loc_7 == 42)
                                            {
                                                _loc_2 = _loc_2 - 2;
                                                _loc_7 = _loc_2;
                                                _loc_8 = _loc_2;
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                if (_loc_9 == 47)
                                                {
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                }
                                                if (_loc_9 != 42)
                                                {
                                                    _loc_2 = _loc_8;
                                                }
                                                else
                                                {
                                                    do
                                                    {
                                                        
                                                        _loc_10 = _loc_2;
                                                        _loc_2 = _loc_2 + 1;
                                                        _loc_9 = _loc_10;
                                                        if (_loc_9 == 42)
                                                        {
                                                            _loc_10 = _loc_2;
                                                            _loc_2 = _loc_2 + 1;
                                                            if (_loc_10 == 47)
                                                            {
                                                                break;
                                                            }
                                                            else
                                                            {
                                                                _loc_2 = _loc_2 - 1;
                                                            }
                                                            continue;
                                                        }
                                                        if (_loc_9 == 0)
                                                        {
                                                            _loc_2 = _loc_8;
                                                            break;
                                                        }
                                                    }while (true)
                                                }
                                                if (_loc_7 != _loc_2)
                                                {
                                                    continue;
                                                }
                                            }
                                            _loc_2 = _loc_2 - 1;
                                            _loc_7 = 47;
                                        }
                                        break;
                                    }
                                }while (true)
                                _loc_5 = _loc_7;
                                if (_loc_5 != 39)
                                {
                                }
                                if (_loc_5 == 34)
                                {
                                    _loc_2 = _loc_2 - 1;
                                    _loc_7 = _loc_2;
                                    _loc_9 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_8 = _loc_9;
                                    if (_loc_8 != 39)
                                    {
                                    }
                                    while (_loc_10 != _loc_8)
                                    {
                                        if (_loc_10 == 92)
                                        {
                                            if (_loc_10 == 110)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 114)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 116)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 118)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 102)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 98)
                                            {
                                                continue;
                                            }
                                            if (_loc_10 == 120)
                                            {
                                                while (++_loc_14 < 2)
                                                {
                                                    if (_loc_13 >= 48)
                                                    {
                                                    }
                                                    if (_loc_13 > 57)
                                                    {
                                                        if (_loc_13 >= 97)
                                                        {
                                                        }
                                                        if (_loc_13 > 102)
                                                        {
                                                            if (_loc_13 >= 65)
                                                            {
                                                            }
                                                        }
                                                    }
                                                    if (_loc_13 > 70)
                                                    {
                                                        break;
                                                    }
                                                }
                                                if (_loc_17 != null)
                                                {
                                                }
                                                else
                                                {
                                                }
                                                continue;
                                            }
                                            if (_loc_10 == 117)
                                            {
                                                while (++_loc_14 < 4)
                                                {
                                                    if (_loc_13 >= 48)
                                                    {
                                                    }
                                                    if (_loc_13 > 57)
                                                    {
                                                        if (_loc_13 >= 97)
                                                        {
                                                        }
                                                        if (_loc_13 > 102)
                                                        {
                                                            if (_loc_13 >= 65)
                                                            {
                                                            }
                                                        }
                                                    }
                                                    if (_loc_13 > 70)
                                                    {
                                                        break;
                                                    }
                                                }
                                                if (_loc_17 != null)
                                                {
                                                    continue;
                                                }
                                                continue;
                                            }
                                            if (_loc_10 >= 128)
                                            {
                                                if (_loc_13 >= 128)
                                                {
                                                    if ((_loc_13 & 248) == 240)
                                                    {
                                                        continue;
                                                    }
                                                    if ((_loc_13 & 240) == 224)
                                                    {
                                                        continue;
                                                    }
                                                    if ((_loc_13 & 224) == 192)
                                                    {
                                                    }
                                                }
                                            }
                                            continue;
                                        }
                                        if (_loc_10 != 0)
                                        {
                                            if (_loc_10 != 13)
                                            {
                                            }
                                        }
                                        if (_loc_10 == 10)
                                        {
                                            break;
                                        }
                                        if (_loc_13 >= 128)
                                        {
                                            if ((_loc_13 & 248) == 240)
                                            {
                                                continue;
                                            }
                                            if ((_loc_13 & 240) == 224)
                                            {
                                                continue;
                                            }
                                            if ((_loc_13 & 224) == 192)
                                            {
                                            }
                                        }
                                    }
                                    if (_loc_9 != (_loc_2 - 1))
                                    {
                                    }
                                    _loc_3 = _loc_10 == _loc_8 ? (_loc_2 = _loc_2 - 1, null) : (_loc_9 = _loc_7 + 1, _loc_12 = "", // Jump to 5541, // label, if (!(_loc_10 == 92)) goto 5499, memory.position = _loc_9, _loc_12 = _loc_12 + memory.readUTFBytes((_loc_2 - 1) - _loc_9), _loc_13 = _loc_2, _loc_2 = _loc_2 + 1, _loc_10 = _loc_13, if (!(_loc_10 == 110)) goto 4740, _loc_12 = _loc_12 + "\n", // Jump to 5491, if (!(_loc_10 == 114)) goto 4764, _loc_12 = _loc_12 + "\r", // Jump to 5491, if (!(_loc_10 == 116)) goto 4788, _loc_12 = _loc_12 + "\t", // Jump to 5491, if (!(_loc_10 == 118)) goto 4812, _loc_12 = _loc_12 + "\x0b", // Jump to 5491, if (!(_loc_10 == 102)) goto 4836, _loc_12 = _loc_12 + "\f", // Jump to 5491, if (!(_loc_10 == 98)) goto 4860, _loc_12 = _loc_12 + "\b", // Jump to 5491, if (!(_loc_10 == 120)) goto 5078, _loc_14 = 0, // Jump to 4879, // label, _loc_15 = _loc_2, _loc_2 = _loc_2 + 1, _loc_13 = _loc_15, if (_loc_13 < 48) goto 4912, if (!(_loc_13 > 57)) goto 4961, if (_loc_13 < 97) goto 4936, if (!(_loc_13 > 102)) goto 4960, if (_loc_13 < 65) goto 4959, if (!(_loc_13 > 70)) goto 4969, // Jump to 4982, if (++_loc_14 < 2) goto 4878, _loc_17 = ++_loc_14 != 2 ? (_loc_2 = _loc_2 - (_loc_14 + 1), null) : (memory.position = _loc_2 - 2, memory.readUTFBytes(2)), if (_loc_17 == null) goto 5063, _loc_12 = _loc_12 + String.fromCharCode(parseInt(_loc_17, 16)), // Jump to 5074, _loc_12 = _loc_12 + "x", // Jump to 5491, if (!(_loc_10 == 117)) goto 5296, _loc_14 = 0, // Jump to 5097, // label, _loc_15 = _loc_2, _loc_2 = _loc_2 + 1, _loc_13 = _loc_15, if (_loc_13 < 48) goto 5130, if (!(_loc_13 > 57)) goto 5179, if (_loc_13 < 97) goto 5154, if (!(_loc_13 > 102)) goto 5178, if (_loc_13 < 65) goto 5177, if (!(_loc_13 > 70)) goto 5187, // Jump to 5200, if (++_loc_14 < 4) goto 5096, _loc_17 = ++_loc_14 != 4 ? (_loc_2 = _loc_2 - (_loc_14 + 1), null) : (memory.position = _loc_2 - 4, memory.readUTFBytes(4)), if (_loc_17 == null) goto 5281, _loc_12 = _loc_12 + String.fromCharCode(parseInt(_loc_17, 16)), // Jump to 5292, _loc_12 = _loc_12 + "u", // Jump to 5491, if (!(_loc_10 >= 128)) goto 5473, _loc_2 = _loc_2 - 1, _loc_13 = _loc_2, if (!(_loc_13 >= 128)) goto 5464, if (!((_loc_13 & 248) == 240)) goto 5383, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 7) << 18 | (++_loc_2 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 5464, if (!((_loc_13 & 240) == 224)) goto 5432, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 5464, if (!((_loc_13 & 224) == 192)) goto 5464, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 31) << 6 | _loc_2 & 63, _loc_2 = _loc_2 + 1, _loc_10 = _loc_13, _loc_12 = _loc_12 + String.fromCharCode(_loc_10), _loc_9 = _loc_2, // Jump to 5541, if (_loc_10 == 0) goto 5529, if (_loc_10 == 13) goto 5528, if (!(_loc_10 == 10)) goto 5541, _loc_2 = _loc_7, // Jump to 5713, _loc_13 = _loc_2, if (!(_loc_13 >= 128)) goto 5697, if (!((_loc_13 & 248) == 240)) goto 5616, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 7) << 18 | (++_loc_2 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 5697, if (!((_loc_13 & 240) == 224)) goto 5665, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 5697, if (!((_loc_13 & 224) == 192)) goto 5697, _loc_2 = ++_loc_2 + 1, _loc_13 = (_loc_13 & 31) << 6 | _loc_2 & 63, _loc_2 = _loc_2 + 1, _loc_10 = _loc_13, if (!(_loc_10 == _loc_8)) goto 4665, _loc_2 == _loc_7 ? (null) : (if (_loc_9 == (_loc_2 - 1)) goto 5764, memory.position = _loc_9, _loc_12 = _loc_12 + memory.readUTFBytes((_loc_2 - 1) - _loc_9), _loc_12));
                                    if (_loc_3 != null)
                                    {
                                        _loc_11 = _loc_3;
                                    }
                                    else
                                    {
                                        Error.throwError(Error, 0);
                                    }
                                }
                                else
                                {
                                    if (_loc_5 >= 48)
                                    {
                                    }
                                    if (_loc_5 > 57)
                                    {
                                    }
                                    if (_loc_5 == 46)
                                    {
                                        _loc_2 = _loc_2 - 1;
                                        _loc_12 = null;
                                        _loc_7 = _loc_2;
                                        _loc_9 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_8 = _loc_9;
                                        if (_loc_8 == 48)
                                        {
                                            _loc_10 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_8 = _loc_10;
                                            if (_loc_8 != 120)
                                            {
                                            }
                                            if (_loc_8 == 88)
                                            {
                                                _loc_9 = _loc_2;
                                                do
                                                {
                                                    
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_10;
                                                    if (_loc_8 >= 48)
                                                    {
                                                    }
                                                    if (_loc_8 > 57)
                                                    {
                                                        if (_loc_8 >= 97)
                                                        {
                                                        }
                                                        if (_loc_8 > 102)
                                                        {
                                                            if (_loc_8 >= 65)
                                                            {
                                                            }
                                                        }
                                                    }
                                                }while (_loc_8 <= 70)
                                                if (_loc_2 == (_loc_9 + 1))
                                                {
                                                    _loc_2 = _loc_7 + 1;
                                                    _loc_8 = 48;
                                                }
                                                else
                                                {
                                                    _loc_2 = _loc_2 - 1;
                                                    memory.position = _loc_9;
                                                    _loc_12 = parseInt(memory.readUTFBytes(_loc_2 - _loc_9), 16);
                                                }
                                            }
                                            else
                                            {
                                                _loc_2 = _loc_2 - 1;
                                                _loc_8 = 48;
                                            }
                                        }
                                        if (_loc_12 == null)
                                        {
                                            do
                                            {
                                                
                                                _loc_10 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_8 = _loc_10;
                                                if (_loc_8 >= 48)
                                                {
                                                }
                                            }while (_loc_8 <= 57)
                                            if (_loc_8 == 46)
                                            {
                                                _loc_9 = _loc_2;
                                                do
                                                {
                                                    
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_10;
                                                    if (_loc_8 >= 48)
                                                    {
                                                    }
                                                }while (_loc_8 <= 57)
                                                if (_loc_2 == (_loc_9 + 1))
                                                {
                                                    _loc_2 = _loc_2 - 1;
                                                    _loc_8 = 46;
                                                }
                                            }
                                            if (_loc_8 != 101)
                                            {
                                            }
                                            if (_loc_8 == 69)
                                            {
                                                _loc_10 = _loc_2;
                                                _loc_13 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_8 = _loc_13;
                                                if (_loc_8 != 45)
                                                {
                                                }
                                                if (_loc_8 == 43)
                                                {
                                                    _loc_13 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_13;
                                                }
                                                _loc_9 = _loc_2;
                                                do
                                                {
                                                    
                                                    _loc_13 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_13;
                                                    if (_loc_8 >= 48)
                                                    {
                                                    }
                                                }while (_loc_8 <= 57)
                                                if (_loc_2 == _loc_9)
                                                {
                                                    _loc_2 = _loc_10;
                                                }
                                            }
                                            _loc_2 = _loc_2 - 1;
                                            if (_loc_2 != _loc_7)
                                            {
                                                memory.position = _loc_7;
                                                _loc_12 = memory.readUTFBytes(_loc_2 - _loc_7);
                                            }
                                        }
                                        _loc_3 = _loc_12;
                                        if (_loc_3 != null)
                                        {
                                            _loc_11 = parseFloat(_loc_3).toString();
                                        }
                                        else
                                        {
                                            Error.throwError(Error, 0);
                                        }
                                    }
                                    else
                                    {
                                        if (_loc_5 == 110)
                                        {
                                            if (_loc_2 == 117)
                                            {
                                            }
                                        }
                                        if ((_loc_2 + 1) != 27756)
                                        {
                                            if (_loc_5 == 116)
                                            {
                                                if (_loc_2 == 114)
                                                {
                                                }
                                            }
                                            if ((_loc_2 + 1) != 25973)
                                            {
                                                if (_loc_5 == 102)
                                                {
                                                }
                                            }
                                        }
                                        if (_loc_2 == 1702063201)
                                        {
                                            Error.throwError(Error, 0);
                                        }
                                        else
                                        {
                                            _loc_2 = _loc_2 - 1;
                                            _loc_7 = _loc_2;
                                            _loc_9 = _loc_2;
                                            if (_loc_9 >= 128)
                                            {
                                                if ((_loc_9 & 248) == 240)
                                                {
                                                    _loc_2 = ++_loc_2 + 1;
                                                    _loc_9 = (_loc_9 & 7) << 18 | (++_loc_2 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63;
                                                }
                                                else if ((_loc_9 & 240) == 224)
                                                {
                                                    _loc_2 = ++_loc_2 + 1;
                                                    _loc_9 = (_loc_9 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63;
                                                }
                                                else if ((_loc_9 & 224) == 192)
                                                {
                                                    _loc_2 = ++_loc_2 + 1;
                                                    _loc_9 = (_loc_9 & 31) << 6 | _loc_2 & 63;
                                                }
                                            }
                                            _loc_2 = _loc_2 + 1;
                                            _loc_8 = _loc_9;
                                            if (_loc_8 >= 97)
                                            {
                                            }
                                            if (_loc_8 > 122)
                                            {
                                                if (_loc_8 >= 65)
                                                {
                                                }
                                                if (_loc_8 > 90)
                                                {
                                                    if (_loc_8 != 36)
                                                    {
                                                        if (_loc_8 != 95)
                                                        {
                                                        }
                                                    }
                                                }
                                            }
                                            while (_loc_8 > 127)
                                            {
                                                if (_loc_10 >= 128)
                                                {
                                                    if ((_loc_10 & 248) == 240)
                                                    {
                                                        continue;
                                                    }
                                                    if ((_loc_10 & 240) == 224)
                                                    {
                                                        continue;
                                                    }
                                                    if ((_loc_10 & 224) == 192)
                                                    {
                                                    }
                                                }
                                                if (_loc_8 >= 97)
                                                {
                                                }
                                                if (_loc_8 > 122)
                                                {
                                                    if (_loc_8 >= 65)
                                                    {
                                                    }
                                                    if (_loc_8 > 90)
                                                    {
                                                        if (_loc_8 >= 48)
                                                        {
                                                        }
                                                        if (_loc_8 > 57)
                                                        {
                                                            if (_loc_8 != 36)
                                                            {
                                                                if (_loc_8 != 95)
                                                                {
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            _loc_3 = _loc_8 <= 127 ? (_loc_2 = _loc_7, null) : (// Jump to 6787, // label, _loc_9 = _loc_2, _loc_10 = _loc_2, if (!(_loc_10 >= 128)) goto 6947, if (!((_loc_10 & 248) == 240)) goto 6866, _loc_2 = ++_loc_2 + 1, _loc_10 = (_loc_10 & 7) << 18 | (++_loc_2 & 63) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 6947, if (!((_loc_10 & 240) == 224)) goto 6915, _loc_2 = ++_loc_2 + 1, _loc_10 = (_loc_10 & 15) << 12 | (_loc_2 & 63) << 6 | ++_loc_2 & 63, // Jump to 6947, if (!((_loc_10 & 224) == 192)) goto 6947, _loc_2 = ++_loc_2 + 1, _loc_10 = (_loc_10 & 31) << 6 | _loc_2 & 63, _loc_2 = _loc_2 + 1, _loc_8 = _loc_10, if (!(_loc_8 >= 97)) goto 6975, if (_loc_8 <= 122) goto 7060, if (!(_loc_8 >= 65)) goto 6999, if (_loc_8 <= 90) goto 7059, if (!(_loc_8 >= 48)) goto 7023, if (_loc_8 <= 57) goto 7058, if (_loc_8 == 36) goto 7057, if (_loc_8 == 95) goto 7056, if (_loc_8 > 127) goto 6786, _loc_2 = _loc_9, memory.position = _loc_7, memory.readUTFBytes(_loc_2 - _loc_7));
                                            if (_loc_3 != null)
                                            {
                                                _loc_11 = _loc_3;
                                            }
                                            else
                                            {
                                                Error.throwError(Error, 0);
                                            }
                                        }
                                    }
                                }
                                do
                                {
                                    
                                    _loc_8 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_7 = _loc_8;
                                    if (_loc_7 != 13)
                                    {
                                        if (_loc_7 != 10)
                                        {
                                            if (_loc_7 != 32)
                                            {
                                                if (_loc_7 != 9)
                                                {
                                                    if (_loc_7 != 11)
                                                    {
                                                        if (_loc_7 != 8)
                                                        {
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (_loc_7 != 12)
                                    {
                                        if (_loc_7 == 47)
                                        {
                                            _loc_8 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_7 = _loc_8;
                                            if (_loc_7 == 47)
                                            {
                                                do
                                                {
                                                    
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_9;
                                                    if (_loc_8 != 10)
                                                    {
                                                        if (_loc_8 != 13)
                                                        {
                                                        }
                                                    }
                                                }while (_loc_8 != 0)
                                                _loc_2 = _loc_2 - 1;
                                                continue;
                                            }
                                            else if (_loc_7 == 42)
                                            {
                                                _loc_2 = _loc_2 - 2;
                                                _loc_7 = _loc_2;
                                                _loc_8 = _loc_2;
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                if (_loc_9 == 47)
                                                {
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                }
                                                if (_loc_9 != 42)
                                                {
                                                    _loc_2 = _loc_8;
                                                }
                                                else
                                                {
                                                    do
                                                    {
                                                        
                                                        _loc_10 = _loc_2;
                                                        _loc_2 = _loc_2 + 1;
                                                        _loc_9 = _loc_10;
                                                        if (_loc_9 == 42)
                                                        {
                                                            _loc_10 = _loc_2;
                                                            _loc_2 = _loc_2 + 1;
                                                            if (_loc_10 == 47)
                                                            {
                                                                break;
                                                            }
                                                            else
                                                            {
                                                                _loc_2 = _loc_2 - 1;
                                                            }
                                                            continue;
                                                        }
                                                        if (_loc_9 == 0)
                                                        {
                                                            _loc_2 = _loc_8;
                                                            break;
                                                        }
                                                    }while (true)
                                                }
                                                if (_loc_7 != _loc_2)
                                                {
                                                    continue;
                                                }
                                            }
                                            _loc_2 = _loc_2 - 1;
                                            _loc_7 = 47;
                                        }
                                        break;
                                    }
                                }while (true)
                                if (_loc_7 != 58)
                                {
                                    Error.throwError(Error, 0);
                                }
                                _loc_16[_loc_11] = null.readValue(memory, _loc_2);
                                _loc_2 = position;
                                do
                                {
                                    
                                    _loc_8 = _loc_2;
                                    _loc_2 = _loc_2 + 1;
                                    _loc_7 = _loc_8;
                                    if (_loc_7 != 13)
                                    {
                                        if (_loc_7 != 10)
                                        {
                                            if (_loc_7 != 32)
                                            {
                                                if (_loc_7 != 9)
                                                {
                                                    if (_loc_7 != 11)
                                                    {
                                                        if (_loc_7 != 8)
                                                        {
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (_loc_7 != 12)
                                    {
                                        if (_loc_7 == 47)
                                        {
                                            _loc_8 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            _loc_7 = _loc_8;
                                            if (_loc_7 == 47)
                                            {
                                                do
                                                {
                                                    
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_8 = _loc_9;
                                                    if (_loc_8 != 10)
                                                    {
                                                        if (_loc_8 != 13)
                                                        {
                                                        }
                                                    }
                                                }while (_loc_8 != 0)
                                                _loc_2 = _loc_2 - 1;
                                                continue;
                                            }
                                            else if (_loc_7 == 42)
                                            {
                                                _loc_2 = _loc_2 - 2;
                                                _loc_7 = _loc_2;
                                                _loc_8 = _loc_2;
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                if (_loc_9 == 47)
                                                {
                                                    _loc_9 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                }
                                                if (_loc_9 != 42)
                                                {
                                                    _loc_2 = _loc_8;
                                                }
                                                else
                                                {
                                                    do
                                                    {
                                                        
                                                        _loc_10 = _loc_2;
                                                        _loc_2 = _loc_2 + 1;
                                                        _loc_9 = _loc_10;
                                                        if (_loc_9 == 42)
                                                        {
                                                            _loc_10 = _loc_2;
                                                            _loc_2 = _loc_2 + 1;
                                                            if (_loc_10 == 47)
                                                            {
                                                                break;
                                                            }
                                                            else
                                                            {
                                                                _loc_2 = _loc_2 - 1;
                                                            }
                                                            continue;
                                                        }
                                                        if (_loc_9 == 0)
                                                        {
                                                            _loc_2 = _loc_8;
                                                            break;
                                                        }
                                                    }while (true)
                                                }
                                                if (_loc_7 != _loc_2)
                                                {
                                                    continue;
                                                }
                                            }
                                            _loc_2 = _loc_2 - 1;
                                            _loc_7 = 47;
                                        }
                                        break;
                                    }
                                }while (true)
                                _loc_5 = _loc_7;
                                if (_loc_5 == 125)
                                {
                                    break;
                                    continue;
                                }
                                if (_loc_5 != 44)
                                {
                                    Error.throwError(Error, 0);
                                }
                            }while (true)
                        }
                        _loc_6 = _loc_16;
                    }
                    else if (_loc_5 == 91)
                    {
                        _loc_18 = [];
                        do
                        {
                            
                            do
                            {
                                
                                _loc_8 = _loc_2;
                                _loc_2 = _loc_2 + 1;
                                _loc_7 = _loc_8;
                                if (_loc_7 != 13)
                                {
                                    if (_loc_7 != 10)
                                    {
                                        if (_loc_7 != 32)
                                        {
                                            if (_loc_7 != 9)
                                            {
                                                if (_loc_7 != 11)
                                                {
                                                    if (_loc_7 != 8)
                                                    {
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (_loc_7 != 12)
                                {
                                    if (_loc_7 == 47)
                                    {
                                        _loc_8 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_7 = _loc_8;
                                        if (_loc_7 == 47)
                                        {
                                            do
                                            {
                                                
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_8 = _loc_9;
                                                if (_loc_8 != 10)
                                                {
                                                    if (_loc_8 != 13)
                                                    {
                                                    }
                                                }
                                            }while (_loc_8 != 0)
                                            _loc_2 = _loc_2 - 1;
                                            continue;
                                        }
                                        else if (_loc_7 == 42)
                                        {
                                            _loc_2 = _loc_2 - 2;
                                            _loc_7 = _loc_2;
                                            _loc_8 = _loc_2;
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            if (_loc_9 == 47)
                                            {
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                            }
                                            if (_loc_9 != 42)
                                            {
                                                _loc_2 = _loc_8;
                                            }
                                            else
                                            {
                                                do
                                                {
                                                    
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_9 = _loc_10;
                                                    if (_loc_9 == 42)
                                                    {
                                                        _loc_10 = _loc_2;
                                                        _loc_2 = _loc_2 + 1;
                                                        if (_loc_10 == 47)
                                                        {
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            _loc_2 = _loc_2 - 1;
                                                        }
                                                        continue;
                                                    }
                                                    if (_loc_9 == 0)
                                                    {
                                                        _loc_2 = _loc_8;
                                                        break;
                                                    }
                                                }while (true)
                                            }
                                            if (_loc_7 != _loc_2)
                                            {
                                                continue;
                                            }
                                        }
                                        _loc_2 = _loc_2 - 1;
                                        _loc_7 = 47;
                                    }
                                    break;
                                }
                            }while (true)
                            _loc_5 = _loc_7;
                            if (_loc_5 == 93)
                            {
                                break;
                                continue;
                            }
                            if (_loc_5 == 44)
                            {
                                _loc_18.push(undefined);
                                continue;
                            }
                            _loc_2 = _loc_2 - 1;
                            _loc_18.push(null.readValue(memory, _loc_2));
                            _loc_2 = position;
                            do
                            {
                                
                                _loc_8 = _loc_2;
                                _loc_2 = _loc_2 + 1;
                                _loc_7 = _loc_8;
                                if (_loc_7 != 13)
                                {
                                    if (_loc_7 != 10)
                                    {
                                        if (_loc_7 != 32)
                                        {
                                            if (_loc_7 != 9)
                                            {
                                                if (_loc_7 != 11)
                                                {
                                                    if (_loc_7 != 8)
                                                    {
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                if (_loc_7 != 12)
                                {
                                    if (_loc_7 == 47)
                                    {
                                        _loc_8 = _loc_2;
                                        _loc_2 = _loc_2 + 1;
                                        _loc_7 = _loc_8;
                                        if (_loc_7 == 47)
                                        {
                                            do
                                            {
                                                
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                                _loc_8 = _loc_9;
                                                if (_loc_8 != 10)
                                                {
                                                    if (_loc_8 != 13)
                                                    {
                                                    }
                                                }
                                            }while (_loc_8 != 0)
                                            _loc_2 = _loc_2 - 1;
                                            continue;
                                        }
                                        else if (_loc_7 == 42)
                                        {
                                            _loc_2 = _loc_2 - 2;
                                            _loc_7 = _loc_2;
                                            _loc_8 = _loc_2;
                                            _loc_9 = _loc_2;
                                            _loc_2 = _loc_2 + 1;
                                            if (_loc_9 == 47)
                                            {
                                                _loc_9 = _loc_2;
                                                _loc_2 = _loc_2 + 1;
                                            }
                                            if (_loc_9 != 42)
                                            {
                                                _loc_2 = _loc_8;
                                            }
                                            else
                                            {
                                                do
                                                {
                                                    
                                                    _loc_10 = _loc_2;
                                                    _loc_2 = _loc_2 + 1;
                                                    _loc_9 = _loc_10;
                                                    if (_loc_9 == 42)
                                                    {
                                                        _loc_10 = _loc_2;
                                                        _loc_2 = _loc_2 + 1;
                                                        if (_loc_10 == 47)
                                                        {
                                                            break;
                                                        }
                                                        else
                                                        {
                                                            _loc_2 = _loc_2 - 1;
                                                        }
                                                        continue;
                                                    }
                                                    if (_loc_9 == 0)
                                                    {
                                                        _loc_2 = _loc_8;
                                                        break;
                                                    }
                                                }while (true)
                                            }
                                            if (_loc_7 != _loc_2)
                                            {
                                                continue;
                                            }
                                        }
                                        _loc_2 = _loc_2 - 1;
                                        _loc_7 = 47;
                                    }
                                    break;
                                }
                            }while (true)
                            _loc_5 = _loc_7;
                            if (_loc_5 == 93)
                            {
                                break;
                                continue;
                            }
                            if (_loc_5 != 44)
                            {
                                Error.throwError(Error, 0);
                            }
                        }while (true)
                        _loc_6 = _loc_18;
                    }
                    else
                    {
                        Error.throwError(Error, 0);
                    }
                }
                position = _loc_2;
                return _loc_6;
            }// end function
            ;
                    _loc_12 = false;
                    _loc_3 = JSON.readValue(_loc_5, position);
                    _loc_6 = position;
                    do
                    {
                        
                        _loc_9 = _loc_6;
                        _loc_6 = _loc_6 + 1;
                        _loc_8 = _loc_9;
                        if (_loc_8 != 13)
                        {
                            if (_loc_8 != 10)
                            {
                                if (_loc_8 != 32)
                                {
                                    if (_loc_8 != 9)
                                    {
                                        if (_loc_8 != 11)
                                        {
                                            if (_loc_8 != 8)
                                            {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (_loc_8 != 12)
                        {
                            if (_loc_8 == 47)
                            {
                                _loc_9 = _loc_6;
                                _loc_6 = _loc_6 + 1;
                                _loc_8 = _loc_9;
                                if (_loc_8 == 47)
                                {
                                    do
                                    {
                                        
                                        _loc_10 = _loc_6;
                                        _loc_6 = _loc_6 + 1;
                                        _loc_9 = _loc_10;
                                        if (_loc_9 != 10)
                                        {
                                            if (_loc_9 != 13)
                                            {
                                            }
                                        }
                                    }while (_loc_9 != 0)
                                    _loc_6 = _loc_6 - 1;
                                    continue;
                                }
                                else if (_loc_8 == 42)
                                {
                                    _loc_6 = _loc_6 - 2;
                                    _loc_8 = _loc_6;
                                    _loc_9 = _loc_6;
                                    _loc_10 = _loc_6;
                                    _loc_6 = _loc_6 + 1;
                                    if (_loc_10 == 47)
                                    {
                                        _loc_10 = _loc_6;
                                        _loc_6 = _loc_6 + 1;
                                    }
                                    if (_loc_10 != 42)
                                    {
                                        _loc_6 = _loc_9;
                                    }
                                    else
                                    {
                                        do
                                        {
                                            
                                            _loc_11 = _loc_6;
                                            _loc_6 = _loc_6 + 1;
                                            _loc_10 = _loc_11;
                                            if (_loc_10 == 42)
                                            {
                                                _loc_11 = _loc_6;
                                                _loc_6 = _loc_6 + 1;
                                                if (_loc_11 == 47)
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    _loc_6 = _loc_6 - 1;
                                                }
                                                continue;
                                            }
                                            if (_loc_10 == 0)
                                            {
                                                _loc_6 = _loc_9;
                                                break;
                                            }
                                        }while (true)
                                    }
                                    if (_loc_8 != _loc_6)
                                    {
                                        continue;
                                    }
                                }
                                _loc_6 = _loc_6 - 1;
                                _loc_8 = 47;
                            }
                            break;
                        }
                    }while (true)
                    _loc_7 = _loc_8;
                    if (_loc_7 == 0)
                    {
                        _loc_12 = true;
                    }
                    ;
                    _loc_13 = null;
                    if (!_loc_12)
                    {
                        ApplicationDomain.currentDomain.domainMemory = _loc_4;
                        Error.throwError(SyntaxError, 1509);
                    }
                }
                ApplicationDomain.currentDomain.domainMemory = _loc_4;
            }
            return _loc_3;
        }// end function

    }
}
