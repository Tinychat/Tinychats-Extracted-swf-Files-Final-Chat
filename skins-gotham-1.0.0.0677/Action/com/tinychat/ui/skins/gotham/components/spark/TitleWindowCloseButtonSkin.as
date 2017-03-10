package com.tinychat.ui.skins.gotham.components.spark
{
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class TitleWindowCloseButtonSkin extends Skin implements IStateClient2
    {
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function TitleWindowCloseButtonSkin()
        {
            mx_internal::_document = this;
            this.minWidth = 21;
            this.minHeight = 21;
            this.layout = this._TitleWindowCloseButtonSkin_BasicLayout1_c();
            this.mxmlContent = [this._TitleWindowCloseButtonSkin_Ellipse1_c(), this._TitleWindowCloseButtonSkin_Group1_c()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _TitleWindowCloseButtonSkin_BasicLayout1_c() : BasicLayout
        {
            var _loc_1:* = new BasicLayout();
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_Ellipse1_c() : Ellipse
        {
            var _loc_1:* = new Ellipse();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._TitleWindowCloseButtonSkin_SolidColorStroke1_c();
            _loc_1.fill = this._TitleWindowCloseButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 5021162;
            _loc_1.weight = 3;
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._TitleWindowCloseButtonSkin_Line1_c(), this._TitleWindowCloseButtonSkin_Line2_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.xFrom = 0;
            _loc_1.yFrom = 0;
            _loc_1.xTo = 4;
            _loc_1.yTo = 4;
            _loc_1.stroke = this._TitleWindowCloseButtonSkin_SolidColorStroke2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 16777215;
            _loc_1.weight = 1.5;
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_Line2_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.xFrom = 4;
            _loc_1.yFrom = 0;
            _loc_1.xTo = 0;
            _loc_1.yTo = 4;
            _loc_1.stroke = this._TitleWindowCloseButtonSkin_SolidColorStroke3_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowCloseButtonSkin_SolidColorStroke3_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 16777215;
            _loc_1.weight = 1.5;
            return _loc_1;
        }// end function

        public function get hostComponent() : Button
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:Button) : void
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
