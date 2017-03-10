package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.ui.components.sound.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.primitives.*;

    public class VolumeUserPopupMenuItemRenderer extends AdvancedItemRenderer implements IStateClient2
    {
        public var _VolumeUserPopupMenuItemRenderer_Line1:Line;
        private var _1287124693backgroundColor:SolidColor;
        private var _1427430450backgroundRect:Rect;
        private var _1969341667volumeControl:VolumeControl;
        private var _1605404600volumeDisplay:Label;
        private var __moduleFactoryInitialized:Boolean = false;

        public function VolumeUserPopupMenuItemRenderer()
        {
            mx_internal::_document = this;
            this.autoDrawBackground = false;
            this.mxmlContent = [this._VolumeUserPopupMenuItemRenderer_Rect1_i(), this._VolumeUserPopupMenuItemRenderer_VolumeControl1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._VolumeUserPopupMenuItemRenderer_Label1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._VolumeUserPopupMenuItemRenderer_Label2_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._VolumeUserPopupMenuItemRenderer_Line1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["backgroundRect"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["backgroundRect"]})]}), new State({name:"hovered", overrides:[new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["backgroundRect"]}), new SetProperty().initializeFromObject({target:"backgroundColor", name:"color", value:15858942})]})];
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

        private function updateLabelDisplay() : void
        {
            labelDisplay.text = label;
            return;
        }// end function

        private function updateVolumeDisplay() : void
        {
            if (this.volumeDisplay)
            {
                this.volumeDisplay.text = Math.round(this.volumeControl.value * 100).toString() + "%";
            }
            return;
        }// end function

        override protected function mouseDownHandler(event:MouseEvent) : void
        {
            event.stopImmediatePropagation();
            event.preventDefault();
            return;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._VolumeUserPopupMenuItemRenderer_SolidColor1_i();
            _loc_1.initialized(this, "backgroundRect");
            this.backgroundRect = _loc_1;
            BindingManager.executeBindings(this, "backgroundRect", this.backgroundRect);
            return _loc_1;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            this.backgroundColor = _loc_1;
            BindingManager.executeBindings(this, "backgroundColor", this.backgroundColor);
            return _loc_1;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 0;
            _loc_1.stroke = this._VolumeUserPopupMenuItemRenderer_SolidColorStroke1_c();
            _loc_1.initialized(this, "_VolumeUserPopupMenuItemRenderer_Line1");
            this._VolumeUserPopupMenuItemRenderer_Line1 = _loc_1;
            BindingManager.executeBindings(this, "_VolumeUserPopupMenuItemRenderer_Line1", this._VolumeUserPopupMenuItemRenderer_Line1);
            return _loc_1;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13429231;
            _loc_1.weight = 1;
            _loc_1.caps = "square";
            return _loc_1;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("paddingLeft", 25);
            _loc_1.setStyle("paddingRight", 45);
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

        private function _VolumeUserPopupMenuItemRenderer_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.width = 35;
            _loc_1.right = 5;
            _loc_1.verticalCenter = 2;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.addEventListener("addedToStage", this.__volumeDisplay_addedToStage);
            _loc_1.id = "volumeDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.volumeDisplay = _loc_1;
            BindingManager.executeBindings(this, "volumeDisplay", this.volumeDisplay);
            return _loc_1;
        }// end function

        public function __volumeDisplay_addedToStage(event:Event) : void
        {
            this.updateVolumeDisplay();
            return;
        }// end function

        private function _VolumeUserPopupMenuItemRenderer_VolumeControl1_i() : VolumeControl
        {
            var _loc_1:* = new VolumeControl();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.setStyle("skinClass", VolumeControlSkin);
            _loc_1.addEventListener("valueCommit", this.__volumeControl_valueCommit);
            _loc_1.id = "volumeControl";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.volumeControl = _loc_1;
            BindingManager.executeBindings(this, "volumeControl", this.volumeControl);
            return _loc_1;
        }// end function

        public function __volumeControl_valueCommit(event:FlexEvent) : void
        {
            this.updateVolumeDisplay();
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

        public function get volumeControl() : VolumeControl
        {
            return this._1969341667volumeControl;
        }// end function

        public function set volumeControl(param1:VolumeControl) : void
        {
            var _loc_2:* = this._1969341667volumeControl;
            if (_loc_2 !== param1)
            {
                this._1969341667volumeControl = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeControl", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get volumeDisplay() : Label
        {
            return this._1605404600volumeDisplay;
        }// end function

        public function set volumeDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1605404600volumeDisplay;
            if (_loc_2 !== param1)
            {
                this._1605404600volumeDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

    }
}
