package com.tinychat.ui.skins.gotham.components.media
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class MediaSearchButtonSkin extends Skin implements IBindingClient, IStateClient2
    {
        private var _1919293257iconDisplay2:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:IconButton;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function MediaSearchButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._MediaSearchButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_media_MediaSearchButtonSkinWatcherSetupUtil");
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
            this.minWidth = 21;
            this.minHeight = 21;
            this.mxmlContent = [this._MediaSearchButtonSkin_Rect1_c(), this._MediaSearchButtonSkin_VectorImage1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[]}), new State({name:"down", overrides:[]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _MediaSearchButtonSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._MediaSearchButtonSkin_SolidColorStroke1_c();
            _loc_1.fill = this._MediaSearchButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 13684944;
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._MediaSearchButtonSkin_GradientEntry1_c(), this._MediaSearchButtonSkin_GradientEntry2_c(), this._MediaSearchButtonSkin_GradientEntry3_c(), this._MediaSearchButtonSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16119285;
            _loc_1.ratio = 0;
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16119285;
            _loc_1.ratio = 0.49;
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15724527;
            _loc_1.ratio = 0.5;
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15724527;
            _loc_1.ratio = 1;
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 11;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "iconDisplay2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.iconDisplay2 = _loc_1;
            BindingManager.executeBindings(this, "iconDisplay2", this.iconDisplay2);
            return _loc_1;
        }// end function

        private function _MediaSearchButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return SearchIcon;
            }// end function
            , null, "iconDisplay2.source");
            return result;
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
