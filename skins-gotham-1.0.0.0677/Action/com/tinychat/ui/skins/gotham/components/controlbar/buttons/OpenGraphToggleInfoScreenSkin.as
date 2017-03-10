package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class OpenGraphToggleInfoScreenSkin extends Skin
    {
        private var _2097414477activityDisplay:Label;
        private var _299873228infoDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;

        public function OpenGraphToggleInfoScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 300;
            this.layout = this._OpenGraphToggleInfoScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._OpenGraphToggleInfoScreenSkin_Label1_i(), this._OpenGraphToggleInfoScreenSkin_Label2_i()];
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

        private function _OpenGraphToggleInfoScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 10;
            return _loc_1;
        }// end function

        private function _OpenGraphToggleInfoScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.maxDisplayedLines = -1;
            _loc_1.percentWidth = 100;
            _loc_1.id = "infoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.infoDisplay = _loc_1;
            BindingManager.executeBindings(this, "infoDisplay", this.infoDisplay);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleInfoScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("fontSize", 10);
            _loc_1.setStyle("color", 2540016);
            _loc_1.id = "activityDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.activityDisplay = _loc_1;
            BindingManager.executeBindings(this, "activityDisplay", this.activityDisplay);
            return _loc_1;
        }// end function

        public function get activityDisplay() : Label
        {
            return this._2097414477activityDisplay;
        }// end function

        public function set activityDisplay(param1:Label) : void
        {
            var _loc_2:* = this._2097414477activityDisplay;
            if (_loc_2 !== param1)
            {
                this._2097414477activityDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "activityDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get infoDisplay() : Label
        {
            return this._299873228infoDisplay;
        }// end function

        public function set infoDisplay(param1:Label) : void
        {
            var _loc_2:* = this._299873228infoDisplay;
            if (_loc_2 !== param1)
            {
                this._299873228infoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
