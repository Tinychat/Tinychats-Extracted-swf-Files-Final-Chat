package com.tinychat.ui.skins.gotham.components.media
{
    import com.tinychat.ui.components.media.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
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

    public class MediaSelectionScreenSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _MediaSelectionScreenSkin_AjaxLoader1:AjaxLoader;
        private var _1565463546_MediaSelectionScreenSkin_VGroup2:VGroup;
        private var _1394625710clipDisplay:AdvancedButtonBarBase;
        private var _1218036609clipDisplayHeader:Label;
        private var _1305232757headerDisplay:Label;
        private var _2047579398mediaItemRenderer:ClassFactory;
        private var _3443508play:Button;
        private var _365389062searchButton:IconButton;
        private var _562654158searchField:AdvancedTextInput;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:AbstractMediaSelectionScreen;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function MediaSelectionScreenSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._MediaSelectionScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_media_MediaSelectionScreenSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return MediaSelectionScreenSkin[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 500;
            this.layout = this._MediaSelectionScreenSkin_VerticalLayout1_c();
            this.mxmlContent = [this._MediaSelectionScreenSkin_TitleDisplay1_i(), this._MediaSelectionScreenSkin_VGroup1_c(), this._MediaSelectionScreenSkin_Line1_c(), this._MediaSelectionScreenSkin_VGroup2_i()];
            this.currentState = "normal";
            this._MediaSelectionScreenSkin_ClassFactory1_i();
            var _MediaSelectionScreenSkin_AdvancedButtonBarBase1_factory:* = new DeferredInstanceFromFunction(this._MediaSelectionScreenSkin_AdvancedButtonBarBase1_i);
            var _MediaSelectionScreenSkin_AjaxLoader1_factory:* = new DeferredInstanceFromFunction(this._MediaSelectionScreenSkin_AjaxLoader1_i);
            var _MediaSelectionScreenSkin_Button1_factory:* = new DeferredInstanceFromFunction(this._MediaSelectionScreenSkin_Button1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_MediaSelectionScreenSkin_Button1_factory, destination:"_MediaSelectionScreenSkin_VGroup2", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]}), new AddItems().initializeFromObject({itemsFactory:_MediaSelectionScreenSkin_AdvancedButtonBarBase1_factory, destination:"_MediaSelectionScreenSkin_VGroup2", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]})]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_MediaSelectionScreenSkin_AjaxLoader1_factory, destination:"_MediaSelectionScreenSkin_VGroup2", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]})]})];
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

        private function _MediaSelectionScreenSkin_ClassFactory1_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = MediaSelectionScreenSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            this.mediaItemRenderer = _loc_1;
            BindingManager.executeBindings(this, "mediaItemRenderer", this.mediaItemRenderer);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 15;
            _loc_1.paddingBottom = 15;
            _loc_1.horizontalAlign = "center";
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _MediaSelectionScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.paddingLeft = 15;
            _loc_1.paddingRight = 15;
            _loc_1.gap = 15;
            _loc_1.mxmlContent = [this._MediaSelectionScreenSkin_Label1_i(), this._MediaSelectionScreenSkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("paddingLeft", 15);
            _loc_1.setStyle("paddingRight", 15);
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "headerDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.headerDisplay = _loc_1;
            BindingManager.executeBindings(this, "headerDisplay", this.headerDisplay);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.verticalAlign = "justify";
            _loc_1.height = 40;
            _loc_1.gap = 10;
            _loc_1.mxmlContent = [this._MediaSelectionScreenSkin_AdvancedTextInput1_i(), this._MediaSelectionScreenSkin_IconButton1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.percentWidth = 100;
            _loc_1.id = "searchField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.searchField = _loc_1;
            BindingManager.executeBindings(this, "searchField", this.searchField);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_IconButton1_i() : IconButton
        {
            var _loc_1:* = new IconButton();
            _loc_1.width = 40;
            _loc_1.id = "searchButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.searchButton = _loc_1;
            BindingManager.executeBindings(this, "searchButton", this.searchButton);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.percentWidth = 98;
            _loc_1.stroke = this._MediaSelectionScreenSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 12238788;
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.gap = 10;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._MediaSelectionScreenSkin_Label2_i()];
            _loc_1.id = "_MediaSelectionScreenSkin_VGroup2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._MediaSelectionScreenSkin_VGroup2 = _loc_1;
            BindingManager.executeBindings(this, "_MediaSelectionScreenSkin_VGroup2", this._MediaSelectionScreenSkin_VGroup2);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("paddingLeft", 15);
            _loc_1.setStyle("paddingRight", 15);
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "clipDisplayHeader";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.clipDisplayHeader = _loc_1;
            BindingManager.executeBindings(this, "clipDisplayHeader", this.clipDisplayHeader);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.id = "_MediaSelectionScreenSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._MediaSelectionScreenSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_MediaSelectionScreenSkin_AjaxLoader1", this._MediaSelectionScreenSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_AdvancedButtonBarBase1_i() : AdvancedButtonBarBase
        {
            var _loc_1:* = new AdvancedButtonBarBase();
            _loc_1.percentWidth = 100;
            _loc_1.maxHeight = 300;
            _loc_1.setStyle("skinClass", MediaItemDisplaySkin);
            _loc_1.id = "clipDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.clipDisplay = _loc_1;
            BindingManager.executeBindings(this, "clipDisplay", this.clipDisplay);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 150;
            _loc_1.id = "play";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.play = _loc_1;
            BindingManager.executeBindings(this, "play", this.play);
            return _loc_1;
        }// end function

        private function _MediaSelectionScreenSkin_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "clipDisplay.itemRenderer", "mediaItemRenderer");
            return _loc_1;
        }// end function

        public function get _MediaSelectionScreenSkin_VGroup2() : VGroup
        {
            return this._1565463546_MediaSelectionScreenSkin_VGroup2;
        }// end function

        public function set _MediaSelectionScreenSkin_VGroup2(param1:VGroup) : void
        {
            var _loc_2:* = this._1565463546_MediaSelectionScreenSkin_VGroup2;
            if (_loc_2 !== param1)
            {
                this._1565463546_MediaSelectionScreenSkin_VGroup2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MediaSelectionScreenSkin_VGroup2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get clipDisplay() : AdvancedButtonBarBase
        {
            return this._1394625710clipDisplay;
        }// end function

        public function set clipDisplay(param1:AdvancedButtonBarBase) : void
        {
            var _loc_2:* = this._1394625710clipDisplay;
            if (_loc_2 !== param1)
            {
                this._1394625710clipDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clipDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get clipDisplayHeader() : Label
        {
            return this._1218036609clipDisplayHeader;
        }// end function

        public function set clipDisplayHeader(param1:Label) : void
        {
            var _loc_2:* = this._1218036609clipDisplayHeader;
            if (_loc_2 !== param1)
            {
                this._1218036609clipDisplayHeader = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clipDisplayHeader", _loc_2, param1));
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

        public function get mediaItemRenderer() : ClassFactory
        {
            return this._2047579398mediaItemRenderer;
        }// end function

        public function set mediaItemRenderer(param1:ClassFactory) : void
        {
            var _loc_2:* = this._2047579398mediaItemRenderer;
            if (_loc_2 !== param1)
            {
                this._2047579398mediaItemRenderer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mediaItemRenderer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get play() : Button
        {
            return this._3443508play;
        }// end function

        public function set play(param1:Button) : void
        {
            var _loc_2:* = this._3443508play;
            if (_loc_2 !== param1)
            {
                this._3443508play = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "play", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get searchButton() : IconButton
        {
            return this._365389062searchButton;
        }// end function

        public function set searchButton(param1:IconButton) : void
        {
            var _loc_2:* = this._365389062searchButton;
            if (_loc_2 !== param1)
            {
                this._365389062searchButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get searchField() : AdvancedTextInput
        {
            return this._562654158searchField;
        }// end function

        public function set searchField(param1:AdvancedTextInput) : void
        {
            var _loc_2:* = this._562654158searchField;
            if (_loc_2 !== param1)
            {
                this._562654158searchField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchField", _loc_2, param1));
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

        public function get hostComponent() : AbstractMediaSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:AbstractMediaSelectionScreen) : void
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
            MediaSelectionScreenSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
