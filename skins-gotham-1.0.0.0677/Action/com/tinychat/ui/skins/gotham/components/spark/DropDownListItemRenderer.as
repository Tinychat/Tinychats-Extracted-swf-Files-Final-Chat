package com.tinychat.ui.skins.gotham.components.spark
{
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;

    public class DropDownListItemRenderer extends AdvancedItemRenderer implements IStateClient2
    {
        private var _1287124693backgroundColor:SolidColor;
        private var __moduleFactoryInitialized:Boolean = false;

        public function DropDownListItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.minHeight = 24;
            this.mxmlContent = [this._DropDownListItemRenderer_Rect1_c(), this._DropDownListItemRenderer_Label1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]})];
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

        override public function set label(param1:String) : void
        {
            super.label = param1;
            labelDisplay.text = param1;
            return;
        }// end function

        private function _DropDownListItemRenderer_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._DropDownListItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _DropDownListItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _DropDownListItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 11;
            _loc_1.right = 11;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
            return _loc_1;
        }// end function

        public function get backgroundColor() : SolidColor
        {
            return this._1287124693backgroundColor;
        }// end function

        public function set backgroundColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._1287124693backgroundColor;
            if (_loc_2 !== param1)
            {
                this._1287124693backgroundColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
