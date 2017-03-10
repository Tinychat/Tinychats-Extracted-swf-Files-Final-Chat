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
    import spark.skins.*;

    public class TitleDisplaySkin extends SparkSkin implements IStateClient2
    {
        private var _67244421border1:Line;
        private var _67244422border2:Line;
        private var _809612678contentGroup:Group;
        private var _831827669textDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TitleDisplay;
        private static const exclusions:Array = ["textDisplay", "border1", "border2", "contentGroup"];

        public function TitleDisplaySkin()
        {
            mx_internal::_document = this;
            this.minHeight = 50;
            this.mxmlContent = [this._TitleDisplaySkin_Rect1_c(), this._TitleDisplaySkin_VGroup1_c(), this._TitleDisplaySkin_Line1_i(), this._TitleDisplaySkin_Line2_i()];
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

        override public function get colorizeExclusions() : Array
        {
            return exclusions;
        }// end function

        override protected function initializationComplete() : void
        {
            useChromeColor = true;
            super.initializationComplete();
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (this.contentGroup)
            {
                this.contentGroup.includeInLayout = this.contentGroup.numElements > 0;
            }
            return;
        }// end function

        private function _TitleDisplaySkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._TitleDisplaySkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 13421772;
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.horizontalAlign = "justify";
            _loc_1.gap = 15;
            _loc_1.paddingLeft = 10;
            _loc_1.paddingRight = 10;
            _loc_1.paddingTop = 22;
            _loc_1.paddingBottom = 15;
            _loc_1.mxmlContent = [this._TitleDisplaySkin_Label1_i(), this._TitleDisplaySkin_Group1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.maxDisplayedLines = 2;
            _loc_1.setStyle("lineBreak", "toFit");
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "textDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.textDisplay = _loc_1;
            BindingManager.executeBindings(this, "textDisplay", this.textDisplay);
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 1;
            _loc_1.stroke = this._TitleDisplaySkin_SolidColorStroke1_c();
            _loc_1.initialized(this, "border1");
            this.border1 = _loc_1;
            BindingManager.executeBindings(this, "border1", this.border1);
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 14410471;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_Line2_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._TitleDisplaySkin_SolidColorStroke2_c();
            _loc_1.initialized(this, "border2");
            this.border2 = _loc_1;
            BindingManager.executeBindings(this, "border2", this.border2);
            return _loc_1;
        }// end function

        private function _TitleDisplaySkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12238788;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        public function get border1() : Line
        {
            return this._67244421border1;
        }// end function

        public function set border1(param1:Line) : void
        {
            var _loc_2:* = this._67244421border1;
            if (_loc_2 !== param1)
            {
                this._67244421border1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get border2() : Line
        {
            return this._67244422border2;
        }// end function

        public function set border2(param1:Line) : void
        {
            var _loc_2:* = this._67244422border2;
            if (_loc_2 !== param1)
            {
                this._67244422border2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border2", _loc_2, param1));
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

        public function get textDisplay() : Label
        {
            return this._831827669textDisplay;
        }// end function

        public function set textDisplay(param1:Label) : void
        {
            var _loc_2:* = this._831827669textDisplay;
            if (_loc_2 !== param1)
            {
                this._831827669textDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TitleDisplay
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TitleDisplay) : void
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
