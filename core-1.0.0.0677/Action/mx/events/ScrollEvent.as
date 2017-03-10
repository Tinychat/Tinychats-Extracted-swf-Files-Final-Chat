package mx.events
{
    import flash.events.*;

    public class ScrollEvent extends Event
    {
        public var delta:Number;
        public var detail:String;
        public var direction:String;
        public var position:Number;
        static const VERSION:String = "4.6.0.23201";
        public static const SCROLL:String = "scroll";

        public function ScrollEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, detail:String = null, position:Number = NaN, direction:String = null, delta:Number = NaN)
        {
            super(type, bubbles, cancelable);
            this.detail = detail;
            this.position = position;
            this.direction = direction;
            this.delta = delta;
            return;
        }// end function

        override public function clone() : Event
        {
            return new ScrollEvent(type, bubbles, cancelable, this.detail, this.position, this.direction, this.delta);
        }// end function

    }
}
