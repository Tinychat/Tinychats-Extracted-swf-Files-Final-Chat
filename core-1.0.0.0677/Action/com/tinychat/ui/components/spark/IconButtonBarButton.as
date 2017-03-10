package com.tinychat.ui.components.spark
{
    import flash.events.*;

    public class IconButtonBarButton extends IconToggleButton implements IItemRenderer
    {
        private var _label:String;
        private var _allowDeselection:Boolean = true;
        private var _showsCaret:Boolean = false;
        private var _itemIndex:int;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, iconDisplay2:false};

        public function IconButtonBarButton()
        {
            return;
        }// end function

        public function get allowDeselection() : Boolean
        {
            return this._allowDeselection;
        }// end function

        public function set allowDeselection(param1:Boolean) : void
        {
            this._allowDeselection = param1;
            return;
        }// end function

        public function get showsCaret() : Boolean
        {
            return this._showsCaret;
        }// end function

        public function set showsCaret(param1:Boolean) : void
        {
            if (this._showsCaret != param1)
            {
                this._showsCaret = param1;
                drawFocusAnyway = true;
                drawFocus(param1);
            }
            return;
        }// end function

        public function get dragging() : Boolean
        {
            return false;
        }// end function

        public function set dragging(param1:Boolean) : void
        {
            return;
        }// end function

        public function get data() : Object
        {
            return content;
        }// end function

        public function set data(param1:Object) : void
        {
            content = param1;
            dispatchEvent(new Event("dataChange"));
            return;
        }// end function

        public function get itemIndex() : int
        {
            return this._itemIndex;
        }// end function

        public function set itemIndex(param1:int) : void
        {
            this._itemIndex = param1;
            return;
        }// end function

        override public function get label() : String
        {
            return this._label;
        }// end function

        override public function set label(param1:String) : void
        {
            if (param1 != this._label)
            {
                this._label = param1;
                if (labelDisplay)
                {
                    labelDisplay.text = this._label;
                }
            }
            return;
        }// end function

        override protected function buttonReleased() : void
        {
            if (!selected)
            {
            }
            if (this.allowDeselection)
            {
                super.buttonReleased();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
