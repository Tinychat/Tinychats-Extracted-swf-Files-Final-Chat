package com.tinychat.ui.components.spark
{
    import flash.display.*;
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.supportClasses.*;

    public class TitleWindowElementBase extends SkinnableComponent
    {
        public var titleDisplay:TitleDisplay;
        public var loadingIndicator:DisplayObject;
        public var statusLabel:TextBase;
        public var confirm:ButtonBase;
        public var cancel:ButtonBase;
        private var _title:String;
        private var _statusLabelText:String;
        private var _confirmLabel:String;
        private var _cancelLabel:String;
        private var _confirmed:Signal;
        private var _canceled:Signal;
        private var titleChanged:Boolean;
        private var statusLabelTextChanged:Boolean;
        private var confirmLabelChanged:Boolean;
        private var cancelLabelChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, titleDisplay:false, statusLabel:false, loadingIndicator:false};

        public function TitleWindowElementBase()
        {
            this._confirmed = new Signal();
            this._canceled = new Signal();
            return;
        }// end function

        public function get confirmed() : ISignal
        {
            return this._confirmed;
        }// end function

        public function get canceled() : ISignal
        {
            return this._canceled;
        }// end function

        public function get title() : String
        {
            return this._title;
        }// end function

        public function set title(param1:String) : void
        {
            if (this._title != param1)
            {
                this._title = param1;
                this.titleChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get statusLabelText() : String
        {
            return this._statusLabelText;
        }// end function

        public function set statusLabelText(param1:String) : void
        {
            if (this._statusLabelText != param1)
            {
                this._statusLabelText = param1;
                this.statusLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set confirmLabel(param1:String) : void
        {
            if (this._confirmLabel != param1)
            {
                this._confirmLabel = param1;
                this.confirmLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set cancelLabel(param1:String) : void
        {
            if (this._cancelLabel != param1)
            {
                this._cancelLabel = param1;
                this.cancelLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:Boolean = false;
            super.commitProperties();
            if (this.titleChanged)
            {
            }
            if (this.titleDisplay)
            {
                this.titleDisplay.textDisplay.text = this._title;
                this.titleChanged = false;
            }
            if (this.statusLabelTextChanged)
            {
            }
            if (this.statusLabel)
            {
                _loc_1 = this._statusLabelText != "";
                this.statusLabel.visible = _loc_1;
                this.statusLabel.includeInLayout = _loc_1;
                this.statusLabel.text = this._statusLabelText;
                this.statusLabelTextChanged = false;
            }
            if (this.confirmLabelChanged)
            {
            }
            if (this.confirm)
            {
                this.confirm.label = this._confirmLabel;
                this.confirmLabelChanged = false;
            }
            if (this.cancelLabelChanged)
            {
            }
            if (this.cancel)
            {
                this.cancel.label = this._cancelLabel;
                this.cancelLabelChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.confirm)
            {
                this.confirm.addEventListener(MouseEvent.CLICK, this.confirmClickHandler);
                this.confirmLabelChanged = true;
            }
            else if (param2 == this.cancel)
            {
                this.cancel.addEventListener(MouseEvent.CLICK, this.cancelClickHandler);
            }
            else if (param2 == this.statusLabel)
            {
                this.statusLabel.includeInLayout = false;
                this.statusLabel.visible = false;
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.confirm)
            {
                this.confirm.removeEventListener(MouseEvent.CLICK, this.confirmClickHandler);
            }
            else if (param2 == this.cancel)
            {
                this.cancel.removeEventListener(MouseEvent.CLICK, this.cancelClickHandler);
            }
            return;
        }// end function

        protected function confirmClickHandler(event:MouseEvent) : void
        {
            this.dispatchConfirmed();
            return;
        }// end function

        protected function cancelClickHandler(event:MouseEvent) : void
        {
            this.dispatchCanceled();
            return;
        }// end function

        protected function dispatchConfirmed() : void
        {
            this._confirmed.dispatch();
            return;
        }// end function

        protected function dispatchCanceled() : void
        {
            this._canceled.dispatch();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
