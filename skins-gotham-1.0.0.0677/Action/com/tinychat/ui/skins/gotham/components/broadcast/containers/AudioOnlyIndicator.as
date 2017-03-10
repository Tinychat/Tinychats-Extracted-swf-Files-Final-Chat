package com.tinychat.ui.skins.gotham.components.broadcast.containers
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.primitives.*;

    public class AudioOnlyIndicator extends Group implements IBindingClient
    {
        public var _AudioOnlyIndicator_VectorImage1:VectorImage;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function AudioOnlyIndicator()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._AudioOnlyIndicator_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_containers_AudioOnlyIndicatorWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return AudioOnlyIndicator[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mxmlContent = [this._AudioOnlyIndicator_Rect1_c(), this._AudioOnlyIndicator_VectorImage1_i()];
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

        private function _AudioOnlyIndicator_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._AudioOnlyIndicator_SolidColorStroke1_c();
            _loc_1.fill = this._AudioOnlyIndicator_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _AudioOnlyIndicator_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 263698;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _AudioOnlyIndicator_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 1644825;
            return _loc_1;
        }// end function

        private function _AudioOnlyIndicator_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.maxHeight = 100;
            _loc_1.top = 10;
            _loc_1.bottom = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.horizontalCenter = 0;
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "_AudioOnlyIndicator_VectorImage1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._AudioOnlyIndicator_VectorImage1 = _loc_1;
            BindingManager.executeBindings(this, "_AudioOnlyIndicator_VectorImage1", this._AudioOnlyIndicator_VectorImage1);
            return _loc_1;
        }// end function

        private function _AudioOnlyIndicator_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return MicrophoneIcon;
            }// end function
            , null, "_AudioOnlyIndicator_VectorImage1.source");
            return result;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
        {
            AudioOnlyIndicator._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
