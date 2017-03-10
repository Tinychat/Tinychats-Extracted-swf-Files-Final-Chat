package com.tinychat.ui.components.spark
{
    import spark.components.*;

    public class IconButton extends Button
    {
        public var iconDisplay2:ImageSourceDisplay;
        public var labelDisplay2:Label;
        private var _showLabel:Boolean;
        private var _sizeInclude:Boolean;
        private var showLabelChanged:Boolean;
        private var labelChanged:Boolean;
        private var paddingChanged:Boolean;
        private static var _skinParts:Object = {labelDisplay:false, iconDisplay:false, labelDisplay2:false, iconDisplay2:false};

        public function IconButton()
        {
            this._showLabel = true;
            this._sizeInclude = true;
            return;
        }// end function

        public function get showLabel() : Boolean
        {
            return this._showLabel;
        }// end function

        public function set showLabel(param1:Boolean) : void
        {
            if (this._showLabel != param1)
            {
                this._showLabel = param1;
                this.showLabelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override public function set label(param1:String) : void
        {
            if (label != param1)
            {
                super.label = param1;
                this.labelChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.iconDisplay2)
            {
                this.updatePadding();
            }
            return;
        }// end function

        public function set sizeInclude(param1:Boolean) : void
        {
            if (this._sizeInclude != param1)
            {
                this._sizeInclude = param1;
                invalidateProperties();
            }
            return;
        }// end function

        private function updatePadding() : void
        {
            if (!this.iconDisplay2)
            {
                return;
            }
            if (getStyle("icon") != undefined)
            {
                this.iconDisplay2.source = getStyle("icon");
            }
            if (this._sizeInclude)
            {
                if (getStyle("iconWidth") != undefined)
                {
                    this.iconDisplay2.width = getStyle("iconWidth");
                }
                if (getStyle("iconHeight") != undefined)
                {
                    this.iconDisplay2.height = getStyle("iconHeight");
                }
            }
            if (getStyle("iconHorizontalCenter") != undefined)
            {
                this.iconDisplay2.horizontalCenter = getStyle("iconHorizontalCenter");
            }
            if (getStyle("iconVerticalCenter") != undefined)
            {
                this.iconDisplay2.verticalCenter = getStyle("iconVerticalCenter");
            }
            return;
        }// end function

        override public function styleChanged(param1:String) : void
        {
            if (param1)
            {
            }
            var _loc_2:* = param1 == "styleName";
            super.styleChanged(param1);
            if (!_loc_2)
            {
            }
            if (param1.indexOf("icon") == 0)
            {
                this.paddingChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:Boolean = false;
            super.commitProperties();
            if (this.paddingChanged)
            {
                this.updatePadding();
                this.paddingChanged = false;
            }
            if (!this.labelChanged)
            {
            }
            if (this.showLabelChanged)
            {
            }
            if (this.labelDisplay2)
            {
                if (label.length != 0)
                {
                }
                _loc_1 = this._showLabel;
                this.labelDisplay2.visible = _loc_1;
                this.labelDisplay2.includeInLayout = _loc_1;
                this.labelChanged = false;
                this.showLabelChanged = false;
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
