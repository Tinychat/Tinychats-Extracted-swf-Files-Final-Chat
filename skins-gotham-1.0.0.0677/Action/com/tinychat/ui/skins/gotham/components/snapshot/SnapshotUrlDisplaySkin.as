package com.tinychat.ui.skins.gotham.components.snapshot
{
    import com.tinychat.ui.components.url.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class SnapshotUrlDisplaySkin extends Skin
    {
        private var _3059573copy:Button;
        private var _3417674open:Button;
        private var _831827669textDisplay:TextArea;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:UrlDisplay;

        public function SnapshotUrlDisplaySkin()
        {
            mx_internal::_document = this;
            this.layout = this._SnapshotUrlDisplaySkin_HorizontalLayout1_c();
            this.mxmlContent = [this._SnapshotUrlDisplaySkin_TextArea1_i(), this._SnapshotUrlDisplaySkin_Button1_i(), this._SnapshotUrlDisplaySkin_Button2_i()];
            return;
        }// end function

        override public function set moduleFactory(param1:IFlexModuleFactory) : void
        {
            super.moduleFactory = param1;
            if (this.__moduleFactoryInitialized)
            {
                return;
            }
            this.__moduleFactoryInitialized = true;
            return;
        }// end function

        override public function initialize() : void
        {
            super.initialize();
            return;
        }// end function

        private function _SnapshotUrlDisplaySkin_HorizontalLayout1_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.gap = 5;
            _loc_1.paddingBottom = 20;
            _loc_1.verticalAlign = "middle";
            return _loc_1;
        }// end function

        private function _SnapshotUrlDisplaySkin_TextArea1_i() : TextArea
        {
            var _loc_1:* = new TextArea();
            _loc_1.percentWidth = 100;
            _loc_1.heightInLines = 2;
            _loc_1.mouseChildren = false;
            _loc_1.mouseEnabled = false;
            _loc_1.setStyle("verticalScrollPolicy", "off");
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        private function _SnapshotUrlDisplaySkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "copy";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.copy = _loc_1;
            BindingManager.executeBindings(this, "copy", this.copy);
            return _loc_1;
        }// end function

        private function _SnapshotUrlDisplaySkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "open";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.open = _loc_1;
            BindingManager.executeBindings(this, "open", this.open);
            return _loc_1;
        }// end function

        public function get copy() : Button
        {
            return this._3059573copy;
        }// end function

        public function set copy(param1:Button) : void
        {
            var _loc_2:* = this._3059573copy;
            if (_loc_2 !== param1)
            {
                this._3059573copy = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "copy", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get open() : Button
        {
            return this._3417674open;
        }// end function

        public function set open(param1:Button) : void
        {
            var _loc_2:* = this._3417674open;
            if (_loc_2 !== param1)
            {
                this._3417674open = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "open", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get textDisplay() : TextArea
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:TextArea) : void
        {
            var _loc_2:* = this._831827669textDisplay;
            if (_loc_2 !== param1)
            {
                this._831827669textDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : UrlDisplay
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:UrlDisplay) : void
        {
            var _loc_2:* = this._213507019hostComponent;
            if (_loc_2 !== param1)
            {
                this._213507019hostComponent = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
