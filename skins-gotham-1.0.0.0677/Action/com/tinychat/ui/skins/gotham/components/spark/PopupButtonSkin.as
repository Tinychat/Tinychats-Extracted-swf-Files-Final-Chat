package com.tinychat.ui.skins.gotham.components.spark
{
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class PopupButtonSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _433014735dropDown:Group;
        private var _137111012openButton:IconButton;
        private var _106851532popUp:PopUpAnchor;
        private var _402164678scroller:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:PopupList;

        public function PopupButtonSkin()
        {
            mx_internal::_document = this;
            this.minHeight = 30;
            this.mxmlContent = [this._PopupButtonSkin_IconButton1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._PopupButtonSkin_PopUpAnchor1_i, this._PopupButtonSkin_PopUpAnchor1_r);
            states = [new State({name:"normal", overrides:[new SetProperty().initializeFromObject({target:"popUp", name:"displayPopUp", value:false})]}), new State({name:"open", overrides:[new AddItems().initializeFromObject({destructionPolicy:"auto", itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"popUp", name:"displayPopUp", value:true})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({target:"openButton", name:"enabled", value:false})]})];
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

        private function _PopupButtonSkin_PopUpAnchor1_i() : PopUpAnchor
        {
            var _loc_1:* = new PopUpAnchor();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.popUpPosition = "below";
            _loc_1.popUpWidthMatchesAnchorWidth = false;
            _loc_1.popUp = this._PopupButtonSkin_Group1_i();
            _loc_1.id = "popUp";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.popUp = _loc_1;
            BindingManager.executeBindings(this, "popUp", this.popUp);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_PopUpAnchor1_r() : void
        {
            var _loc_1:String = null;
            this.popUp = null;
            var _loc_1:String = null;
            this.dropDown = null;
            var _loc_1:String = null;
            this.scroller = null;
            var _loc_1:String = null;
            this.dataGroup = null;
            return;
        }// end function

        private function _PopupButtonSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.maxHeight = 134;
            _loc_1.minHeight = 22;
            _loc_1.mxmlContent = [this._PopupButtonSkin_Rect1_c(), this._PopupButtonSkin_Scroller1_i(), this._PopupButtonSkin_Rect2_c()];
            _loc_1.id = "dropDown";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dropDown = _loc_1;
            BindingManager.executeBindings(this, "dropDown", this.dropDown);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.bottomLeftRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.fill = this._PopupButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 13092807;
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_Scroller1_i() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.hasFocusableChildren = false;
            _loc_1.minViewportInset = 0;
            _loc_1.viewport = this._PopupButtonSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            _loc_1.id = "scroller";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.scroller = _loc_1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.itemRenderer = this._PopupButtonSkin_ClassFactory1_c();
            _loc_1.layout = this._PopupButtonSkin_VerticalLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = DropDownListItemRenderer;
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 1;
            _loc_1.rowHeight = 24;
            _loc_1.variableRowHeight = false;
            _loc_1.horizontalAlign = "contentJustify";
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.bottomLeftRadiusX = 2;
            _loc_1.bottomRightRadiusX = 2;
            _loc_1.stroke = this._PopupButtonSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            return _loc_1;
        }// end function

        private function _PopupButtonSkin_IconButton1_i() : IconButton
        {
            var _loc_1:* = new IconButton();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "openButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.openButton = _loc_1;
            BindingManager.executeBindings(this, "openButton", this.openButton);
            return _loc_1;
        }// end function

        public function get dataGroup() : DataGroup
        {
            return this._385593099dataGroup;
        }// end function

        public function set dataGroup(param1:DataGroup) : void
        {
            var _loc_2:* = this._385593099dataGroup;
            if (_loc_2 !== param1)
            {
                this._385593099dataGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get dropDown() : Group
        {
            return this._433014735dropDown;
        }// end function

        public function set dropDown(param1:Group) : void
        {
            var _loc_2:* = this._433014735dropDown;
            if (_loc_2 !== param1)
            {
                this._433014735dropDown = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDown", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get openButton() : IconButton
        {
            return this._137111012openButton;
        }// end function

        public function set openButton(param1:IconButton) : void
        {
            var _loc_2:* = this._137111012openButton;
            if (_loc_2 !== param1)
            {
                this._137111012openButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get popUp() : PopUpAnchor
        {
            return this._106851532popUp;
        }// end function

        public function set popUp(param1:PopUpAnchor) : void
        {
            var _loc_2:* = this._106851532popUp;
            if (_loc_2 !== param1)
            {
                this._106851532popUp = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popUp", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get scroller() : Scroller
        {
            return this._402164678scroller;
        }// end function

        public function set scroller(param1:Scroller) : void
        {
            var _loc_2:* = this._402164678scroller;
            if (_loc_2 !== param1)
            {
                this._402164678scroller = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : PopupList
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PopupList) : void
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
