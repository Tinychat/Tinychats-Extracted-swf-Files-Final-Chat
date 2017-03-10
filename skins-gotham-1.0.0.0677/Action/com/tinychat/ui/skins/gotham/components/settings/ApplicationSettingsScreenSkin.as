package com.tinychat.ui.skins.gotham.components.settings
{
    import com.tinychat.model.settings.*;
    import com.tinychat.ui.components.settings.*;
    import com.tinychat.ui.components.spark.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class ApplicationSettingsScreenSkin extends Skin implements IBindingClient
    {
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _626366436settingsGroup:DataGroup;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:ApplicationSettingsScreen;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function ApplicationSettingsScreenSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._ApplicationSettingsScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_settings_ApplicationSettingsScreenSkinWatcherSetupUtil");
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
            this.width = 400;
            this.mxmlContent = [this._ApplicationSettingsScreenSkin_TitleDisplay1_i(), this._ApplicationSettingsScreenSkin_DataGroup1_i(), this._ApplicationSettingsScreenSkin_HGroup1_c()];
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

        private function itemRendererFunction(param1:Object) : IFactory
        {
            var _loc_2:Class = null;
            if (param1 is ChatColorApplicationSetting)
            {
                _loc_2 = ColorApplicationSettingItemRenderer;
            }
            else
            {
                _loc_2 = BooleanApplicationSettingItemRenderer;
            }
            return new ClassFactory(_loc_2);
        }// end function

        private function _ApplicationSettingsScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.height = 50;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 65;
            _loc_1.bottom = 65;
            _loc_1.layout = this._ApplicationSettingsScreenSkin_VerticalLayout1_c();
            _loc_1.id = "settingsGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.settingsGroup = _loc_1;
            BindingManager.executeBindings(this, "settingsGroup", this.settingsGroup);
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 15;
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.bottom = 15;
            _loc_1.horizontalCenter = 0;
            _loc_1.variableColumnWidth = false;
            _loc_1.columnWidth = 100;
            _loc_1.gap = 20;
            _loc_1.mxmlContent = [this._ApplicationSettingsScreenSkin_Button1_i(), this._ApplicationSettingsScreenSkin_Button2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "cancel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.cancel = _loc_1;
            BindingManager.executeBindings(this, "cancel", this.cancel);
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_Button2_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _ApplicationSettingsScreenSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Function
            {
                return itemRendererFunction;
            }// end function
            , null, "settingsGroup.itemRendererFunction");
            return result;
        }// end function

        public function get cancel() : Button
        {
            return this._1367724422cancel;
        }// end function

        public function set cancel(param1:Button) : void
        {
            var _loc_2:* = this._1367724422cancel;
            if (_loc_2 !== param1)
            {
                this._1367724422cancel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get confirm() : Button
        {
            return this._951117504confirm;
        }// end function

        public function set confirm(param1:Button) : void
        {
            var _loc_2:* = this._951117504confirm;
            if (_loc_2 !== param1)
            {
                this._951117504confirm = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirm", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get settingsGroup() : DataGroup
        {
            return this._626366436settingsGroup;
        }// end function

        public function set settingsGroup(param1:DataGroup) : void
        {
            var _loc_2:* = this._626366436settingsGroup;
            if (_loc_2 !== param1)
            {
                this._626366436settingsGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "settingsGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get titleDisplay() : TitleDisplay
        {
            return this._1893287094titleDisplay;
        }// end function

        public function set titleDisplay(param1:TitleDisplay) : void
        {
            var _loc_2:* = this._1893287094titleDisplay;
            if (_loc_2 !== param1)
            {
                this._1893287094titleDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ApplicationSettingsScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ApplicationSettingsScreen) : void
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
