package com.tinychat.ui.skins.gotham.components.popupmenu
{
    import com.tinychat.model.menuoption.*;
    import com.tinychat.model.menuoption.media.*;
    import com.tinychat.ui.components.pro.*;
    import com.tinychat.ui.components.spark.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class UserPopupMenuSkin extends Skin implements IBindingClient, IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _433014735dropDown:Group;
        private var _1305232757headerDisplay:Label;
        private var _137111012openButton:IconButton;
        private var _106851532popUp:PopUpAnchor;
        private var _462823966proIndicator:ProIndicator;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:PopupList;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function UserPopupMenuSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._UserPopupMenuSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_popupmenu_UserPopupMenuSkinWatcherSetupUtil");
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
            this.mxmlContent = [this._UserPopupMenuSkin_IconButton1_i()];
            this.currentState = "normal";
            var _UserPopupMenuSkin_PopUpAnchor1_factory:* = new DeferredInstanceFromFunction(this._UserPopupMenuSkin_PopUpAnchor1_i, this._UserPopupMenuSkin_PopUpAnchor1_r);
            states = [new State({name:"normal", overrides:[new SetProperty().initializeFromObject({target:"popUp", name:"displayPopUp", value:false})]}), new State({name:"open", overrides:[new AddItems().initializeFromObject({destructionPolicy:"auto", itemsFactory:_UserPopupMenuSkin_PopUpAnchor1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"popUp", name:"displayPopUp", value:true})]}), new State({name:"disabled", overrides:[]})];
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
            var _loc_4:ClassFactory = null;
            var _loc_3:Object = {};
            if (param1 is VolumeBroadcastMenuOption)
            {
                _loc_2 = VolumeUserPopupMenuItemRenderer;
            }
            else
            {
                if (!(param1 is EditableDurationMediaBroadcastMenuOption))
                {
                }
                if (param1 is ReadOnlyDurationMediaBroadcastMenuOption)
                {
                    _loc_2 = DurationPopupMenuItemRenderer;
                }
                else
                {
                    _loc_2 = UserPopupMenuItemRenderer;
                }
            }
            _loc_3.enabled = MenuOption(param1).enabled;
            _loc_4 = new ClassFactory(_loc_2);
            _loc_4.properties = _loc_3;
            return _loc_4;
        }// end function

        private function _UserPopupMenuSkin_PopUpAnchor1_i() : PopUpAnchor
        {
            var _loc_1:* = new PopUpAnchor();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.mouseEnabled = false;
            _loc_1.popUpPosition = "below";
            _loc_1.popUpWidthMatchesAnchorWidth = false;
            _loc_1.popUp = this._UserPopupMenuSkin_Group1_i();
            _loc_1.id = "popUp";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.popUp = _loc_1;
            BindingManager.executeBindings(this, "popUp", this.popUp);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_PopUpAnchor1_r() : void
        {
            var _loc_1:String = null;
            this.popUp = null;
            var _loc_1:String = null;
            this.dropDown = null;
            var _loc_1:String = null;
            this.headerDisplay = null;
            var _loc_1:String = null;
            this.proIndicator = null;
            var _loc_1:String = null;
            this.dataGroup = null;
            return;
        }// end function

        private function _UserPopupMenuSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.minWidth = 150;
            _loc_1.minHeight = 22;
            _loc_1.mxmlContent = [this._UserPopupMenuSkin_Rect1_c(), this._UserPopupMenuSkin_VGroup1_c(), this._UserPopupMenuSkin_Rect3_c()];
            _loc_1.id = "dropDown";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dropDown = _loc_1;
            BindingManager.executeBindings(this, "dropDown", this.dropDown);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.fill = this._UserPopupMenuSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 12248558;
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.gap = 1;
            _loc_1.horizontalAlign = "contentJustify";
            _loc_1.mxmlContent = [this._UserPopupMenuSkin_Group2_c(), this._UserPopupMenuSkin_DataGroup1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.height = 28;
            _loc_1.mxmlContent = [this._UserPopupMenuSkin_Rect2_c(), this._UserPopupMenuSkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.fill = this._UserPopupMenuSkin_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 15793406;
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 10;
            _loc_1.right = 4;
            _loc_1.gap = 5;
            _loc_1.verticalCenter = 0;
            _loc_1.mxmlContent = [this._UserPopupMenuSkin_Label1_i(), this._UserPopupMenuSkin_ProIndicator1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.maxWidth = 225;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("paddingTop", 2);
            _loc_1.setStyle("fontWeight", "bold");
            _loc_1.id = "headerDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.headerDisplay = _loc_1;
            BindingManager.executeBindings(this, "headerDisplay", this.headerDisplay);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_ProIndicator1_i() : ProIndicator
        {
            var _loc_1:* = new ProIndicator();
            _loc_1.id = "proIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.proIndicator = _loc_1;
            BindingManager.executeBindings(this, "proIndicator", this.proIndicator);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.layout = this._UserPopupMenuSkin_VerticalLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 1;
            _loc_1.rowHeight = 28;
            _loc_1.variableRowHeight = false;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 4;
            _loc_1.stroke = this._UserPopupMenuSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 12248558;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_IconButton1_i() : IconButton
        {
            var _loc_1:* = new IconButton();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "openButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.openButton = _loc_1;
            BindingManager.executeBindings(this, "openButton", this.openButton);
            return _loc_1;
        }// end function

        private function _UserPopupMenuSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Function
            {
                return itemRendererFunction;
            }// end function
            , null, "dataGroup.itemRendererFunction");
            return result;
        }// end function

        public function get dataGroup() : DataGroup
        {
            return this._385593099dataGroup;
        }// end function

        public function set dataGroup(param1:DataGroup) : void
        {
            var _loc_2:* = this._385593099dataGroup;
            if (_loc_2 !== param1)
            {
                this._385593099dataGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get dropDown() : Group
        {
            return this._433014735dropDown;
        }// end function

        public function set dropDown(param1:Group) : void
        {
            var _loc_2:* = this._433014735dropDown;
            if (_loc_2 !== param1)
            {
                this._433014735dropDown = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropDown", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get headerDisplay() : Label
        {
            return this._1305232757headerDisplay;
        }// end function

        public function set headerDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1305232757headerDisplay;
            if (_loc_2 !== param1)
            {
                this._1305232757headerDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get openButton() : IconButton
        {
            return this._137111012openButton;
        }// end function

        public function set openButton(param1:IconButton) : void
        {
            var _loc_2:* = this._137111012openButton;
            if (_loc_2 !== param1)
            {
                this._137111012openButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get popUp() : PopUpAnchor
        {
            return this._106851532popUp;
        }// end function

        public function set popUp(param1:PopUpAnchor) : void
        {
            var _loc_2:* = this._106851532popUp;
            if (_loc_2 !== param1)
            {
                this._106851532popUp = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popUp", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get proIndicator() : ProIndicator
        {
            return this._462823966proIndicator;
        }// end function

        public function set proIndicator(param1:ProIndicator) : void
        {
            var _loc_2:* = this._462823966proIndicator;
            if (_loc_2 !== param1)
            {
                this._462823966proIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "proIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : PopupList
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PopupList) : void
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
