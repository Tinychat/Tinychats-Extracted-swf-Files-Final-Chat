package com.tinychat.ui.skins.gotham.components.trial
{
    import com.tinychat.ui.components.trial.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class TrialOverlaySkin extends Skin
    {
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _909318622statusLabel:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TrialOverlay;

        public function TrialOverlaySkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._TrialOverlaySkin_Rect1_c(), this._TrialOverlaySkin_Group1_c()];
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

        private function _TrialOverlaySkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._TrialOverlaySkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.3;
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._TrialOverlaySkin_Rect2_c(), this._TrialOverlaySkin_VGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 6;
            _loc_1.fill = this._TrialOverlaySkin_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.9;
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.gap = 10;
            _loc_1.paddingLeft = 10;
            _loc_1.paddingRight = 10;
            _loc_1.paddingTop = 10;
            _loc_1.paddingBottom = 10;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._TrialOverlaySkin_Label1_i(), this._TrialOverlaySkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "statusLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.statusLabel = _loc_1;
            BindingManager.executeBindings(this, "statusLabel", this.statusLabel);
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 20;
            _loc_1.mxmlContent = [this._TrialOverlaySkin_Button1_i(), this._TrialOverlaySkin_Button2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.styleName = "titleWindowButton";
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _TrialOverlaySkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.styleName = "titleWindowButton";
            _loc_1.id = "cancel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.cancel = _loc_1;
            BindingManager.executeBindings(this, "cancel", this.cancel);
            return _loc_1;
        }// end function

        public function get cancel() : Button
        {
            return this._1367724422cancel;
        }// end function

        public function set cancel(param1:Button) : void
        {
            var _loc_2:* = this._1367724422cancel;
            if (_loc_2 !== param1)
            {
                this._1367724422cancel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get statusLabel() : Label
        {
            return this._909318622statusLabel;
        }// end function

        public function set statusLabel(param1:Label) : void
        {
            var _loc_2:* = this._909318622statusLabel;
            if (_loc_2 !== param1)
            {
                this._909318622statusLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TrialOverlay
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TrialOverlay) : void
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
