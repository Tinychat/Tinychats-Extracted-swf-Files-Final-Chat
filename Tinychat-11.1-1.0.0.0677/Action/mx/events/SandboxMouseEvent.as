package mx.events
{
    import flash.events.*;

    public class SandboxMouseEvent extends Event
    {
        public var altKey:Boolean;
        public var buttonDown:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        static const VERSION:String = "4.6.0.23201";
        public static const CLICK_SOMEWHERE:String = "clickSomewhere";
        public static const DOUBLE_CLICK_SOMEWHERE:String = "doubleClickSomewhere";
        public static const MOUSE_DOWN_SOMEWHERE:String = "mouseDownSomewhere";
        public static const MOUSE_MOVE_SOMEWHERE:String = "mouseMoveSomewhere";
        public static const MOUSE_UP_SOMEWHERE:String = "mouseUpSomewhere";
        public static const MOUSE_WHEEL_SOMEWHERE:String = "mouseWheelSomewhere";

        public function SandboxMouseEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false)
        {
            super(param1, param2, param3);
            this.ctrlKey = param4;
            this.altKey = param5;
            this.shiftKey = param6;
            this.buttonDown = param7;
            return;
        }// end function

        override public function clone() : Event
        {
            return new SandboxMouseEvent(type, bubbles, cancelable, this.ctrlKey, this.altKey, this.shiftKey, this.buttonDown);
        }// end function

        public static function marshal(event:Event) : SandboxMouseEvent
        {
            var _loc_2:* = event;
            return new SandboxMouseEvent(_loc_2.type, _loc_2.bubbles, _loc_2.cancelable, _loc_2.ctrlKey, _loc_2.altKey, _loc_2.shiftKey, _loc_2.buttonDown);
        }// end function

    }
}
