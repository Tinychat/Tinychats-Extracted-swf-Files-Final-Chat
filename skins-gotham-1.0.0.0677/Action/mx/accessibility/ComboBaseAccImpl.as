package mx.accessibility
{
    import flash.accessibility.*;
    import flash.events.*;
    import mx.controls.*;
    import mx.core.*;

    public class ComboBaseAccImpl extends AccImpl
    {
        static const VERSION:String = "4.6.0.23201";

        public function ComboBaseAccImpl(master:UIComponent)
        {
            super(master);
            role = AccConst.ROLE_SYSTEM_COMBOBOX;
            return;
        }// end function

        override protected function get eventsToHandle() : Array
        {
            return super.eventsToHandle.concat(["change", "valueCommit"]);
        }// end function

        override public function get_accRole(childID:uint) : uint
        {
            return childID == 0 ? (role) : (AccConst.ROLE_SYSTEM_LISTITEM);
        }// end function

        override public function get_accValue(childID:uint) : String
        {
            if (childID == 0)
            {
                return ComboBase(master).text;
            }
            return null;
        }// end function

        override public function get_accState(childID:uint) : uint
        {
            var _loc_2:* = getState(childID);
            if (childID > 0)
            {
                _loc_2 = _loc_2 | AccConst.STATE_SYSTEM_SELECTABLE;
                if (ComboBase(master).selectedIndex == (childID - 1))
                {
                    _loc_2 = _loc_2 | (AccConst.STATE_SYSTEM_SELECTED | AccConst.STATE_SYSTEM_FOCUSED);
                }
            }
            return _loc_2;
        }// end function

        override public function getChildIDArray() : Array
        {
            var _loc_1:* = ComboBase(master).dataProvider ? (ComboBase(master).dataProvider.length) : (0);
            return createChildIDArray(_loc_1);
        }// end function

        override protected function eventHandler(event:Event) : void
        {
            var _loc_2:int = 0;
            var _loc_3:uint = 0;
            $eventHandler(event);
            switch(event.type)
            {
                case "change":
                {
                    _loc_2 = ComboBase(master).selectedIndex;
                    if (_loc_2 >= 0)
                    {
                        _loc_3 = _loc_2 + 1;
                        Accessibility.sendEvent(master, _loc_3, AccConst.EVENT_OBJECT_SELECTION);
                        Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_VALUECHANGE);
                    }
                    break;
                }
                case "valueCommit":
                {
                    Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_VALUECHANGE);
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
            ComboBase.createAccessibilityImplementation = createAccessibilityImplementation;
            return;
        }// end function

        static function createAccessibilityImplementation(component:UIComponent) : void
        {
            component.accessibilityImplementation = new ComboBaseAccImpl(component);
            return;
        }// end function

    }
}
