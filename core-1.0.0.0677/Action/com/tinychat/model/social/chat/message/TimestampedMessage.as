package com.tinychat.model.social.chat.message
{
    import mx.formatters.*;

    public class TimestampedMessage extends ColoredMessage
    {
        private var _timestamp:Date;
        private static var timestampFormatter:DateFormatter;
        private static var classConstructed:Boolean = classConstruct();

        public function TimestampedMessage(param1:String, param2:uint)
        {
            super(param1, param2);
            this._timestamp = new Date();
            return;
        }// end function

        public function get timestamp() : Number
        {
            return this._timestamp.time;
        }// end function

        public function get timestampString() : String
        {
            return timestampFormatter.format(this._timestamp);
        }// end function

        override public function toString() : String
        {
            return "[" + this.timestampString + "] " + text;
        }// end function

        private static function classConstruct() : Boolean
        {
            timestampFormatter = new DateFormatter();
            timestampFormatter.formatString = "L:NN A";
            return true;
        }// end function

    }
}
