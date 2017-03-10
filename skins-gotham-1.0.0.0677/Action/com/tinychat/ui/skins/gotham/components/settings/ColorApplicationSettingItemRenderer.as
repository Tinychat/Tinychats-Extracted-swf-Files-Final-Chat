package com.tinychat.ui.skins.gotham.components.settings
{
    import com.tinychat.model.settings.*;
    import com.tinychat.ui.components.settings.*;
    import mx.binding.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;

    public class ColorApplicationSettingItemRenderer extends ApplicationSettingItemRendererBase
    {
        private var _885706193colorPicker:ColorPicker;
        private var _1844466615nameDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;

        public function ColorApplicationSettingItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.mxmlContent = [this._ColorApplicationSettingItemRenderer_ColorPicker1_i(), this._ColorApplicationSettingItemRenderer_Label1_i()];
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

        override public function set data(param1:Object) : void
        {
            var _loc_4:uint = 0;
            super.data = param1;
            var _loc_2:* = ChatColorApplicationSetting(param1);
            this.nameDisplay.text = _loc_2.displayName;
            var _loc_3:Array = [];
            for each (_loc_4 in _loc_2.all)
            {
                
                _loc_3.push(_loc_4);
            }
            this.colorPicker.dataProvider = _loc_3;
            this.colorPicker.selectedColor = uint(_loc_2.value);
            return;
        }// end function

        override public function get value() : Object
        {
            return this.colorPicker.selectedColor;
        }// end function

        private function _ColorApplicationSettingItemRenderer_ColorPicker1_i() : ColorPicker
        {
            var _loc_1:* = new ColorPicker();
            _loc_1.width = 22;
            _loc_1.height = 22;
            _loc_1.editable = false;
            _loc_1.showTextField = false;
            _loc_1.id = "colorPicker";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.colorPicker = _loc_1;
            BindingManager.executeBindings(this, "colorPicker", this.colorPicker);
            return _loc_1;
        }// end function

        private function _ColorApplicationSettingItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 28;
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 1;
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        public function get colorPicker() : ColorPicker
        {
            return this._885706193colorPicker;
        }// end function

        public function set colorPicker(param1:ColorPicker) : void
        {
            var _loc_2:* = this._885706193colorPicker;
            if (_loc_2 !== param1)
            {
                this._885706193colorPicker = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorPicker", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nameDisplay() : Label
        {
            return this._1844466615nameDisplay;
        }// end function

        public function set nameDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1844466615nameDisplay;
            if (_loc_2 !== param1)
            {
                this._1844466615nameDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
