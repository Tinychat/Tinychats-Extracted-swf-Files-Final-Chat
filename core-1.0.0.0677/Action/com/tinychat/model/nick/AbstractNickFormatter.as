package com.tinychat.model.nick
{
    import flash.errors.*;

    public class AbstractNickFormatter extends Object implements NickFormatter
    {
        private var _asciiPattern:RegExp;
        private static const unicodePattern:RegExp = /[à-ÿ]/gi;
        private static var unicodeToAsciiTable:Object;
        private static var _initializeUnicodeToAsciiTable:Boolean = initializeUnicodeToAsciiTable();

        public function AbstractNickFormatter()
        {
            return;
        }// end function

        public function get allowedCharacters() : String
        {
            throw new IllegalOperationError("Must be overriden in subclass.");
        }// end function

        public function get typographicCase() : String
        {
            throw new IllegalOperationError("Must be overriden in subclass.");
        }// end function

        public function format(param1:String) : String
        {
            return param1.replace(" ", "_").replace(unicodePattern, unicodeNormalization).match(this.asciiPattern).join("");
        }// end function

        private function get asciiPattern() : RegExp
        {
            if (!this._asciiPattern)
            {
                this._asciiPattern = new RegExp("[" + this.allowedCharacters.replace(/[\[\]]/g, "\\$&") + "]", "g");
            }
            return this._asciiPattern;
        }// end function

        private static function unicodeNormalization(param1:String, param2:uint, param3:String) : String
        {
            if (unicodeToAsciiTable.hasOwnProperty(param1))
            {
                return unicodeToAsciiTable[param1];
            }
            return "";
        }// end function

        private static function initializeUnicodeToAsciiTable() : Boolean
        {
            unicodeToAsciiTable = {};
            unicodeToAsciiTable["à "] = "a";
            unicodeToAsciiTable["á "] = "a";
            unicodeToAsciiTable["â "] = "a";
            unicodeToAsciiTable["ã "] = "a";
            unicodeToAsciiTable["ä "] = "a";
            unicodeToAsciiTable["å "] = "a";
            unicodeToAsciiTable["æ "] = "a";
            unicodeToAsciiTable["ç "] = "c";
            unicodeToAsciiTable["è "] = "e";
            unicodeToAsciiTable["é "] = "e";
            unicodeToAsciiTable["ê "] = "e";
            unicodeToAsciiTable["ë "] = "e";
            unicodeToAsciiTable["ì "] = "i";
            unicodeToAsciiTable["í "] = "i";
            unicodeToAsciiTable["î "] = "i";
            unicodeToAsciiTable["ï "] = "i";
            unicodeToAsciiTable["ñ "] = "n";
            unicodeToAsciiTable["ò "] = "o";
            unicodeToAsciiTable["ó "] = "o";
            unicodeToAsciiTable["ô "] = "o";
            unicodeToAsciiTable["õ "] = "o";
            unicodeToAsciiTable["ö "] = "o";
            unicodeToAsciiTable["ø "] = "o";
            unicodeToAsciiTable["ù "] = "u";
            unicodeToAsciiTable["ú "] = "u";
            unicodeToAsciiTable["û "] = "u";
            unicodeToAsciiTable["ü "] = "u";
            unicodeToAsciiTable["ý "] = "y";
            unicodeToAsciiTable["ÿ "] = "y";
            return true;
        }// end function

    }
}
