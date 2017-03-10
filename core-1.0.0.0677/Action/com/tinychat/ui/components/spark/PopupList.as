package com.tinychat.ui.components.spark
{
    import mx.events.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class PopupList extends DropDownListBase
    {
        public var headerDisplay:TextBase;
        private var _headerText:String;
        private var headerTextChanged:Boolean;
        private var _openButtonLabelText:String;
        private var openButtonLabelTextChanged:Boolean;
        private static var _skinParts:Object = {headerDisplay:false, dropDown:false, dataGroup:false, scroller:false, openButton:true, dropIndicator:false};

        public function PopupList()
        {
            requireSelection = false;
            return;
        }// end function

        public function get headerText() : String
        {
            return this._headerText;
        }// end function

        public function set headerText(param1:String) : void
        {
            if (this._headerText != param1)
            {
                this._headerText = param1;
                this.headerTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get openButtonLabelText() : String
        {
            return this._openButtonLabelText;
        }// end function

        public function set openButtonLabelText(param1:String) : void
        {
            if (this._openButtonLabelText != param1)
            {
                this._openButtonLabelText = param1;
                this.openButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.headerTextChanged)
            {
            }
            if (this.headerDisplay)
            {
                this.headerDisplay.text = this._headerText;
                this.headerTextChanged = false;
            }
            if (this.openButtonLabelTextChanged)
            {
            }
            if (openButton)
            {
                openButton.label = this._openButtonLabelText;
                this.openButtonLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.headerDisplay)
            {
            }
            if (this._headerText)
            {
                this.headerDisplay.text = this._headerText;
            }
            return;
        }// end function

        override protected function commitSelection(param1:Boolean = true) : Boolean
        {
            if (_proposedSelectedIndex != NO_SELECTION)
            {
            }
            return super.commitSelection(param1);
        }// end function

        override protected function dropDownController_closeHandler(event:DropDownEvent) : void
        {
            addEventListener(FlexEvent.UPDATE_COMPLETE, this.close_updateCompleteHandler);
            super.dropDownController_closeHandler(event);
            return;
        }// end function

        private function close_updateCompleteHandler(event:FlexEvent) : void
        {
            removeEventListener(FlexEvent.UPDATE_COMPLETE, this.close_updateCompleteHandler);
            setSelectedIndex(NO_SELECTION);
            dispatchEvent(new DropDownEvent(DropDownEvent.CLOSE));
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
