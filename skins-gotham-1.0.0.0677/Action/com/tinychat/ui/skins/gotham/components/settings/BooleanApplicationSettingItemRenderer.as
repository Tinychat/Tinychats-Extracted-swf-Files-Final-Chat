package com.tinychat.ui.skins.gotham.components.settings
{
    import com.tinychat.model.settings.*;
    import com.tinychat.ui.components.settings.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;

    public class BooleanApplicationSettingItemRenderer extends ApplicationSettingItemRendererBase
    {
        private var _1536891843checkbox:CheckBox;
        private var __moduleFactoryInitialized:Boolean = false;

        public function BooleanApplicationSettingItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.mxmlContent = [this._BooleanApplicationSettingItemRenderer_CheckBox1_i()];
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
            super.data = param1;
            var _loc_2:* = ApplicationSetting(param1);
            this.checkbox.label = _loc_2.displayName;
            this.checkbox.selected = _loc_2.value;
            return;
        }// end function

        override public function get value() : Object
        {
            return this.checkbox.selected;
        }// end function

        private function _BooleanApplicationSettingItemRenderer_CheckBox1_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.percentWidth = 100;
            _loc_1.id = "checkbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.checkbox = _loc_1;
            BindingManager.executeBindings(this, "checkbox", this.checkbox);
            return _loc_1;
        }// end function

        public function get checkbox() : CheckBox
        {
            return this._1536891843checkbox;
        }// end function

        public function set checkbox(param1:CheckBox) : void
        {
            var _loc_2:* = this._1536891843checkbox;
            if (_loc_2 !== param1)
            {
                this._1536891843checkbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "checkbox", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
