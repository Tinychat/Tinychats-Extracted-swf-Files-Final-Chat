package com.tinychat.model.soundcloud
{

    public class SoundCloudTrack extends Object implements Media
    {
        private var _title:String;
        private var _id:String;
        private var _thumbnailUrl:String;
        private var _description:String;

        public function SoundCloudTrack(param1:String, param2:String, param3:String, param4:String)
        {
            this._id = param1;
            this._title = param2;
            this._thumbnailUrl = param3 !== null ? (param3.replace(/^https:\/\//i, "http://")) : ("");
            this._description = param4;
            return;
        }// end function

        public function get id() : String
        {
            return this._id;
        }// end function

        public function get title() : String
        {
            return this._title;
        }// end function

        public function get streamUrl() : String
        {
            return "https://api.soundcloud.com/tracks/" + this.id + "/stream?client_id=" + SoundCloudConstants.CLIENT_ID;
        }// end function

        public function get thumbnailUrl() : String
        {
            return this._thumbnailUrl;
        }// end function

        public function get description() : String
        {
            return this._description;
        }// end function

        public function toString() : String
        {
            return [this._title, this._id, this._thumbnailUrl, this._description].toString();
        }// end function

    }
}
