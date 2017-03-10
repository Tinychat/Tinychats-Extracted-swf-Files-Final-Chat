package com.facebook.graph.utils
{
    import flash.utils.*;

    public class PostRequest extends Object
    {
        public var boundary:String = "-----";
        protected var postData:ByteArray;

        public function PostRequest()
        {
            this.createPostData();
            return;
        }// end function

        public function createPostData() : void
        {
            this.postData = new ByteArray();
            this.postData.endian = Endian.BIG_ENDIAN;
            return;
        }// end function

        public function writePostData(name:String, value:String) : void
        {
            var _loc_3:String = null;
            this.writeBoundary();
            this.writeLineBreak();
            _loc_3 = "Content-Disposition: form-data; name=\"" + name + "\"";
            var _loc_4:* = _loc_3.length;
            var _loc_5:Number = 0;
            while (_loc_5 < _loc_4)
            {
                
                this.postData.writeByte(_loc_3.charCodeAt(_loc_5));
                _loc_5 = _loc_5 + 1;
            }
            this.writeLineBreak();
            this.writeLineBreak();
            this.postData.writeUTFBytes(value);
            this.writeLineBreak();
            return;
        }// end function

        public function writeFileData(filename:String, fileData:ByteArray, contentType:String) : void
        {
            var _loc_4:String = null;
            var _loc_5:int = 0;
            var _loc_6:uint = 0;
            this.writeBoundary();
            this.writeLineBreak();
            _loc_4 = "Content-Disposition: form-data; name=\"" + filename + "\"; filename=\"" + filename + "\";";
            _loc_5 = _loc_4.length;
            _loc_6 = 0;
            while (_loc_6 < _loc_5)
            {
                
                this.postData.writeByte(_loc_4.charCodeAt(_loc_6));
                _loc_6 = _loc_6 + 1;
            }
            this.postData.writeUTFBytes(filename);
            this.writeQuotationMark();
            this.writeLineBreak();
            if (!contentType)
            {
            }
            _loc_4 = "application/octet-stream";
            _loc_5 = _loc_4.length;
            _loc_6 = 0;
            while (_loc_6 < _loc_5)
            {
                
                this.postData.writeByte(_loc_4.charCodeAt(_loc_6));
                _loc_6 = _loc_6 + 1;
            }
            this.writeLineBreak();
            this.writeLineBreak();
            fileData.position = 0;
            this.postData.writeBytes(fileData, 0, fileData.length);
            this.writeLineBreak();
            return;
        }// end function

        public function getPostData() : ByteArray
        {
            this.postData.position = 0;
            return this.postData;
        }// end function

        public function close() : void
        {
            this.writeBoundary();
            this.writeDoubleDash();
            return;
        }// end function

        protected function writeLineBreak() : void
        {
            this.postData.writeShort(3338);
            return;
        }// end function

        protected function writeQuotationMark() : void
        {
            this.postData.writeByte(34);
            return;
        }// end function

        protected function writeDoubleDash() : void
        {
            this.postData.writeShort(11565);
            return;
        }// end function

        protected function writeBoundary() : void
        {
            this.writeDoubleDash();
            var _loc_1:* = this.boundary.length;
            var _loc_2:uint = 0;
            while (_loc_2 < _loc_1)
            {
                
                this.postData.writeByte(this.boundary.charCodeAt(_loc_2));
                _loc_2 = _loc_2 + 1;
            }
            return;
        }// end function

    }
}
