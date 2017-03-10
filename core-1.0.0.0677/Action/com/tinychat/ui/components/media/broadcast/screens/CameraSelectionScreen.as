package com.tinychat.ui.components.broadcast.screens
{
    import spark.components.supportClasses.*;

    public class CameraSelectionScreen extends SelectionScreenBase
    {
        public var tosInfoDisplay:TextBase;
        private var _tosInfoDisplayText:String;
        private var tosInfoDisplayTextChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, loadingIndicator:false, tosInfoDisplay:true, selector:true, titleDisplay:false, statusLabel:false, selectionInfoDisplay:true};

        public function CameraSelectionScreen()
        {
            return;
        }// end function

        public function set tosInfoDisplayText(param1:String) : void
        {
            if (this._tosInfoDisplayText != param1)
            {
                this._tosInfoDisplayText = param1;
                this.tosInfoDisplayTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.tosInfoDisplayTextChanged)
            {
            }
            if (this.tosInfoDisplay)
            {
                this.tosInfoDisplay.text = this._tosInfoDisplayText;
                this.tosInfoDisplayTextChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
