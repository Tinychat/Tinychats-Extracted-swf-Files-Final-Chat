package com.tinychat.ui.components.url
{
    import flash.desktop.*;
    import flash.events.*;
    import flash.net.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class UrlDisplay extends SkinnableComponent
    {
        public var textDisplay:SkinnableTextBase;
        public var copy:Button;
        public var open:Button;
        private var _url:String;
        private var _copyLabel:String;
        private var _openLabel:String;
        private var urlChanged:Boolean;
        private var copyLabelChanged:Boolean;
        private var openLabelChanged:Boolean;
        private static var _skinParts:Object = {textDisplay:true, copy:false, open:false};

        public function UrlDisplay()
        {
            return;
        }// end function

        public function get url() : String
        {
            return this._url;
        }// end function

        public function set url(param1:String) : void
        {
            if (this._url != param1)
            {
                this._url = param1;
                this.urlChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get copyLabel() : String
        {
            return this._copyLabel;
        }// end function

        public function set copyLabel(param1:String) : void
        {
            if (this._copyLabel != param1)
            {
                this._copyLabel = param1;
                this.copyLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function get openLabel() : String
        {
            return this._openLabel;
        }// end function

        public function set openLabel(param1:String) : void
        {
            if (this._openLabel != param1)
            {
                this._openLabel = param1;
                this.openLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            if (this.urlChanged)
            {
            }
            if (this.textDisplay)
            {
                this.textDisplay.text = this._url;
                this.urlChanged = false;
            }
            if (this.copyLabelChanged)
            {
            }
            if (this.copy)
            {
                this.copy.label = this.copyLabel;
                this.copyLabelChanged = false;
            }
            if (this.openLabelChanged)
            {
            }
            if (this.open)
            {
                this.open.label = this.openLabel;
                this.openLabelChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.textDisplay)
            {
                this.textDisplay.mouseEnabled = false;
                this.textDisplay.mouseChildren = false;
            }
            else if (param2 == this.copy)
            {
                this.copy.addEventListener(MouseEvent.CLICK, this.copyClickHandler);
            }
            else if (param2 == this.open)
            {
                this.open.addEventListener(MouseEvent.CLICK, this.openClickHandler);
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.copy)
            {
                this.copy.removeEventListener(MouseEvent.CLICK, this.copyClickHandler);
            }
            else if (param2 == this.open)
            {
                this.open.removeEventListener(MouseEvent.CLICK, this.openClickHandler);
            }
            return;
        }// end function

        private function copyClickHandler(event:MouseEvent) : void
        {
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, this.url);
            return;
        }// end function

        private function openClickHandler(event:MouseEvent) : void
        {
            navigateToURL(new URLRequest(this.url), "_blank");
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
