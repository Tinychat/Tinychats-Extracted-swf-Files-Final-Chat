package com.tinychat.ui.skins.gotham.components.video.controls
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class AddSmallButtonSkin extends Skin implements IStateClient2
    {
        private var _724993712_AddSmallButtonSkin_BitmapImage1:BitmapImage;
        public var _AddSmallButtonSkin_BitmapImage2:BitmapImage;
        public var _AddSmallButtonSkin_Rect1:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_added_item_png_253606105:Class;
        private var _embed_mxml__images_icons_add_item_png_382545361:Class;
        private var _213507019hostComponent:ToggleButton;

        public function AddSmallButtonSkin()
        {
            this._embed_mxml__images_icons_added_item_png_253606105 = AddSmallButtonSkin__embed_mxml__images_icons_added_item_png_253606105;
            this._embed_mxml__images_icons_add_item_png_382545361 = AddSmallButtonSkin__embed_mxml__images_icons_add_item_png_382545361;
            mx_internal::_document = this;
            this.mxmlContent = [this._AddSmallButtonSkin_Rect1_i()];
            this.currentState = "up";
            var _loc_1:* = new DeferredInstanceFromFunction(this._AddSmallButtonSkin_BitmapImage1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._AddSmallButtonSkin_BitmapImage2_i);
            states = [new State({name:"up", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"_AddSmallButtonSkin_BitmapImage1", name:"alpha", value:0.6})]}), new State({name:"down", stateGroups:["downStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]}), new SetProperty().initializeFromObject({target:"_AddSmallButtonSkin_BitmapImage1", name:"alpha", value:0.8})]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_AddSmallButtonSkin_Rect1"]})]})];
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

        private function _AddSmallButtonSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 10;
            _loc_1.radiusY = 10;
            _loc_1.fill = this._AddSmallButtonSkin_SolidColor1_c();
            _loc_1.initialized(this, "_AddSmallButtonSkin_Rect1");
            this._AddSmallButtonSkin_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_AddSmallButtonSkin_Rect1", this._AddSmallButtonSkin_Rect1);
            return _loc_1;
        }// end function

        private function _AddSmallButtonSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.6;
            return _loc_1;
        }// end function

        private function _AddSmallButtonSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.source = this._embed_mxml__images_icons_add_item_png_382545361;
            _loc_1.initialized(this, "_AddSmallButtonSkin_BitmapImage1");
            this._AddSmallButtonSkin_BitmapImage1 = _loc_1;
            BindingManager.executeBindings(this, "_AddSmallButtonSkin_BitmapImage1", this._AddSmallButtonSkin_BitmapImage1);
            return _loc_1;
        }// end function

        private function _AddSmallButtonSkin_BitmapImage2_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.source = this._embed_mxml__images_icons_added_item_png_253606105;
            _loc_1.initialized(this, "_AddSmallButtonSkin_BitmapImage2");
            this._AddSmallButtonSkin_BitmapImage2 = _loc_1;
            BindingManager.executeBindings(this, "_AddSmallButtonSkin_BitmapImage2", this._AddSmallButtonSkin_BitmapImage2);
            return _loc_1;
        }// end function

        public function get _AddSmallButtonSkin_BitmapImage1() : BitmapImage
        {
            return this._724993712_AddSmallButtonSkin_BitmapImage1;
        }// end function

        public function set _AddSmallButtonSkin_BitmapImage1(param1:BitmapImage) : void
        {
            var _loc_2:* = this._724993712_AddSmallButtonSkin_BitmapImage1;
            if (_loc_2 !== param1)
            {
                this._724993712_AddSmallButtonSkin_BitmapImage1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_AddSmallButtonSkin_BitmapImage1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ToggleButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ToggleButton) : void
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
