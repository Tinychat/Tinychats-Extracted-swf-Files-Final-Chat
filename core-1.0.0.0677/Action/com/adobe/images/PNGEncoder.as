package com.adobe.images
{
    import flash.display.*;
    import flash.utils.*;

    public class PNGEncoder extends Object
    {
        private static var crcTableComputed:Boolean = false;
        private static var crcTable:Array;

        public function PNGEncoder()
        {
            return;
        }// end function

        private static function writeChunk(png:ByteArray, type:uint, data:ByteArray) : void
        {
            var _loc_8:uint = 0;
            var _loc_9:uint = 0;
            var _loc_10:uint = 0;
            if (!crcTableComputed)
            {
                crcTableComputed = true;
                crcTable = [];
                _loc_9 = 0;
                while (_loc_9 < 256)
                {
                    
                    _loc_8 = _loc_9;
                    _loc_10 = 0;
                    while (_loc_10 < 8)
                    {
                        
                        if (_loc_8 & 1)
                        {
                            _loc_8 = uint(uint(3988292384) ^ uint(_loc_8 >>> 1));
                        }
                        else
                        {
                            _loc_8 = uint(_loc_8 >>> 1);
                        }
                        _loc_10 = _loc_10 + 1;
                    }
                    crcTable[_loc_9] = _loc_8;
                    _loc_9 = _loc_9 + 1;
                }
            }
            var _loc_4:uint = 0;
            if (data != null)
            {
                _loc_4 = data.length;
            }
            png.writeUnsignedInt(_loc_4);
            var _loc_5:* = png.position;
            png.writeUnsignedInt(type);
            if (data != null)
            {
                png.writeBytes(data);
            }
            var _loc_6:* = png.position;
            png.position = _loc_5;
            _loc_8 = 4294967295;
            var _loc_7:int = 0;
            while (_loc_7 < _loc_6 - _loc_5)
            {
                
                _loc_8 = uint(crcTable[(_loc_8 ^ png.readUnsignedByte()) & uint(255)] ^ uint(_loc_8 >>> 8));
                _loc_7 = _loc_7 + 1;
            }
            _loc_8 = uint(_loc_8 ^ uint(4294967295));
            png.position = _loc_6;
            png.writeUnsignedInt(_loc_8);
            return;
        }// end function

        public static function encode(img:BitmapData) : ByteArray
        {
            var _loc_6:uint = 0;
            var _loc_7:int = 0;
            var _loc_2:* = new ByteArray();
            _loc_2.writeUnsignedInt(2303741511);
            _loc_2.writeUnsignedInt(218765834);
            var _loc_3:* = new ByteArray();
            _loc_3.writeInt(img.width);
            _loc_3.writeInt(img.height);
            _loc_3.writeUnsignedInt(134610944);
            _loc_3.writeByte(0);
            writeChunk(_loc_2, 1229472850, _loc_3);
            var _loc_4:* = new ByteArray();
            var _loc_5:int = 0;
            while (_loc_5 < img.height)
            {
                
                _loc_4.writeByte(0);
                if (!img.transparent)
                {
                    _loc_7 = 0;
                    while (_loc_7 < img.width)
                    {
                        
                        _loc_6 = img.getPixel(_loc_7, _loc_5);
                        _loc_4.writeUnsignedInt(uint((_loc_6 & 16777215) << 8 | 255));
                        _loc_7 = _loc_7 + 1;
                    }
                }
                else
                {
                    _loc_7 = 0;
                    while (_loc_7 < img.width)
                    {
                        
                        _loc_6 = img.getPixel32(_loc_7, _loc_5);
                        _loc_4.writeUnsignedInt(uint((_loc_6 & 16777215) << 8 | _loc_6 >>> 24));
                        _loc_7 = _loc_7 + 1;
                    }
                }
                _loc_5 = _loc_5 + 1;
            }
            _loc_4.compress();
            writeChunk(_loc_2, 1229209940, _loc_4);
            writeChunk(_loc_2, 1229278788, null);
            return _loc_2;
        }// end function

    }
}
