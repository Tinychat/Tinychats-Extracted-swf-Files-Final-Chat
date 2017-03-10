package com.tinychat.ui.skins.gotham.components.gifts
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.primitives.*;
    import spark.skins.*;

    public class BuyGiftButtonSkin extends SparkButtonSkin implements IBindingClient, IStateClient2
    {
        private var _1375202344_BuyGiftButtonSkin_GradientEntry1:GradientEntry;
        private var _1375202345_BuyGiftButtonSkin_GradientEntry2:GradientEntry;
        private var _1817295640_BuyGiftButtonSkin_SolidColorStroke1:SolidColorStroke;
        private var _34806386_BuyGiftButtonSkin_VectorImage1:VectorImage;
        private var _1383304148border:Rect;
        private var _3143043fill:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function BuyGiftButtonSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._BuyGiftButtonSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_gifts_BuyGiftButtonSkinWatcherSetupUtil");
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
            this.minWidth = 39;
            this.minHeight = 16;
            this.mxmlContent = [this._BuyGiftButtonSkin_Rect1_i(), this._BuyGiftButtonSkin_Rect2_i(), this._BuyGiftButtonSkin_VectorImage1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", overrides:[new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_GradientEntry1", name:"color", value:8835644}), new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_GradientEntry2", name:"color", value:8378665}), new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_SolidColorStroke1", name:"color", value:9553502}), new SetStyle().initializeFromObject({target:"_BuyGiftButtonSkin_VectorImage1", name:"tintColor", value:16318455})]}), new State({name:"down", overrides:[new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_GradientEntry1", name:"color", value:8835644}), new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_GradientEntry2", name:"color", value:8378665}), new SetProperty().initializeFromObject({target:"_BuyGiftButtonSkin_SolidColorStroke1", name:"color", value:9553502}), new SetStyle().initializeFromObject({target:"_BuyGiftButtonSkin_VectorImage1", name:"tintColor", value:16318455})]}), new State({name:"disabled", overrides:[new SetProperty().initializeFromObject({name:"alpha", value:0.5})]})];
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

        private function _BuyGiftButtonSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.radiusX = 8;
            _loc_1.radiusY = 8;
            _loc_1.fill = this._BuyGiftButtonSkin_LinearGradient1_c();
            _loc_1.initialized(this, "fill");
            this.fill = _loc_1;
            BindingManager.executeBindings(this, "fill", this.fill);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._BuyGiftButtonSkin_GradientEntry1_i(), this._BuyGiftButtonSkin_GradientEntry2_i()];
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_GradientEntry1_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 16579836;
            this._BuyGiftButtonSkin_GradientEntry1 = _loc_1;
            BindingManager.executeBindings(this, "_BuyGiftButtonSkin_GradientEntry1", this._BuyGiftButtonSkin_GradientEntry1);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_GradientEntry2_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 14671839;
            this._BuyGiftButtonSkin_GradientEntry2 = _loc_1;
            BindingManager.executeBindings(this, "_BuyGiftButtonSkin_GradientEntry2", this._BuyGiftButtonSkin_GradientEntry2);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 8;
            _loc_1.radiusY = 8;
            _loc_1.stroke = this._BuyGiftButtonSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 10658979;
            this._BuyGiftButtonSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_BuyGiftButtonSkin_SolidColorStroke1", this._BuyGiftButtonSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.width = 9;
            _loc_1.height = 10;
            _loc_1.verticalCenter = 0;
            _loc_1.horizontalCenter = 0;
            _loc_1.setStyle("tintColor", 9934743);
            _loc_1.id = "_BuyGiftButtonSkin_VectorImage1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._BuyGiftButtonSkin_VectorImage1 = _loc_1;
            BindingManager.executeBindings(this, "_BuyGiftButtonSkin_VectorImage1", this._BuyGiftButtonSkin_VectorImage1);
            return _loc_1;
        }// end function

        private function _BuyGiftButtonSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return GiftGreyIcon;
            }// end function
            , null, "_BuyGiftButtonSkin_VectorImage1.source");
            return result;
        }// end function

        public function get _BuyGiftButtonSkin_GradientEntry1() : GradientEntry
        {
            return this._1375202344_BuyGiftButtonSkin_GradientEntry1;
        }// end function

        public function set _BuyGiftButtonSkin_GradientEntry1(param1:GradientEntry) : void
        {
            var _loc_2:* = this._1375202344_BuyGiftButtonSkin_GradientEntry1;
            if (_loc_2 !== param1)
            {
                this._1375202344_BuyGiftButtonSkin_GradientEntry1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BuyGiftButtonSkin_GradientEntry1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _BuyGiftButtonSkin_GradientEntry2() : GradientEntry
        {
            return this._1375202345_BuyGiftButtonSkin_GradientEntry2;
        }// end function

        public function set _BuyGiftButtonSkin_GradientEntry2(param1:GradientEntry) : void
        {
            var _loc_2:* = this._1375202345_BuyGiftButtonSkin_GradientEntry2;
            if (_loc_2 !== param1)
            {
                this._1375202345_BuyGiftButtonSkin_GradientEntry2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BuyGiftButtonSkin_GradientEntry2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _BuyGiftButtonSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._1817295640_BuyGiftButtonSkin_SolidColorStroke1;
        }// end function

        public function set _BuyGiftButtonSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1817295640_BuyGiftButtonSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._1817295640_BuyGiftButtonSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BuyGiftButtonSkin_SolidColorStroke1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _BuyGiftButtonSkin_VectorImage1() : VectorImage
        {
            return this._34806386_BuyGiftButtonSkin_VectorImage1;
        }// end function

        public function set _BuyGiftButtonSkin_VectorImage1(param1:VectorImage) : void
        {
            var _loc_2:* = this._34806386_BuyGiftButtonSkin_VectorImage1;
            if (_loc_2 !== param1)
            {
                this._34806386_BuyGiftButtonSkin_VectorImage1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BuyGiftButtonSkin_VectorImage1", _loc_2, param1));
                }
            }
            return;
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

        public function get fill() : Rect
        {
            return this._3143043fill;
        }// end function

        public function set fill(param1:Rect) : void
        {
            var _loc_2:* = this._3143043fill;
            if (_loc_2 !== param1)
            {
                this._3143043fill = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fill", _loc_2, param1));
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
