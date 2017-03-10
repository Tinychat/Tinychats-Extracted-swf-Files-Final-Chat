package org.osmf.netmocker
{

    public class EventInfo extends Object
    {
        public var code:String;
        public var level:String;
        public var position:Number;

        public function EventInfo(code:String, level:String, position:Number)
        {
            this.code = code;
            this.level = level;
            this.position = position;
            return;
        }// end function

    }
}
