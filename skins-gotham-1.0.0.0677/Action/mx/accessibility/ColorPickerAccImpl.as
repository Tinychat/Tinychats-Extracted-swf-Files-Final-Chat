package mx.accessibility
{
    import flash.accessibility.*;
    import flash.events.*;
    import mx.collections.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;

    public class ColorPickerAccImpl extends ComboBaseAccImpl
    {
        static const VERSION:String = "4.6.0.23201";

        public function ColorPickerAccImpl(master:UIComponent)
        {
            super(master);
            master.accessibilityProperties.description = "Color Picker";
            Accessibility.updateProperties();
            ColorPicker(master).addEventListener(DropdownEvent.OPEN, this.openHandler);
            ColorPicker(master).addEventListener(DropdownEvent.CLOSE, this.closeHandler);
            return;
        }// end function

        private function openHandler(event:Event) : void
        {
            ColorPicker(master).dropdown.addEventListener("change", this.dropdown_changeHandler);
            return;
        }// end function

        private function closeHandler(event:Event) : void
        {
            ColorPicker(master).dropdown.removeEventListener("change", this.dropdown_changeHandler);
            return;
        }// end function

        private function dropdown_changeHandler(event:Event) : void
        {
            master.dispatchEvent(new Event("childChange"));
            return;
        }// end function

        override protected function getName(childID:uint) : String
        {
            var _loc_5:String = null;
            var _loc_6:String = null;
            if (childID == 0)
            {
                return "";
            }
            var _loc_2:* = ColorPicker(master);
            var _loc_3:* = _loc_2.collectionIterator;
            _loc_3.seek(CursorBookmark.FIRST, (childID - 1));
            var _loc_4:* = _loc_3.current;
            if (typeof(_loc_4) != "object")
            {
                _loc_5 = _loc_4.toString(16);
                _loc_6 = this.formatColorString(_loc_5);
                return _loc_6;
            }
            return !_loc_4.label ? (_loc_4.data) : (_loc_4.label);
        }// end function

        override public function get_accState(childID:uint) : uint
        {
            var _loc_2:* = getState(childID);
            if (childID > 0)
            {
                _loc_2 = _loc_2 | AccConst.STATE_SYSTEM_SELECTABLE;
                _loc_2 = _loc_2 | (AccConst.STATE_SYSTEM_SELECTED | AccConst.STATE_SYSTEM_FOCUSED);
            }
            return _loc_2;
        }// end function

        override public function get_accValue(childID:uint) : String
        {
            if (ColorPicker(master).showingDropdown)
            {
                return ColorPicker(master).dropdown ? (ColorPicker(master).dropdown.textInput.text) : (null);
            }
            else
            {
                return ColorPicker(master).selectedColor.toString(16);
            }
        }// end function

        override public function getChildIDArray() : Array
        {
            var _loc_1:* = ColorPicker(master).dropdown ? (ColorPicker(master).dropdown.length) : (0);
            return createChildIDArray(_loc_1);
        }// end function

        override protected function get eventsToHandle() : Array
        {
            return super.eventsToHandle.concat(["childChange"]);
        }// end function

        override protected function eventHandler(event:Event) : void
        {
            var _loc_2:int = 0;
            $eventHandler(event);
            switch(event.type)
            {
                case "childChange":
                {
                    _loc_2 = ComboBase(master).selectedIndex;
                    Accessibility.sendEvent(master, (ColorPicker(master).dropdown.focusedIndex + 1), AccConst.EVENT_OBJECT_SELECTION);
                    Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_VALUECHANGE, true);
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

        private function formatColorString(color:String) : String
        {
            var _loc_2:String = "";
            var _loc_3:* = color.length;
            var _loc_4:uint = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_2 = _loc_2 + (color.charAt(_loc_4) + " ");
                _loc_4 = _loc_4 + 1;
            }
            return _loc_2;
        }// end function

        public static function enableAccessibility() : void
        {
            ColorPicker.createAccessibilityImplementation = createAccessibilityImplementation;
            return;
        }// end function

        static function createAccessibilityImplementation(component:UIComponent) : void
        {
            component.accessibilityImplementation = new ColorPickerAccImpl(component);
            return;
        }// end function

    }
}
