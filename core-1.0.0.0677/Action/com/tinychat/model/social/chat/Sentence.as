package com.tinychat.model.social.chat
{

    public class Sentence extends Object
    {
        private var source:String;
        private var _words:Array;
        private static const wordCountPattern:RegExp = new RegExp(/[^\s]+/g);

        public function Sentence(param1:String)
        {
            this.source = param1;
            return;
        }// end function

        public function get wordCount() : uint
        {
            if (!this.words)
            {
                return 0;
            }
            return this.words.length;
        }// end function

        public function get lastWord() : String
        {
            var _loc_1:* = this.source.lastIndexOf(" ");
            if (_loc_1 == -1)
            {
                return this.source;
            }
            return this.words[(this.words.length - 1)];
        }// end function

        public function set lastWord(param1:String) : void
        {
            this.source = this.source.substring(0, this.source.lastIndexOf(this.lastWord)) + param1;
            return;
        }// end function

        public function get endsWithBlank() : Boolean
        {
            if (this.source.length > 0)
            {
            }
            return this.source.lastIndexOf(" ") == (this.source.length - 1);
        }// end function

        public function toString() : String
        {
            return this.source;
        }// end function

        private function get words() : Array
        {
            if (!this._words)
            {
                this._words = this.source.match(wordCountPattern);
            }
            return this._words;
        }// end function

    }
}
