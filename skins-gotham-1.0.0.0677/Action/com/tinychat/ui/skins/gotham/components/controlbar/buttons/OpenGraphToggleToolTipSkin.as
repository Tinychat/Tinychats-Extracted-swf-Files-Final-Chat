package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.skins.gotham.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class OpenGraphToggleToolTipSkin extends Skin implements IStateClient2
    {
        private var _94756344close:Button;
        private var _809612678contentGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;

        public function OpenGraphToggleToolTipSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._OpenGraphToggleToolTipSkin_Rect1_c(), this._OpenGraphToggleToolTipSkin_Path1_c(), this._OpenGraphToggleToolTipSkin_Button1_i(), this._OpenGraphToggleToolTipSkin_Group1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _OpenGraphToggleToolTipSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 16;
            _loc_1.radiusX = 8;
            _loc_1.fill = this._OpenGraphToggleToolTipSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleToolTipSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.8;
            return _loc_1;
        }// end function

        private function _OpenGraphToggleToolTipSkin_Path1_c() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.horizontalCenter = 0;
            _loc_1.bottom = 0;
            _loc_1.rotation = 180;
            _loc_1.scaleX = 4;
            _loc_1.scaleY = 4;
            _loc_1.data = "M 0 4 L 3.5 0 L 7 4 Z";
            _loc_1.fill = this._OpenGraphToggleToolTipSkin_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleToolTipSkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.8;
            return _loc_1;
        }// end function

        private function _OpenGraphToggleToolTipSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 20;
            _loc_1.height = 20;
            _loc_1.top = -7;
            _loc_1.right = -7;
            _loc_1.setStyle("skinClass", TitleWindowCloseButtonSkin);
            _loc_1.id = "close";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.close = _loc_1;
            BindingManager.executeBindings(this, "close", this.close);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleToolTipSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 14;
            _loc_1.right = 14;
            _loc_1.top = 14;
            _loc_1.bottom = 30;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        public function get close() : Button
        {
            return this._94756344close;
        }// end function

        public function set close(param1:Button) : void
        {
            var _loc_2:* = this._94756344close;
            if (_loc_2 !== param1)
            {
                this._94756344close = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "close", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get contentGroup() : Group
        {
            return this._809612678contentGroup;
        }// end function

        public function set contentGroup(param1:Group) : void
        {
            var _loc_2:* = this._809612678contentGroup;
            if (_loc_2 !== param1)
            {
                this._809612678contentGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
