package com.tinychat.ui.skins.gotham.components.social.chat
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class PrivateChatCloseButtonSkin extends Skin implements IStateClient2
    {
        private var _44512851_PrivateChatCloseButtonSkin_SolidColorStroke1:SolidColorStroke;
        private var _44512850_PrivateChatCloseButtonSkin_SolidColorStroke2:SolidColorStroke;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:Button;

        public function PrivateChatCloseButtonSkin()
        {
            mx_internal::_document = this;
            this.width = 8;
            this.height = 8;
            this.mxmlContent = [this._PrivateChatCloseButtonSkin_Rect1_c(), this._PrivateChatCloseButtonSkin_Line1_c(), this._PrivateChatCloseButtonSkin_Line2_c()];
            this.currentState = "disabled";
            states = [new State({name:"disabled", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"_PrivateChatCloseButtonSkin_SolidColorStroke1", name:"color", value:7239030}), new SetProperty().initializeFromObject({target:"_PrivateChatCloseButtonSkin_SolidColorStroke2", name:"color", value:7239030})]}), new State({name:"up", overrides:[]})];
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

        private function _PrivateChatCloseButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.fill = this._PrivateChatCloseButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatCloseButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.alpha = 0;
            return _loc_1;
        }// end function

        private function _PrivateChatCloseButtonSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.xFrom = 0;
            _loc_1.yFrom = 0;
            _loc_1.xTo = 4;
            _loc_1.yTo = 4;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.stroke = this._PrivateChatCloseButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatCloseButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11450554;
            _loc_1.caps = "square";
            _loc_1.weight = 2;
            this._PrivateChatCloseButtonSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_PrivateChatCloseButtonSkin_SolidColorStroke1", this._PrivateChatCloseButtonSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _PrivateChatCloseButtonSkin_Line2_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.xFrom = 4;
            _loc_1.yFrom = 0;
            _loc_1.xTo = 0;
            _loc_1.yTo = 4;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.stroke = this._PrivateChatCloseButtonSkin_SolidColorStroke2_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatCloseButtonSkin_SolidColorStroke2_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11450554;
            _loc_1.caps = "square";
            _loc_1.weight = 2;
            this._PrivateChatCloseButtonSkin_SolidColorStroke2 = _loc_1;
            BindingManager.executeBindings(this, "_PrivateChatCloseButtonSkin_SolidColorStroke2", this._PrivateChatCloseButtonSkin_SolidColorStroke2);
            return _loc_1;
        }// end function

        public function get _PrivateChatCloseButtonSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._44512851_PrivateChatCloseButtonSkin_SolidColorStroke1;
        }// end function

        public function set _PrivateChatCloseButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._44512851_PrivateChatCloseButtonSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._44512851_PrivateChatCloseButtonSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PrivateChatCloseButtonSkin_SolidColorStroke1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _PrivateChatCloseButtonSkin_SolidColorStroke2() : SolidColorStroke
        {
            return this._44512850_PrivateChatCloseButtonSkin_SolidColorStroke2;
        }// end function

        public function set _PrivateChatCloseButtonSkin_SolidColorStroke2(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._44512850_PrivateChatCloseButtonSkin_SolidColorStroke2;
            if (_loc_2 !== param1)
            {
                this._44512850_PrivateChatCloseButtonSkin_SolidColorStroke2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_PrivateChatCloseButtonSkin_SolidColorStroke2", _loc_2, param1));
                }
            }
            return;
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
