package com.tinychat.ui.components.snapshot
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.url.*;
    import spark.components.*;
    import spark.primitives.*;

    public class SnapshotShareScreenBase extends TitleWindowElementBase
    {
        public var snapshot:BitmapImage;
        public var urlFieldLabel:Label;
        public var urlField:UrlDisplay;
        private var _snapshotSource:Object;
        private var _urlFieldLabelText:String;
        private var _urlFieldText:String;
        private var _copyUrlButtonLabelText:String;
        private var _openUrlButtonLabelText:String;
        private var snapshotSourceChanged:Boolean;
        private var urlFieldLabelTextChanged:Boolean;
        private var urlFieldTextChanged:Boolean;
        private var copyUrlButtonLabelTextChanged:Boolean;
        private var openUrlButtonLabelTextChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, urlFieldLabel:true, loadingIndicator:false, titleDisplay:false, urlField:true, snapshot:true, statusLabel:false};

        public function SnapshotShareScreenBase()
        {
            return;
        }// end function

        public function set snapshotSource(param1:Object) : void
        {
            if (this._snapshotSource != param1)
            {
                this._snapshotSource = param1;
                this.snapshotSourceChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get urlFieldLabelText() : String
        {
            return this._urlFieldLabelText;
        }// end function

        public function set urlFieldLabelText(param1:String) : void
        {
            if (this._urlFieldLabelText != param1)
            {
                this._urlFieldLabelText = param1;
                this.urlFieldLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get urlFieldText() : String
        {
            return this._urlFieldText;
        }// end function

        public function set urlFieldText(param1:String) : void
        {
            if (this._urlFieldText != param1)
            {
                this._urlFieldText = param1;
                this.urlFieldTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get copyUrlButtonLabelText() : String
        {
            return this._copyUrlButtonLabelText;
        }// end function

        public function set copyUrlButtonLabelText(param1:String) : void
        {
            if (this._copyUrlButtonLabelText != param1)
            {
                this._copyUrlButtonLabelText = param1;
                this.copyUrlButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get openUrlButtonLabelText() : String
        {
            return this._openUrlButtonLabelText;
        }// end function

        public function set openUrlButtonLabelText(param1:String) : void
        {
            if (this._openUrlButtonLabelText != param1)
            {
                this._openUrlButtonLabelText = param1;
                this.openUrlButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.snapshotSourceChanged)
            {
            }
            if (this.snapshot)
            {
                this.snapshot.source = this._snapshotSource;
                this.snapshotSourceChanged = false;
            }
            if (this.urlFieldLabelTextChanged)
            {
            }
            if (this.urlFieldLabel)
            {
                this.urlFieldLabel.text = this._urlFieldLabelText;
                this.urlFieldLabelTextChanged = false;
            }
            if (this.urlFieldTextChanged)
            {
            }
            if (this.urlField)
            {
                this.urlField.url = this._urlFieldText;
                this.urlFieldTextChanged = false;
            }
            if (this.copyUrlButtonLabelTextChanged)
            {
            }
            if (this.urlField)
            {
                this.urlField.copyLabel = this._copyUrlButtonLabelText;
                this.copyUrlButtonLabelTextChanged = false;
            }
            if (this.openUrlButtonLabelTextChanged)
            {
            }
            if (this.urlField)
            {
                this.urlField.openLabel = this._openUrlButtonLabelText;
                this.openUrlButtonLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
