package com.tinychat.ui.skins.gotham.components.gifts
{
    import com.tinychat.ui.components.gifts.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class TinychatGiftScreenSkin extends Skin implements IStateClient2
    {
        public var _TinychatGiftScreenSkin_Group1:Group;
        private var _268660470notFoundMessageDisplay:Label;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TinychatGiftScreen;

        public function TinychatGiftScreenSkin()
        {
            mx_internal::_document = this;
            this.width = 380;
            this.maxHeight = 250;
            this.layout = this._TinychatGiftScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._TinychatGiftScreenSkin_Group1_i()];
            this.currentState = "found";
            var _loc_1:* = new DeferredInstanceFromFunction(this._TinychatGiftScreenSkin_Label1_i);
            states = [new State({name:"found", overrides:[]}), new State({name:"notFound", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_TinychatGiftScreenSkin_Group1"]})]})];
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

        private function _TinychatGiftScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 10;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _TinychatGiftScreenSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.height = 40;
            _loc_1.mxmlContent = [this._TinychatGiftScreenSkin_TitleDisplay1_i()];
            _loc_1.id = "_TinychatGiftScreenSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._TinychatGiftScreenSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatGiftScreenSkin_Group1", this._TinychatGiftScreenSkin_Group1);
            return _loc_1;
        }// end function

        private function _TinychatGiftScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _TinychatGiftScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("paddingBottom", 15);
            _loc_1.setStyle("paddingLeft", 30);
            _loc_1.setStyle("paddingRight", 30);
            _loc_1.setStyle("paddingTop", 18);
            _loc_1.id = "notFoundMessageDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.notFoundMessageDisplay = _loc_1;
            BindingManager.executeBindings(this, "notFoundMessageDisplay", this.notFoundMessageDisplay);
            return _loc_1;
        }// end function

        public function get notFoundMessageDisplay() : Label
        {
            return this._268660470notFoundMessageDisplay;
        }// end function

        public function set notFoundMessageDisplay(param1:Label) : void
        {
            var _loc_2:* = this._268660470notFoundMessageDisplay;
            if (_loc_2 !== param1)
            {
                this._268660470notFoundMessageDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "notFoundMessageDisplay", _loc_2, param1));
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

        public function get hostComponent() : TinychatGiftScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TinychatGiftScreen) : void
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
