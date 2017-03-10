package com.tinychat.ui.skins.gotham.components.spark
{
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.effects.animation.*;
    import spark.primitives.*;

    public class ThumblessHSliderSkin extends Skin implements IBindingClient, IStateClient2
    {
        private var _711999985indicator:Rect;
        private var _110621003track:Button;
        private var _240937267widthAnimator:Animate;
        private var _647768223widthMotionPath:SimpleMotionPath;
        private var __moduleFactoryInitialized:Boolean = false;
        private var animate:Boolean = true;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:ThumblessHSlider;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function ThumblessHSliderSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._ThumblessHSliderSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_spark_ThumblessHSliderSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return [param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.minWidth = 58;
            this.minHeight = 9;
            this.mxmlContent = [this._ThumblessHSliderSkin_Button1_i(), this._ThumblessHSliderSkin_Rect1_i(), this._ThumblessHSliderSkin_Rect2_c()];
            this.currentState = "disabled";
            this._ThumblessHSliderSkin_Animate1_i();
            this.addEventListener("creationComplete", this.___ThumblessHSliderSkin_Skin1_creationComplete);
            states = [new State({name:"disabled", overrides:[]}), new State({name:"normal", overrides:[]})];
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
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
            super.updateDisplayList(param1, param2);
            this.updateIndicatorSize();
            return;
        }// end function

        private function creationCompleteHandler() : void
        {
            this.hostComponent.setStyle("liveDragging", true);
            this.hostComponent.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler, false, 0, true);
            this.hostComponent.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler, false, 0, true);
            this.hostComponent.addEventListener(FlexEvent.VALUE_COMMIT, this.valueCommitHandler, false, 0, true);
            return;
        }// end function

        private function valueCommitHandler(event:FlexEvent) : void
        {
            if (this.animate)
            {
                this.widthMotionPath.valueFrom = this.getIndicatorWidth(this.indicatorValue);
                this.widthMotionPath.valueTo = this.getIndicatorWidth(this.hostComponent.value);
                this.widthAnimator.play();
            }
            else
            {
                this.updateIndicatorSize();
            }
            return;
        }// end function

        private function updateIndicatorSize() : void
        {
            this.indicator.width = this.getIndicatorWidth(this.hostComponent.value);
            return;
        }// end function

        private function mouseDownHandler(event:MouseEvent) : void
        {
            this.hostComponent.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            return;
        }// end function

        private function mouseUpHandler(event:MouseEvent) : void
        {
            this.hostComponent.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            this.animate = true;
            return;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            this.animate = false;
            this.hostComponent.removeEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
            return;
        }// end function

        private function get animate1() : Boolean
        {
            return Math.abs(this.indicatorValue - this.hostComponent.value) > this.valueRange / 50;
        }// end function

        private function get indicatorValue() : Number
        {
            return this.indicator.width / this.indicatorMaxWidth * this.valueRange;
        }// end function

        private function getIndicatorWidth(param1:Number) : Number
        {
            return this.indicatorMaxWidth * (param1 / this.valueRange);
        }// end function

        private function get indicatorMaxWidth() : Number
        {
            return width - 2;
        }// end function

        private function get valueRange() : Number
        {
            return this.hostComponent.maximum - this.hostComponent.minimum;
        }// end function

        private function _ThumblessHSliderSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            _loc_1.duration = 150;
            new Vector.<MotionPath>(1)[0] = this._ThumblessHSliderSkin_SimpleMotionPath1_i();
            _loc_1.motionPaths = new Vector.<MotionPath>(1);
            this.widthAnimator = _loc_1;
            BindingManager.executeBindings(this, "widthAnimator", this.widthAnimator);
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_SimpleMotionPath1_i() : SimpleMotionPath
        {
            var _loc_1:* = new SimpleMotionPath();
            _loc_1.property = "width";
            this.widthMotionPath = _loc_1;
            BindingManager.executeBindings(this, "widthMotionPath", this.widthMotionPath);
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "track";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.track = _loc_1;
            BindingManager.executeBindings(this, "track", this.track);
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 4;
            _loc_1.fill = this._ThumblessHSliderSkin_LinearGradient1_c();
            _loc_1.initialized(this, "indicator");
            this.indicator = _loc_1;
            BindingManager.executeBindings(this, "indicator", this.indicator);
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._ThumblessHSliderSkin_GradientEntry1_c(), this._ThumblessHSliderSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16382457;
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12698049;
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.stroke = this._ThumblessHSliderSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ThumblessHSliderSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        public function ___ThumblessHSliderSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.creationCompleteHandler();
            return;
        }// end function

        private function _ThumblessHSliderSkin_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "widthAnimator.target", "indicator");
            return _loc_1;
        }// end function

        public function get indicator() : Rect
        {
            return this._711999985indicator;
        }// end function

        public function set indicator(param1:Rect) : void
        {
            var _loc_2:* = this._711999985indicator;
            if (_loc_2 !== param1)
            {
                this._711999985indicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "indicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get track() : Button
        {
            return this._110621003track;
        }// end function

        public function set track(param1:Button) : void
        {
            var _loc_2:* = this._110621003track;
            if (_loc_2 !== param1)
            {
                this._110621003track = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "track", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get widthAnimator() : Animate
        {
            return this._240937267widthAnimator;
        }// end function

        public function set widthAnimator(param1:Animate) : void
        {
            var _loc_2:* = this._240937267widthAnimator;
            if (_loc_2 !== param1)
            {
                this._240937267widthAnimator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "widthAnimator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get widthMotionPath() : SimpleMotionPath
        {
            return this._647768223widthMotionPath;
        }// end function

        public function set widthMotionPath(param1:SimpleMotionPath) : void
        {
            var _loc_2:* = this._647768223widthMotionPath;
            if (_loc_2 !== param1)
            {
                this._647768223widthMotionPath = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "widthMotionPath", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ThumblessHSlider
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ThumblessHSlider) : void
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

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
