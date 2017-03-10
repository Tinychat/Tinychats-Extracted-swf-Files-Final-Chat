package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import flash.events.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.formatters.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;

    public class DurationPopupMenuItemRenderer extends AdvancedItemRenderer implements IStateClient2
    {
        public var _DurationPopupMenuItemRenderer_Line1:Line;
        private var _1287124693backgroundColor:SolidColor;
        private var _1427430450backgroundRect:Rect;
        private var _775506802durationDisplay:Label;
        private var _285854827durationSlider:HorizontalDurationSlider;
        private var _1919293257iconDisplay2:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var durationFormatter:DateFormatter;
        private var currentTime:Date;
        private var duration:Date;
        private var dateTimezoneOffset:Number;

        public function DurationPopupMenuItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.mxmlContent = [this._DurationPopupMenuItemRenderer_Rect1_i(), this._DurationPopupMenuItemRenderer_VectorImage1_i(), this._DurationPopupMenuItemRenderer_HorizontalDurationSlider1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._DurationPopupMenuItemRenderer_Label1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._DurationPopupMenuItemRenderer_Label2_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._DurationPopupMenuItemRenderer_Line1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["durationSlider"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["iconDisplay2"]}), new SetProperty().initializeFromObject({target:"durationSlider", name:"visible", value:false})]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["backgroundRect"]}), new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]})];
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

        override public function set itemIndex(param1:int) : void
        {
            super.itemIndex = param1;
            var _loc_2:* = owner as PopupList;
            var _loc_3:Number = 0;
            if (_loc_2)
            {
            }
            if ((_loc_2.dataProvider.length - 1) == param1)
            {
                _loc_3 = 4;
            }
            else
            {
                _loc_3 = 0;
            }
            this.backgroundRect.bottomLeftRadiusX = _loc_3;
            this.backgroundRect.bottomRightRadiusX = _loc_3;
            return;
        }// end function

        override protected function mouseDownHandler(event:MouseEvent) : void
        {
            event.stopImmediatePropagation();
            event.preventDefault();
            return;
        }// end function

        private function updateLabelDisplay() : void
        {
            labelDisplay.text = label;
            return;
        }// end function

        private function updateDurationDisplay() : void
        {
            if (this.durationDisplay)
            {
                if (!this.durationFormatter)
                {
                    this.durationFormatter = new DateFormatter();
                }
                if (!this.currentTime)
                {
                    this.currentTime = new Date(0);
                    this.currentTime.setHours(0);
                    this.dateTimezoneOffset = this.currentTime.time;
                }
                if (!this.duration)
                {
                    this.duration = new Date(this.dateTimezoneOffset);
                }
                this.currentTime.time = this.dateTimezoneOffset + this.durationSlider.value;
                this.duration.time = this.dateTimezoneOffset + this.durationSlider.maximum;
                if (this.duration.hours > 0)
                {
                    this.durationFormatter.formatString = "J:NN:SS";
                }
                else
                {
                    this.durationFormatter.formatString = "N:SS";
                }
                this.durationDisplay.text = this.durationFormatter.format(this.currentTime) + " / " + this.durationFormatter.format(this.duration);
            }
            return;
        }// end function

        private function _DurationPopupMenuItemRenderer_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._DurationPopupMenuItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, "backgroundRect");
            this.backgroundRect = _loc_1;
            BindingManager.executeBindings(this, "backgroundRect", this.backgroundRect);
            return _loc_1;
        }// end function

        private function _DurationPopupMenuItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _DurationPopupMenuItemRenderer_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.stroke = this._DurationPopupMenuItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, "_DurationPopupMenuItemRenderer_Line1");
            this._DurationPopupMenuItemRenderer_Line1 = _loc_1;
            BindingManager.executeBindings(this, "_DurationPopupMenuItemRenderer_Line1", this._DurationPopupMenuItemRenderer_Line1);
            return _loc_1;
        }// end function

        private function _DurationPopupMenuItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _DurationPopupMenuItemRenderer_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 6;
            _loc_1.width = 12;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("tintColor", 11449270);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _DurationPopupMenuItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.left = 25;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.addEventListener("addedToStage", this.__labelDisplay_addedToStage);
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", labelDisplay);
            return _loc_1;
        }// end function

        public function __labelDisplay_addedToStage(event:Event) : void
        {
            this.updateLabelDisplay();
            return;
        }// end function

        private function _DurationPopupMenuItemRenderer_HorizontalDurationSlider1_i() : HorizontalDurationSlider
        {
            var _loc_1:* = new HorizontalDurationSlider();
            _loc_1.percentWidth = 100;
            _loc_1.left = 25;
            _loc_1.right = 6;
            _loc_1.verticalCenter = 0;
            _loc_1.visible = true;
            _loc_1.addEventListener("valueCommit", this.__durationSlider_valueCommit);
            _loc_1.id = "durationSlider";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.durationSlider = _loc_1;
            BindingManager.executeBindings(this, "durationSlider", this.durationSlider);
            return _loc_1;
        }// end function

        public function __durationSlider_valueCommit(event:FlexEvent) : void
        {
            this.updateDurationDisplay();
            return;
        }// end function

        private function _DurationPopupMenuItemRenderer_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.right = 6;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("fontSize", 10);
            _loc_1.addEventListener("addedToStage", this.__durationDisplay_addedToStage);
            _loc_1.id = "durationDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.durationDisplay = _loc_1;
            BindingManager.executeBindings(this, "durationDisplay", this.durationDisplay);
            return _loc_1;
        }// end function

        public function __durationDisplay_addedToStage(event:Event) : void
        {
            this.updateDurationDisplay();
            return;
        }// end function

        public function get backgroundColor() : SolidColor
        {
            return this._1287124693backgroundColor;
        }// end function

        public function set backgroundColor(param1:SolidColor) : void
        {
            var _loc_2:* = this._1287124693backgroundColor;
            if (_loc_2 !== param1)
            {
                this._1287124693backgroundColor = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get backgroundRect() : Rect
        {
            return this._1427430450backgroundRect;
        }// end function

        public function set backgroundRect(param1:Rect) : void
        {
            var _loc_2:* = this._1427430450backgroundRect;
            if (_loc_2 !== param1)
            {
                this._1427430450backgroundRect = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundRect", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get durationDisplay() : Label
        {
            return this._775506802durationDisplay;
        }// end function

        public function set durationDisplay(param1:Label) : void
        {
            var _loc_2:* = this._775506802durationDisplay;
            if (_loc_2 !== param1)
            {
                this._775506802durationDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "durationDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get durationSlider() : HorizontalDurationSlider
        {
            return this._285854827durationSlider;
        }// end function

        public function set durationSlider(param1:HorizontalDurationSlider) : void
        {
            var _loc_2:* = this._285854827durationSlider;
            if (_loc_2 !== param1)
            {
                this._285854827durationSlider = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "durationSlider", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get iconDisplay2() : VectorImage
        {
            return this._1919293257iconDisplay2;
        }// end function

        public function set iconDisplay2(param1:VectorImage) : void
        {
            var _loc_2:* = this._1919293257iconDisplay2;
            if (_loc_2 !== param1)
            {
                this._1919293257iconDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
