package com.tinychat.ui.skins.gotham.components.spark
{
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class TitleWindowSkin extends Skin implements IStateClient2
    {
        private var _312699062closeButton:Button;
        private var _809612678contentGroup:Group;
        private var _104976386moveArea:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:TitleWindow;

        public function TitleWindowSkin()
        {
            mx_internal::_document = this;
            this.blendMode = "normal";
            this.mouseEnabled = false;
            this.mxmlContent = [this._TitleWindowSkin_Rect1_c(), this._TitleWindowSkin_Group1_i(), this._TitleWindowSkin_Group2_i(), this._TitleWindowSkin_Rect2_c(), this._TitleWindowSkin_Rect3_c(), this._TitleWindowSkin_Rect4_c(), this._TitleWindowSkin_Button1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"inactive", stateGroups:["inactiveGroup"], overrides:[]}), new State({name:"disabled", overrides:[]}), new State({name:"normalWithControlBar", stateGroups:["withControls"], overrides:[]}), new State({name:"inactiveWithControlBar", stateGroups:["inactiveGroup", "withControls"], overrides:[]}), new State({name:"disabledWithControlBar", stateGroups:["withControls"], overrides:[]})];
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

        override protected function measure() : void
        {
            super.measure();
            if (stage)
            {
                maxWidth = stage.width < 780 ? (stage.width) : (780);
            }
            return;
        }// end function

        private function _TitleWindowSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.top = 5;
            _loc_1.bottom = 5;
            _loc_1.fill = this._TitleWindowSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.top = 5;
            _loc_1.bottom = 5;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 60;
            _loc_1.alpha = 0;
            _loc_1.useHandCursor = true;
            _loc_1.mouseEnabled = true;
            _loc_1.mouseChildren = true;
            _loc_1.id = "moveArea";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.moveArea = _loc_1;
            BindingManager.executeBindings(this, "moveArea", this.moveArea);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._TitleWindowSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 4;
            _loc_1.entries = [this._TitleWindowSkin_GradientEntry1_c(), this._TitleWindowSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5021162;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 2514839;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._TitleWindowSkin_LinearGradientStroke2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_LinearGradientStroke2_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._TitleWindowSkin_GradientEntry3_c(), this._TitleWindowSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 7385327;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5275563;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Rect4_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 4;
            _loc_1.right = 4;
            _loc_1.top = 4;
            _loc_1.bottom = 4;
            _loc_1.stroke = this._TitleWindowSkin_LinearGradientStroke3_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_LinearGradientStroke3_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._TitleWindowSkin_GradientEntry5_c(), this._TitleWindowSkin_GradientEntry6_c()];
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry5_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 7319790;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_GradientEntry6_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5275820;
            return _loc_1;
        }// end function

        private function _TitleWindowSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 20;
            _loc_1.height = 20;
            _loc_1.top = -7;
            _loc_1.right = -7;
            _loc_1.id = "closeButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.closeButton = _loc_1;
            BindingManager.executeBindings(this, "closeButton", this.closeButton);
            return _loc_1;
        }// end function

        public function get closeButton() : Button
        {
            return this._312699062closeButton;
        }// end function

        public function set closeButton(param1:Button) : void
        {
            var _loc_2:* = this._312699062closeButton;
            if (_loc_2 !== param1)
            {
                this._312699062closeButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeButton", _loc_2, param1));
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

        public function get moveArea() : Group
        {
            return this._104976386moveArea;
        }// end function

        public function set moveArea(param1:Group) : void
        {
            var _loc_2:* = this._104976386moveArea;
            if (_loc_2 !== param1)
            {
                this._104976386moveArea = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveArea", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TitleWindow
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TitleWindow) : void
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
