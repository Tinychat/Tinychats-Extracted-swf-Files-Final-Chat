package com.tinychat.ui.skins.gotham.components.controlbar.buttons
{
    import com.adobe.popup.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.popups.*;
    import com.tinychat.ui.skins.gotham.components.settings.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;

    public class OpenGraphToggleSkin extends Skin implements IBindingClient
    {
        private var _1536891843checkbox:BooleanApplicationSettingItemRenderer;
        private var _619806398popupFactory:PopUpFactory;
        private var __moduleFactoryInitialized:Boolean = false;
        private var tooltip:IFlexDisplayObject;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function OpenGraphToggleSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._OpenGraphToggleSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_controlbar_buttons_OpenGraphToggleSkinWatcherSetupUtil");
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
            this.mxmlContent = [this._OpenGraphToggleSkin_BooleanApplicationSettingItemRenderer1_i()];
            this._OpenGraphToggleSkin_PopUpFactory1_i();
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

        public function registerTooltipInstance(param1:IFlexDisplayObject) : void
        {
            this.tooltip = param1;
            this.tooltip.addEventListener(Event.RESIZE, this.resizeHandler);
            this.positionToolTip();
            return;
        }// end function

        public function deregisterToolTipInstance() : void
        {
            this.tooltip.removeEventListener(Event.RESIZE, this.resizeHandler);
            this.tooltip = null;
            return;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            this.positionToolTip();
            return;
        }// end function

        private function resizeHandler(event:Event) : void
        {
            this.positionToolTip();
            return;
        }// end function

        private function positionToolTip() : void
        {
            var _loc_1:Point = null;
            if (this.tooltip)
            {
                _loc_1 = localToGlobal(new Point(x, y));
                this.tooltip.x = _loc_1.x + (width - this.tooltip.width) / 2;
                this.tooltip.y = _loc_1.y - this.tooltip.height - 5;
            }
            return;
        }// end function

        private function _OpenGraphToggleSkin_PopUpFactory1_i() : PopUpFactory
        {
            var _loc_1:* = new PopUpFactory();
            _loc_1.reuse = false;
            _loc_1.center = false;
            _loc_1.popup = this._OpenGraphToggleSkin_ClassFactory1_c();
            _loc_1.behaviors = [this._OpenGraphToggleSkin_PlayEffectsPopUpBehavior1_c()];
            _loc_1.addEventListener("opened", this.__popupFactory_opened);
            _loc_1.addEventListener("closed", this.__popupFactory_closed);
            _loc_1.initialized(this, "popupFactory");
            this.popupFactory = _loc_1;
            BindingManager.executeBindings(this, "popupFactory", this.popupFactory);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = OpenGraphToggleToolTip;
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_PlayEffectsPopUpBehavior1_c() : PlayEffectsPopUpBehavior
        {
            var _loc_1:* = new PlayEffectsPopUpBehavior();
            _loc_1.openEffect = this._OpenGraphToggleSkin_Parallel1_c();
            _loc_1.closeEffect = this._OpenGraphToggleSkin_Fade2_c();
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 300;
            _loc_1.children = [this._OpenGraphToggleSkin_Fade1_c()];
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_Fade1_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_Fade2_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 1;
            _loc_1.alphaTo = 0;
            _loc_1.duration = 300;
            return _loc_1;
        }// end function

        public function __popupFactory_opened(event:PopUpEvent) : void
        {
            this.registerTooltipInstance(event.popup);
            return;
        }// end function

        public function __popupFactory_closed(event:PopUpEvent) : void
        {
            this.deregisterToolTipInstance();
            return;
        }// end function

        private function _OpenGraphToggleSkin_BooleanApplicationSettingItemRenderer1_i() : BooleanApplicationSettingItemRenderer
        {
            var _loc_1:* = new BooleanApplicationSettingItemRenderer();
            _loc_1.id = "checkbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.checkbox = _loc_1;
            BindingManager.executeBindings(this, "checkbox", this.checkbox);
            return _loc_1;
        }// end function

        private function _OpenGraphToggleSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : DisplayObject
            {
                return this;
            }// end function
            , null, "popupFactory.parent");
            return result;
        }// end function

        public function get checkbox() : BooleanApplicationSettingItemRenderer
        {
            return this._1536891843checkbox;
        }// end function

        public function set checkbox(param1:BooleanApplicationSettingItemRenderer) : void
        {
            var _loc_2:* = this._1536891843checkbox;
            if (_loc_2 !== param1)
            {
                this._1536891843checkbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "checkbox", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get popupFactory() : PopUpFactory
        {
            return this._619806398popupFactory;
        }// end function

        public function set popupFactory(param1:PopUpFactory) : void
        {
            var _loc_2:* = this._619806398popupFactory;
            if (_loc_2 !== param1)
            {
                this._619806398popupFactory = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popupFactory", _loc_2, param1));
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
