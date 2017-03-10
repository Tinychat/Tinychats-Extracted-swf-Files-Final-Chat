package com.tinychat.ui.components.snapshot
{
    import spark.components.*;

    public class SnapshotFacebookShareScreen extends SnapshotShareScreenBase
    {
        public var updateStatusCheckbox:CheckBox;
        private var _updateStatusLabel:String;
        private var updateStatusLabelChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, urlFieldLabel:true, loadingIndicator:false, titleDisplay:false, urlField:true, updateStatusCheckbox:false, snapshot:true, statusLabel:false};

        public function SnapshotFacebookShareScreen()
        {
            return;
        }// end function

        public function get updateStatus() : Boolean
        {
            if (this.updateStatusCheckbox)
            {
            }
            return this.updateStatusCheckbox.selected;
        }// end function

        public function get promptStatus() : Boolean
        {
            return !this.updateStatusCheckbox;
        }// end function

        public function get updateStatusLabel() : String
        {
            return this._updateStatusLabel;
        }// end function

        public function set updateStatusLabel(param1:String) : void
        {
            if (this._updateStatusLabel != param1)
            {
                this._updateStatusLabel = param1;
                this.updateStatusLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.updateStatusLabelChanged)
            {
            }
            if (this.updateStatusCheckbox)
            {
                this.updateStatusCheckbox.label = this._updateStatusLabel;
                this.updateStatusLabelChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.updateStatusCheckbox)
            {
                this.updateStatusCheckbox.selected = true;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
