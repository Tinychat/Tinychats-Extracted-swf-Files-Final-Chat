package com.tinychat.ui.skins.gotham.components.video.controls
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
    import spark.effects.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class VideoControlButtonSkin extends SparkSkin implements IBindingClient, IStateClient2
    {
        public var _VideoControlButtonSkin_AnimateColor1:AnimateColor;
        private var _1383304148border:Rect;
        private var _410956671container:HGroup;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _1919293257iconDisplay2:VectorImage;
        private var _1949061436labelDisplay2:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var lastWidth:Number = NaN;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconButton;
        private static const exclusions:Array = ["iconDisplay2", "border", "labelDisplay2"];
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function VideoControlButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._VideoControlButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_video_controls_VideoControlButtonSkinWatcherSetupUtil");
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
            this.minWidth = 20;
            this.minHeight = 20;
            this.transitions = [this._VideoControlButtonSkin_Transition1_c()];
            this.mxmlContent = [this._VideoControlButtonSkin_Rect1_c(), this._VideoControlButtonSkin_Rect2_i(), this._VideoControlButtonSkin_HGroup1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:10790052}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:9211020})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"ge1", name:"color", value:9276813}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:10066329})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function test(event:Event) : void
        {
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_4:Number = NaN;
            super.updateDisplayList(param1, param2);
            var _loc_3:* = this.lastWidth != this.container.width;
            if (_loc_3)
            {
                this.longestIconDisplaySideLength = this.labelDisplay2.height ? (this.labelDisplay2.height) : (this.labelDisplay2.getStyle("fontSize") + 4);
                this.labelDisplay2.includeInLayout = true;
                this.labelDisplay2.setLayoutBoundsSize(NaN, NaN);
                this.labelDisplay2.invalidateSize();
                this.labelDisplay2.validateSize(true);
                this.container.invalidateDisplayList();
                this.container.validateDisplayList();
                this.labelDisplay2.invalidateDisplayList();
                this.labelDisplay2.validateDisplayList();
            }
            this.labelDisplay2.visible = this.showLabelDisplay;
            this.labelDisplay2.includeInLayout = this.showLabelDisplay;
            if (!this.showLabelDisplay)
            {
                this.iconDisplay2.height = NaN;
                _loc_4 = param1 > param2 ? (param2) : (param1);
                this.longestIconDisplaySideLength = _loc_4 * 0.54;
            }
            this.lastWidth = this.container.width;
            return;
        }// end function

        private function set longestIconDisplaySideLength(param1:Number) : void
        {
            if (this.iconDisplay2.sourceWidth > this.iconDisplay2.sourceHeight)
            {
                this.iconDisplay2.width = Math.ceil(param1);
            }
            else
            {
                this.iconDisplay2.height = Math.ceil(param1);
            }
            return;
        }// end function

        private function updateIconDisplaySize() : void
        {
            var _loc_1:Number = NaN;
            return;
        }// end function

        private function get showLabelDisplay() : Boolean
        {
            if (this.labelDisplay2.text != "")
            {
            }
            if (!this.labelDisplay2.isTruncated)
            {
            }
            if (this.labelDisplay2.width > 6)
            {
            }
            return this.labelDisplay2.width < width;
        }// end function

        private function _VideoControlButtonSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.effect = this._VideoControlButtonSkin_AnimateColor1_i();
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._VideoControlButtonSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_VideoControlButtonSkin_AnimateColor1", this._VideoControlButtonSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.fill = this._VideoControlButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._VideoControlButtonSkin_GradientEntry1_i(), this._VideoControlButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 6710886;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 7500402;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.stroke = this._VideoControlButtonSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 6250335;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 8;
            _loc_1.right = 8;
            _loc_1.top = 8;
            _loc_1.bottom = 8;
            _loc_1.gap = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.horizontalAlign = "center";
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._VideoControlButtonSkin_VectorImage1_i(), this._VideoControlButtonSkin_Label1_i()];
            _loc_1.id = "container";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.container = _loc_1;
            BindingManager.executeBindings(this, "container", this.container);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.showTruncationTip = false;
            _loc_1.setStyle("color", 16777215);
            _loc_1.id = "labelDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay2", this.labelDisplay2);
            return _loc_1;
        }// end function

        private function _VideoControlButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_VideoControlButtonSkin_AnimateColor1.targets");
            return result;
        }// end function

        public function get border() : Rect
        {
            return this._1383304148border;
        }// end function

        public function set border(param1:Rect) : void
        {
            var _loc_2:* = this._1383304148border;
            if (_loc_2 !== param1)
            {
                this._1383304148border = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "border", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get container() : HGroup
        {
            return this._410956671container;
        }// end function

        public function set container(param1:HGroup) : void
        {
            var _loc_2:* = this._410956671container;
            if (_loc_2 !== param1)
            {
                this._410956671container = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "container", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge1() : GradientEntry
        {
            return this._102163ge1;
        }// end function

        public function set ge1(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102163ge1;
            if (_loc_2 !== param1)
            {
                this._102163ge1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get ge2() : GradientEntry
        {
            return this._102164ge2;
        }// end function

        public function set ge2(param1:GradientEntry) : void
        {
            var _loc_2:* = this._102164ge2;
            if (_loc_2 !== param1)
            {
                this._102164ge2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ge2", _loc_2, param1));
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

        public function get labelDisplay2() : Label
        {
            return this._1949061436labelDisplay2;
        }// end function

        public function set labelDisplay2(param1:Label) : void
        {
            var _loc_2:* = this._1949061436labelDisplay2;
            if (_loc_2 !== param1)
            {
                this._1949061436labelDisplay2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : IconButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:IconButton) : void
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
