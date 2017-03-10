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

    public class CheckBoxSkin extends Skin implements IStateClient2
    {
        private var _1997401138_CheckBoxSkin_Group1:Group;
        public var _CheckBoxSkin_Path1:Path;
        public var _CheckBoxSkin_Path2:Path;
        public var _CheckBoxSkin_Rect1:Rect;
        private var _1184053038labelDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:CheckBox;

        public function CheckBoxSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._CheckBoxSkin_Group1_i(), this._CheckBoxSkin_Label1_i()];
            this.currentState = "up";
            var _loc_1:* = new DeferredInstanceFromFunction(this._CheckBoxSkin_Path1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._CheckBoxSkin_Path2_i);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[]}), new State({name:"down", stateGroups:["downStates"], overrides:[]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]}), new State({name:"upAndSelected", stateGroups:["selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_CheckBoxSkin_Group1", propertyName:"mxmlContent", position:"after", relativeTo:["_CheckBoxSkin_Rect1"]}), new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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
            if (this.labelDisplay.text == "")
            {
                measuredWidth = 14;
                measuredHeight = 13;
                measuredMinWidth = measuredWidth;
                measuredMinHeight = measuredHeight;
            }
            else
            {
                super.measure();
            }
            return;
        }// end function

        private function _CheckBoxSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.width = 13;
            _loc_1.height = 13;
            _loc_1.left = 1;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._CheckBoxSkin_Rect1_i(), this._CheckBoxSkin_Rect2_c(), this._CheckBoxSkin_Rect3_c()];
            _loc_1.id = "_CheckBoxSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._CheckBoxSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_CheckBoxSkin_Group1", this._CheckBoxSkin_Group1);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._CheckBoxSkin_LinearGradient1_c();
            _loc_1.initialized(this, "_CheckBoxSkin_Rect1");
            this._CheckBoxSkin_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_CheckBoxSkin_Rect1", this._CheckBoxSkin_Rect1);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._CheckBoxSkin_GradientEntry1_c(), this._CheckBoxSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 13816530;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16185078;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Path1_i() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.data = "M 0 6 l 2 3 l 5 -7";
            _loc_1.horizontalCenter = 0;
            _loc_1.stroke = this._CheckBoxSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, "_CheckBoxSkin_Path1");
            this._CheckBoxSkin_Path1 = _loc_1;
            BindingManager.executeBindings(this, "_CheckBoxSkin_Path1", this._CheckBoxSkin_Path1);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 3570882;
            _loc_1.weight = 3;
            _loc_1.caps = "square";
            _loc_1.joints = "miter";
            _loc_1.pixelHinting = true;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Path2_i() : Path
        {
            var _loc_1:* = new Path();
            _loc_1.data = "M 0 6 l 2 3 l 5 -7";
            _loc_1.horizontalCenter = 0;
            _loc_1.stroke = this._CheckBoxSkin_SolidColorStroke2_c();
            _loc_1.initialized(this, "_CheckBoxSkin_Path2");
            this._CheckBoxSkin_Path2 = _loc_1;
            BindingManager.executeBindings(this, "_CheckBoxSkin_Path2", this._CheckBoxSkin_Path2);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 5213902;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            _loc_1.joints = "miter";
            _loc_1.pixelHinting = true;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.stroke = this._CheckBoxSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._CheckBoxSkin_GradientEntry3_c(), this._CheckBoxSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15658734;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16645629;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._CheckBoxSkin_LinearGradientStroke2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_LinearGradientStroke2_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._CheckBoxSkin_GradientEntry5_c(), this._CheckBoxSkin_GradientEntry6_c()];
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry5_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12830394;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_GradientEntry6_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12961467;
            return _loc_1;
        }// end function

        private function _CheckBoxSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 20;
            _loc_1.right = 0;
            _loc_1.top = 3;
            _loc_1.bottom = 3;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("textAlign", "start");
            _loc_1.setStyle("verticalAlign", "middle");
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        public function get _CheckBoxSkin_Group1() : Group
        {
            return this._1997401138_CheckBoxSkin_Group1;
        }// end function

        public function set _CheckBoxSkin_Group1(param1:Group) : void
        {
            var _loc_2:* = this._1997401138_CheckBoxSkin_Group1;
            if (_loc_2 !== param1)
            {
                this._1997401138_CheckBoxSkin_Group1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_CheckBoxSkin_Group1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get labelDisplay() : Label
        {
            return this._1184053038labelDisplay;
        }// end function

        public function set labelDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1184053038labelDisplay;
            if (_loc_2 !== param1)
            {
                this._1184053038labelDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : CheckBox
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:CheckBox) : void
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
