package mx.events
{
    import flash.events.*;

    public class ColorPickerEvent extends Event
    {
        public var color:uint;
        public var index:int;
        static const VERSION:String = "4.6.0.23201";
        public static const CHANGE:String = "change";
        public static const ENTER:String = "enter";
        public static const ITEM_ROLL_OUT:String = "itemRollOut";
        public static const ITEM_ROLL_OVER:String = "itemRollOver";

        public function ColorPickerEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, index:int = -1, color:uint = 4.29497e+009)
        {
            super(type, bubbles, cancelable);
            this.index = index;
            this.color = color;
            return;
        }// end function

        override public function clone() : Event
        {
            return new ColorPickerEvent(type, bubbles, cancelable, this.index, this.color);
        }// end function

    }
}
