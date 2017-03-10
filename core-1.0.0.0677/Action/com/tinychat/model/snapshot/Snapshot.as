package com.tinychat.model.snapshot
{
    import flash.display.*;

    public class Snapshot extends Object
    {
        private var _source:Bitmap;
        private var _imageUrl:String;
        private var _pageUrl:String;

        public function Snapshot(param1:Bitmap, param2:String)
        {
            this._source = param1;
            this._imageUrl = param2;
            this._pageUrl = param2.replace(/https:\/\/upload.tinychat.com/, "https://tinychat.com").replace(/.jpg$/, "");
            return;
        }// end function

        public function get source() : Bitmap
        {
            return this._source;
        }// end function

        public function get imageUrl() : String
        {
            return this._imageUrl;
        }// end function

        public function get pageUrl() : String
        {
            return this._pageUrl;
        }// end function

    }
}
