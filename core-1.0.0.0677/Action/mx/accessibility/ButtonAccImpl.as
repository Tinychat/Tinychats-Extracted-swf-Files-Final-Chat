package mx.accessibility
{
    import flash.accessibility.*;
    import flash.events.*;
    import flash.ui.*;
    import mx.controls.*;
    import mx.core.*;

    public class ButtonAccImpl extends AccImpl
    {
        static const VERSION:String = "4.6.0.23201";

        public function ButtonAccImpl(master:UIComponent)
        {
            super(master);
            role = AccConst.ROLE_SYSTEM_PUSHBUTTON;
            return;
        }// end function

        override protected function get eventsToHandle() : Array
        {
            return super.eventsToHandle.concat(["click", "labelChanged"]);
        }// end function

        override public function get_accState(childID:uint) : uint
        {
            var _loc_2:* = getState(childID);
            if (Button(master).selected)
            {
                _loc_2 = _loc_2 | AccConst.STATE_SYSTEM_PRESSED;
            }
            return _loc_2;
        }// end function

        override public function get_accDefaultAction(childID:uint) : String
        {
            return "Press";
        }// end function

        override public function accDoDefaultAction(childID:uint) : void
        {
            var _loc_2:KeyboardEvent = null;
            if (master.enabled)
            {
                _loc_2 = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
                _loc_2.keyCode = Keyboard.SPACE;
                master.dispatchEvent(_loc_2);
                _loc_2 = new KeyboardEvent(KeyboardEvent.KEY_UP);
                _loc_2.keyCode = Keyboard.SPACE;
                master.dispatchEvent(_loc_2);
            }
            return;
        }// end function

        override protected function getName(childID:uint) : String
        {
            var _loc_2:* = Button(master).label;
            if (_loc_2 != null)
            {
            }
            return _loc_2 != "" ? (_loc_2) : ("");
        }// end function

        override protected function eventHandler(event:Event) : void
        {
            $eventHandler(event);
            switch(event.type)
            {
                case "click":
                {
                    Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_STATECHANGE);
                    Accessibility.updateProperties();
                    break;
                }
                case "labelChanged":
                {
                    Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_NAMECHANGE);
                    Accessibility.updateProperties();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public static function enableAccessibility() : void
        {
            Button.createAccessibilityImplementation = createAccessibilityImplementation;
            return;
        }// end function

        static function createAccessibilityImplementation(component:UIComponent) : void
        {
            component.accessibilityImplementation = new ButtonAccImpl(component);
            return;
        }// end function

    }
}
