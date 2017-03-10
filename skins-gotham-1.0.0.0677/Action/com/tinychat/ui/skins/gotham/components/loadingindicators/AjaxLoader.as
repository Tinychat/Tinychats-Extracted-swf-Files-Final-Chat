package com.tinychat.ui.skins.gotham.components.loadingindicators
{
    import com.tinychat.ui.components.spark.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.primitives.*;

    public class AjaxLoader extends Group implements IBindingClient
    {
        public var _AjaxLoader_AnimatedGifImage1:AnimatedGifImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1537100205ajaxLoader:Class;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function AjaxLoader()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._1537100205ajaxLoader = AjaxLoader_ajaxLoader;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._AjaxLoader_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_loadingindicators_AjaxLoaderWatcherSetupUtil");
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
            this.mxmlContent = [this._AjaxLoader_Rect1_c(), this._AjaxLoader_AnimatedGifImage1_i()];
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

        private function _AjaxLoader_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.width = 30;
            _loc_1.height = 30;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.radiusX = 6;
            _loc_1.fill = this._AjaxLoader_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _AjaxLoader_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _AjaxLoader_AnimatedGifImage1_i() : AnimatedGifImage
        {
            var _loc_1:* = new AnimatedGifImage();
            _loc_1.width = 24;
            _loc_1.height = 24;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.initialized(this, "_AjaxLoader_AnimatedGifImage1");
            this._AjaxLoader_AnimatedGifImage1 = _loc_1;
            BindingManager.executeBindings(this, "_AjaxLoader_AnimatedGifImage1", this._AjaxLoader_AnimatedGifImage1);
            return _loc_1;
        }// end function

        private function _AjaxLoader_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "_AjaxLoader_AnimatedGifImage1.source", "ajaxLoader");
            return _loc_1;
        }// end function

        public function get ajaxLoader() : Class
        {
            return this._1537100205ajaxLoader;
        }// end function

        public function set ajaxLoader(param1:Class) : void
        {
            var _loc_2:* = this._1537100205ajaxLoader;
            if (_loc_2 !== param1)
            {
                this._1537100205ajaxLoader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ajaxLoader", _loc_2, param1));
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
