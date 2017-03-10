package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.tinychat.ui.components.sound.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.primitives.*;

    public class ApplicationVolumeControlSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _ApplicationVolumeControlSkin_AnimateColor1:AnimateColor;
        public var _ApplicationVolumeControlSkin_AnimateColor2:AnimateColor;
        public var _ApplicationVolumeControlSkin_Fade1:Fade;
        public var _ApplicationVolumeControlSkin_Fade2:Fade;
        private var _1834500434_ApplicationVolumeControlSkin_Transition3:Transition;
        private var _1834500433_ApplicationVolumeControlSkin_Transition4:Transition;
        private var _102163ge1:GradientEntry;
        private var _102164ge2:GradientEntry;
        private var _3321844line:SolidColorStroke;
        private var _783330987muteButton:MuteButton;
        private var _106852524popup:Group;
        private var _1698099045volumeSlider:VerticalVolumeSlider;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:VolumeControl;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function ApplicationVolumeControlSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._ApplicationVolumeControlSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_ApplicationVolumeControlSkinWatcherSetupUtil");
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
            this.transitions = [this._ApplicationVolumeControlSkin_Transition1_c(), this._ApplicationVolumeControlSkin_Transition2_c(), this._ApplicationVolumeControlSkin_Transition3_i(), this._ApplicationVolumeControlSkin_Transition4_i()];
            this.mxmlContent = [this._ApplicationVolumeControlSkin_MuteButton1_i()];
            this.currentState = "normal";
            var _ApplicationVolumeControlSkin_Group1_factory:* = new DeferredInstanceFromFunction(this._ApplicationVolumeControlSkin_Group1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"over", overrides:[new AddItems().initializeFromObject({itemsFactory:_ApplicationVolumeControlSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["muteButton"]}), new SetProperty().initializeFromObject({target:"_ApplicationVolumeControlSkin_Transition3", name:"autoReverse", value:true}), new SetProperty().initializeFromObject({target:"_ApplicationVolumeControlSkin_Transition4", name:"autoReverse", value:true})]}), new State({name:"down", overrides:[new AddItems().initializeFromObject({itemsFactory:_ApplicationVolumeControlSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["muteButton"]}), new SetProperty().initializeFromObject({target:"ge1", name:"color", value:16645629}), new SetProperty().initializeFromObject({target:"ge2", name:"color", value:15132390}), new SetProperty().initializeFromObject({target:"line", name:"color", value:15132390})]})];
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

        private function _ApplicationVolumeControlSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "normal";
            _loc_1.toState = "over";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._ApplicationVolumeControlSkin_Fade1_i();
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Fade1_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 300;
            this._ApplicationVolumeControlSkin_Fade1 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_Fade1", this._ApplicationVolumeControlSkin_Fade1);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "over";
            _loc_1.toState = "normal";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._ApplicationVolumeControlSkin_Fade2_i();
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Fade2_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 300;
            this._ApplicationVolumeControlSkin_Fade2 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_Fade2", this._ApplicationVolumeControlSkin_Fade2);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Transition3_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "over";
            _loc_1.toState = "down";
            _loc_1.autoReverse = false;
            _loc_1.effect = this._ApplicationVolumeControlSkin_AnimateColor1_i();
            this._ApplicationVolumeControlSkin_Transition3 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_Transition3", this._ApplicationVolumeControlSkin_Transition3);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_AnimateColor1_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._ApplicationVolumeControlSkin_AnimateColor1 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_AnimateColor1", this._ApplicationVolumeControlSkin_AnimateColor1);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Transition4_i() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "down";
            _loc_1.toState = "over";
            _loc_1.autoReverse = false;
            _loc_1.effect = this._ApplicationVolumeControlSkin_AnimateColor2_i();
            this._ApplicationVolumeControlSkin_Transition4 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_Transition4", this._ApplicationVolumeControlSkin_Transition4);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_AnimateColor2_i() : AnimateColor
        {
            var _loc_1:* = new AnimateColor();
            _loc_1.duration = 250;
            this._ApplicationVolumeControlSkin_AnimateColor2 = _loc_1;
            BindingManager.executeBindings(this, "_ApplicationVolumeControlSkin_AnimateColor2", this._ApplicationVolumeControlSkin_AnimateColor2);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_MuteButton1_i() : MuteButton
        {
            var _loc_1:* = new MuteButton();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.styleName = "muteButton";
            _loc_1.id = "muteButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.muteButton = _loc_1;
            BindingManager.executeBindings(this, "muteButton", this.muteButton);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = -1;
            _loc_1.right = -1;
            _loc_1.y = 0;
            _loc_1.top = -100;
            _loc_1.height = 100;
            _loc_1.minHeight = 22;
            _loc_1.mxmlContent = [this._ApplicationVolumeControlSkin_Rect1_c(), this._ApplicationVolumeControlSkin_VerticalVolumeSlider1_i(), this._ApplicationVolumeControlSkin_Line1_c()];
            _loc_1.id = "popup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.popup = _loc_1;
            BindingManager.executeBindings(this, "popup", this.popup);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = -3;
            _loc_1.topLeftRadiusX = 4;
            _loc_1.topRightRadiusX = 4;
            _loc_1.stroke = this._ApplicationVolumeControlSkin_SolidColorStroke1_c();
            _loc_1.fill = this._ApplicationVolumeControlSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12237498;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._ApplicationVolumeControlSkin_GradientEntry1_i(), this._ApplicationVolumeControlSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16777215;
            this.ge1 = _loc_1;
            BindingManager.executeBindings(this, "ge1", this.ge1);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16514043;
            this.ge2 = _loc_1;
            BindingManager.executeBindings(this, "ge2", this.ge2);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_VerticalVolumeSlider1_i() : VerticalVolumeSlider
        {
            var _loc_1:* = new VerticalVolumeSlider();
            _loc_1.width = 9;
            _loc_1.top = 10;
            _loc_1.bottom = 10;
            _loc_1.horizontalCenter = 0;
            _loc_1.id = "volumeSlider";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.volumeSlider = _loc_1;
            BindingManager.executeBindings(this, "volumeSlider", this.volumeSlider);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.bottom = -3;
            _loc_1.stroke = this._ApplicationVolumeControlSkin_SolidColorStroke2_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_SolidColorStroke2_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 16514043;
            _loc_1.weight = 3;
            _loc_1.caps = "square";
            this.line = _loc_1;
            BindingManager.executeBindings(this, "line", this.line);
            return _loc_1;
        }// end function

        private function _ApplicationVolumeControlSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, null, null, "_ApplicationVolumeControlSkin_Fade1.target", "popup");
            result[1] = new Binding(this, null, null, "_ApplicationVolumeControlSkin_Fade2.target", "popup");
            result[2] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, line];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_ApplicationVolumeControlSkin_AnimateColor1.targets");
            result[3] = new Binding(this, function () : Array
            {
                var _loc_1:* = [ge1, ge2, line];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_ApplicationVolumeControlSkin_AnimateColor2.targets");
            return result;
        }// end function

        public function get _ApplicationVolumeControlSkin_Transition3() : Transition
        {
            return this._1834500434_ApplicationVolumeControlSkin_Transition3;
        }// end function

        public function set _ApplicationVolumeControlSkin_Transition3(param1:Transition) : void
        {
            var _loc_2:* = this._1834500434_ApplicationVolumeControlSkin_Transition3;
            if (_loc_2 !== param1)
            {
                this._1834500434_ApplicationVolumeControlSkin_Transition3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ApplicationVolumeControlSkin_Transition3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _ApplicationVolumeControlSkin_Transition4() : Transition
        {
            return this._1834500433_ApplicationVolumeControlSkin_Transition4;
        }// end function

        public function set _ApplicationVolumeControlSkin_Transition4(param1:Transition) : void
        {
            var _loc_2:* = this._1834500433_ApplicationVolumeControlSkin_Transition4;
            if (_loc_2 !== param1)
            {
                this._1834500433_ApplicationVolumeControlSkin_Transition4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_ApplicationVolumeControlSkin_Transition4", _loc_2, param1));
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

        public function get line() : SolidColorStroke
        {
            return this._3321844line;
        }// end function

        public function set line(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._3321844line;
            if (_loc_2 !== param1)
            {
                this._3321844line = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "line", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get muteButton() : MuteButton
        {
            return this._783330987muteButton;
        }// end function

        public function set muteButton(param1:MuteButton) : void
        {
            var _loc_2:* = this._783330987muteButton;
            if (_loc_2 !== param1)
            {
                this._783330987muteButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "muteButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get popup() : Group
        {
            return this._106852524popup;
        }// end function

        public function set popup(param1:Group) : void
        {
            var _loc_2:* = this._106852524popup;
            if (_loc_2 !== param1)
            {
                this._106852524popup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get volumeSlider() : VerticalVolumeSlider
        {
            return this._1698099045volumeSlider;
        }// end function

        public function set volumeSlider(param1:VerticalVolumeSlider) : void
        {
            var _loc_2:* = this._1698099045volumeSlider;
            if (_loc_2 !== param1)
            {
                this._1698099045volumeSlider = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeSlider", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VolumeControl
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VolumeControl) : void
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
