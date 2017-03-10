package com.tinychat.ui.skins.gotham.components.social.buttonbar
{
    import com.tinychat.ui.components.social.buttonbar.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class SocialButtonBarSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _807332991dataGroupLayout:HorizontalLayout;
        private var _729134585fillRect:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        private var lastPosition:Point;
        private var lastUnscaledWidth:Number = 0;
        private var hasMoved:Boolean;
        private var _213507019hostComponent:SocialButtonBar;

        public function SocialButtonBarSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._SocialButtonBarSkin_Rect1_i(), this._SocialButtonBarSkin_DataGroup1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_4:IVisualElement = null;
            super.updateDisplayList(param1, param2);
            var _loc_3:* = localToGlobal(new Point(x, y));
            if (this.lastPosition)
            {
            }
            if (!this.lastPosition.equals(_loc_3))
            {
                this.hasMoved = true;
                this.lastPosition = _loc_3;
            }
            var _loc_5:uint = 0;
            while (_loc_5 < this.dataGroup.numElements)
            {
                
                _loc_4 = this.dataGroup.getElementAt(_loc_5);
                if (this.hasMoved)
                {
                }
                if (_loc_4 is CountDisplayButtonBarButton)
                {
                    _loc_4.dispatchEvent(new Event("moved"));
                }
                _loc_5 = _loc_5 + 1;
            }
            this.hasMoved = false;
            return;
        }// end function

        protected function dataGroup_updateCompleteHandler(event:FlexEvent) : void
        {
            this.fillRect.height = this.dataGroup.height;
            this.fillRect.width = this.dataGroup.width - this.dataGroup.contentWidth - this.dataGroupLayout.gap;
            this.fillRect.x = this.dataGroup.contentWidth + this.dataGroupLayout.gap;
            return;
        }// end function

        private function _SocialButtonBarSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.includeInLayout = false;
            _loc_1.fill = this._SocialButtonBarSkin_LinearGradient1_c();
            _loc_1.initialized(this, "fillRect");
            this.fillRect = _loc_1;
            BindingManager.executeBindings(this, "fillRect", this.fillRect);
            return _loc_1;
        }// end function

        private function _SocialButtonBarSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._SocialButtonBarSkin_GradientEntry1_c(), this._SocialButtonBarSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _SocialButtonBarSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _SocialButtonBarSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14474460;
            return _loc_1;
        }// end function

        private function _SocialButtonBarSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.layout = this._SocialButtonBarSkin_HorizontalLayout1_i();
            _loc_1.addEventListener("updateComplete", this.__dataGroup_updateComplete);
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _SocialButtonBarSkin_HorizontalLayout1_i() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            this.dataGroupLayout = _loc_1;
            BindingManager.executeBindings(this, "dataGroupLayout", this.dataGroupLayout);
            return _loc_1;
        }// end function

        public function __dataGroup_updateComplete(event:FlexEvent) : void
        {
            this.dataGroup_updateCompleteHandler(event);
            return;
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

        public function get dataGroupLayout() : HorizontalLayout
        {
            return this._807332991dataGroupLayout;
        }// end function

        public function set dataGroupLayout(param1:HorizontalLayout) : void
        {
            var _loc_2:* = this._807332991dataGroupLayout;
            if (_loc_2 !== param1)
            {
                this._807332991dataGroupLayout = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroupLayout", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get fillRect() : Rect
        {
            return this._729134585fillRect;
        }// end function

        public function set fillRect(param1:Rect) : void
        {
            var _loc_2:* = this._729134585fillRect;
            if (_loc_2 !== param1)
            {
                this._729134585fillRect = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fillRect", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : SocialButtonBar
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:SocialButtonBar) : void
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
