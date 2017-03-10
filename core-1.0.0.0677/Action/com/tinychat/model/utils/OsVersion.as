package com.tinychat.model.utils
{

    public class OsVersion extends Object
    {
        private var _name:String;
        private var _majorVersion:String;
        private var _minorVersion:String;
        public static const LINUX:String = "Linux";
        public static const MAC_OS:String = "Mac OS";
        public static const WINDOWS:String = "Windows";

        public function OsVersion(param1:String)
        {
            var _loc_2:int = 0;
            switch(param1.substr(0, 5))
            {
                case "Windo":
                {
                    this._name = WINDOWS;
                    this._majorVersion = param1.substr(8);
                    this._minorVersion = "";
                    break;
                }
                case "Mac O":
                {
                    this._name = MAC_OS;
                    _loc_2 = param1.indexOf(".");
                    this._majorVersion = param1.substring(7, _loc_2);
                    this._minorVersion = param1.substr((_loc_2 + 1), 1);
                    break;
                }
                case "Linux":
                {
                    this._name = LINUX;
                    this._majorVersion = param1.substr(6, 1);
                    this._minorVersion = "";
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

        public function get majorVersion() : String
        {
            return this._majorVersion;
        }// end function

        public function get minorVersion() : String
        {
            return this._minorVersion;
        }// end function

    }
}
