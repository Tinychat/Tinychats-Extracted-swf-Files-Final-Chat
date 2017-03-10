package com.tinychat.ui.skins.gotham.components.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class BroadcastAuthorizationWorkaroundScreenSkin extends Skin
    {
        private var _951117504confirm:Button;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _204249398workaroundInfoDisplay:RichEditableText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:BroadcastAuthorizationWorkaroundScreen;

        public function BroadcastAuthorizationWorkaroundScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 500;
            this.layout = this._BroadcastAuthorizationWorkaroundScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._BroadcastAuthorizationWorkaroundScreenSkin_TitleDisplay1_i(), this._BroadcastAuthorizationWorkaroundScreenSkin_RichEditableText1_i(), this._BroadcastAuthorizationWorkaroundScreenSkin_Button1_i()];
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

        private function _BroadcastAuthorizationWorkaroundScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.paddingTop = 0;
            _loc_1.paddingBottom = 10;
            _loc_1.gap = 15;
            _loc_1.horizontalAlign = "center";
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationWorkaroundScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.height = 50;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationWorkaroundScreenSkin_RichEditableText1_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.editable = false;
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("paddingLeft", 10);
            _loc_1.setStyle("paddingRight", 10);
            _loc_1.id = "workaroundInfoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.workaroundInfoDisplay = _loc_1;
            BindingManager.executeBindings(this, "workaroundInfoDisplay", this.workaroundInfoDisplay);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationWorkaroundScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
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

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get workaroundInfoDisplay() : RichEditableText
        {
            return this._204249398workaroundInfoDisplay;
        }// end function

        public function set workaroundInfoDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._204249398workaroundInfoDisplay;
            if (_loc_2 !== param1)
            {
                this._204249398workaroundInfoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "workaroundInfoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : BroadcastAuthorizationWorkaroundScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:BroadcastAuthorizationWorkaroundScreen) : void
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
