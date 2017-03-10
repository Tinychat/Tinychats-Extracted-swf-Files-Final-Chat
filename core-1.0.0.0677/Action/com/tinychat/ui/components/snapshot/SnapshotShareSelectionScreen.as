package com.tinychat.ui.components.snapshot
{
    import flash.events.*;
    import org.osflash.signals.*;
    import spark.components.*;

    public class SnapshotShareSelectionScreen extends SnapshotShareScreenBase
    {
        public var facebookShare:Button;
        public var twitterShare:Button;
        private var _facebookShareClicked:Signal;
        private var _twitterShareClicked:Signal;
        private var _facebookShareButtonLabelText:String;
        private var _twitterShareButtonLabelText:String;
        private var facebookShareButtonLabelTextChanged:Boolean;
        private var twitterShareButtonLabelTextChanged:Boolean;
        private static var _skinParts:Object = {confirm:false, cancel:false, urlFieldLabel:true, twitterShare:true, loadingIndicator:false, facebookShare:true, titleDisplay:false, urlField:true, snapshot:true, statusLabel:false};

        public function SnapshotShareSelectionScreen()
        {
            this._facebookShareClicked = new Signal();
            this._twitterShareClicked = new Signal();
            return;
        }// end function

        public function get facebookShareClicked() : ISignal
        {
            return this._facebookShareClicked;
        }// end function

        public function get twitterShareClicked() : ISignal
        {
            return this._twitterShareClicked;
        }// end function

        public function get facebookShareButtonLabelText() : String
        {
            return this._facebookShareButtonLabelText;
        }// end function

        public function set facebookShareButtonLabelText(param1:String) : void
        {
            if (this._facebookShareButtonLabelText != param1)
            {
                this._facebookShareButtonLabelText = param1;
                this.facebookShareButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get twitterShareButtonLabelText() : String
        {
            return this._twitterShareButtonLabelText;
        }// end function

        public function set twitterShareButtonLabelText(param1:String) : void
        {
            if (this._twitterShareButtonLabelText != param1)
            {
                this._twitterShareButtonLabelText = param1;
                this.twitterShareButtonLabelTextChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            super.commitProperties();
            if (this.facebookShareButtonLabelTextChanged)
            {
            }
            if (this.facebookShare)
            {
                this.facebookShare.label = this._facebookShareButtonLabelText;
                this.facebookShareButtonLabelTextChanged = false;
            }
            if (this.twitterShareButtonLabelTextChanged)
            {
            }
            if (this.twitterShare)
            {
                this.twitterShare.label = this._twitterShareButtonLabelText;
                this.twitterShareButtonLabelTextChanged = false;
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.facebookShare)
            {
                this.facebookShare.addEventListener(MouseEvent.CLICK, this.facebookShareClickHandler);
            }
            else if (param2 == this.twitterShare)
            {
                this.twitterShare.addEventListener(MouseEvent.CLICK, this.twitterShareClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.facebookShare)
            {
                this.facebookShare.removeEventListener(MouseEvent.CLICK, this.facebookShareClickHandler);
            }
            else if (param2 == this.twitterShare)
            {
                this.twitterShare.removeEventListener(MouseEvent.CLICK, this.twitterShareClickHandler);
            }
            return;
        }// end function

        private function facebookShareClickHandler(event:MouseEvent) : void
        {
            this._facebookShareClicked.dispatch();
            return;
        }// end function

        private function twitterShareClickHandler(event:MouseEvent) : void
        {
            this._twitterShareClicked.dispatch();
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
