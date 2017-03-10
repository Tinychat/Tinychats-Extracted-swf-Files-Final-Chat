package com.tinychat.ui.components.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.events.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class SelectionScreenBase extends TitleWindowElementBase
    {
        public var selector:ItemSelectorBase;
        public var selectionInfoDisplay:TextBase;
        private var _selectionMade:Signal;
        private var _selectionChanged:Signal;
        private var _selectionInfoDisplayText:String;
        private var selectionInfoDisplayTextChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, loadingIndicator:false, selector:true, titleDisplay:false, statusLabel:false, selectionInfoDisplay:true};

        public function SelectionScreenBase()
        {
            this._selectionMade = new Signal(Object);
            this._selectionChanged = new Signal(Object);
            return;
        }// end function

        public function get selectionChanged() : ISignal
        {
            return this._selectionChanged;
        }// end function

        public function get selectionMade() : ISignal
        {
            return this._selectionMade;
        }// end function

        public function get selectedItem()
        {
            if (this.selector)
            {
                return this.selector.selectedItem;
            }
            return null;
        }// end function

        public function set selectionInfoDisplayText(param1:String) : void
        {
            if (this._selectionInfoDisplayText != param1)
            {
                this._selectionInfoDisplayText = param1;
                this.selectionInfoDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.selectionInfoDisplayTextChanged)
            {
            }
            if (this.selectionInfoDisplay)
            {
                this.selectionInfoDisplay.text = this._selectionInfoDisplayText;
                this.selectionInfoDisplayTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == confirm)
            {
                if (this.selector)
                {
                }
                confirm.enabled = this.selector.hasSelectedItem;
            }
            else if (param2 == this.selector)
            {
                this.selector.addEventListener(FlexEvent.VALUE_COMMIT, this.selectorChangeHandler);
                this.selector.addEventListener(Event.CHANGE, this.selectorChangeHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.selector)
            {
                this.selector.removeEventListener(FlexEvent.VALUE_COMMIT, this.selectorChangeHandler);
                this.selector.removeEventListener(Event.CHANGE, this.selectorChangeHandler);
            }
            return;
        }// end function

        override protected function confirmClickHandler(event:MouseEvent) : void
        {
            this._selectionMade.dispatch(this.selector.selectedItem);
            return;
        }// end function

        private function selectorChangeHandler(event:Event) : void
        {
            if (confirm)
            {
                confirm.enabled = this.selector.hasSelectedItem;
            }
            if (this.selector.selectedItem)
            {
                this._selectionChanged.dispatch(this.selector.selectedItem);
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
