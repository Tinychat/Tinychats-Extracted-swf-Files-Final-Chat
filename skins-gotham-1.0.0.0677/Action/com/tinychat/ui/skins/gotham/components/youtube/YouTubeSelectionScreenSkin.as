package com.tinychat.ui.skins.gotham.components.youtube
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.youtube.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import com.tinychat.ui.skins.gotham.components.media.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class YouTubeSelectionScreenSkin extends Skin implements IStateClient2
    {
        public var _YouTubeSelectionScreenSkin_AjaxLoader1:AjaxLoader;
        private var _921050492_YouTubeSelectionScreenSkin_VGroup3:VGroup;
        private var _1394625710clipDisplay:AdvancedButtonBarBase;
        private var _1218036609clipDisplayHeader:Label;
        private var _1305232757headerDisplay:Label;
        private var _1213523686infoLabel:Label;
        private var _1983820356listDisplay:List;
        private var _3327652loop:ToggleButton;
        private var _365389062searchButton:IconButton;
        private var _562654158searchField:AdvancedTextInput;
        private var _2072332025shuffle:ToggleButton;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_youtube_png_547961818:Class;
        private var _213507019hostComponent:YouTubeClipSelectionScreen;

        public function YouTubeSelectionScreenSkin()
        {
            this._embed_mxml__images_youtube_png_547961818 = YouTubeSelectionScreenSkin__embed_mxml__images_youtube_png_547961818;
            mx_internal::_document = this;
            this.width = 750;
            this.maxHeight = 555;
            this.layout = this._YouTubeSelectionScreenSkin_HorizontalLayout1_c();
            this.mxmlContent = [this._YouTubeSelectionScreenSkin_VGroup1_c(), this._YouTubeSelectionScreenSkin_Group1_c()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._YouTubeSelectionScreenSkin_AdvancedButtonBarBase1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._YouTubeSelectionScreenSkin_AjaxLoader1_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._YouTubeSelectionScreenSkin_Label3_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:"_YouTubeSelectionScreenSkin_VGroup3", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]}), new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:"_YouTubeSelectionScreenSkin_VGroup3", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]})]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:"_YouTubeSelectionScreenSkin_VGroup3", propertyName:"mxmlContent", position:"after", relativeTo:["clipDisplayHeader"]})]})];
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

        private function _YouTubeSelectionScreenSkin_HorizontalLayout1_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_VGroup1_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.gap = 15;
            _loc_1.paddingBottom = 15;
            _loc_1.horizontalAlign = "center";
            _loc_1.percentWidth = 100;
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_TitleDisplay1_i(), this._YouTubeSelectionScreenSkin_VGroup2_c(), this._YouTubeSelectionScreenSkin_Line1_c(), this._YouTubeSelectionScreenSkin_VGroup3_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_TitleDisplay1_i() : TitleDisplay
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

        private function _YouTubeSelectionScreenSkin_VGroup2_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.paddingLeft = 15;
            _loc_1.paddingRight = 15;
            _loc_1.gap = 15;
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_Label1_i(), this._YouTubeSelectionScreenSkin_HGroup1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Label1_i() : Label
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

        private function _YouTubeSelectionScreenSkin_HGroup1_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.verticalAlign = "justify";
            _loc_1.height = 40;
            _loc_1.gap = 10;
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_AdvancedTextInput1_i(), this._YouTubeSelectionScreenSkin_IconButton1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_AdvancedTextInput1_i() : AdvancedTextInput
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

        private function _YouTubeSelectionScreenSkin_IconButton1_i() : IconButton
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

        private function _YouTubeSelectionScreenSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.percentWidth = 98;
            _loc_1.stroke = this._YouTubeSelectionScreenSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.weight = 1;
            _loc_1.color = 12238788;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_VGroup3_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.gap = 10;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_Label2_i()];
            _loc_1.id = "_YouTubeSelectionScreenSkin_VGroup3";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._YouTubeSelectionScreenSkin_VGroup3 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeSelectionScreenSkin_VGroup3", this._YouTubeSelectionScreenSkin_VGroup3);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Label2_i() : Label
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

        private function _YouTubeSelectionScreenSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.id = "_YouTubeSelectionScreenSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._YouTubeSelectionScreenSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeSelectionScreenSkin_AjaxLoader1", this._YouTubeSelectionScreenSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_AdvancedButtonBarBase1_i() : AdvancedButtonBarBase
        {
            var _loc_1:* = new AdvancedButtonBarBase();
            _loc_1.percentWidth = 100;
            _loc_1.maxHeight = 340;
            _loc_1.requireSelection = true;
            _loc_1.allowDeselection = false;
            _loc_1.itemRenderer = this._YouTubeSelectionScreenSkin_ClassFactory1_c();
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

        private function _YouTubeSelectionScreenSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = YouTubeSelectionScreenSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Label3_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 100;
            _loc_1.setStyle("textAlign", "right");
            _loc_1.setStyle("color", 9211020);
            _loc_1.setStyle("fontSize", 10);
            _loc_1.setStyle("paddingTop", 0);
            _loc_1.id = "infoLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.infoLabel = _loc_1;
            BindingManager.executeBindings(this, "infoLabel", this.infoLabel);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.width = 240;
            _loc_1.percentHeight = 100;
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_Rect1_c(), this._YouTubeSelectionScreenSkin_BitmapImage1_c(), this._YouTubeSelectionScreenSkin_Rect2_c(), this._YouTubeSelectionScreenSkin_HGroup2_c(), this._YouTubeSelectionScreenSkin_List1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._YouTubeSelectionScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 2236962;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_BitmapImage1_c() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.alpha = 0.4;
            _loc_1.source = this._embed_mxml__images_youtube_png_547961818;
            _loc_1.verticalCenter = 0;
            _loc_1.horizontalCenter = 0;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.height = 38;
            _loc_1.fill = this._YouTubeSelectionScreenSkin_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 1710618;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_HGroup2_c() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.height = 38;
            _loc_1.gap = 16;
            _loc_1.paddingLeft = 16;
            _loc_1.paddingRight = 16;
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._YouTubeSelectionScreenSkin_ToggleButton1_i(), this._YouTubeSelectionScreenSkin_ToggleButton2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_ToggleButton1_i() : ToggleButton
        {
            var _loc_1:* = new ToggleButton();
            _loc_1.buttonMode = true;
            _loc_1.mouseChildren = false;
            _loc_1.useHandCursor = true;
            _loc_1.setStyle("skinClass", YouTubeLoopButtonSkin);
            _loc_1.id = "loop";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.loop = _loc_1;
            BindingManager.executeBindings(this, "loop", this.loop);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_ToggleButton2_i() : ToggleButton
        {
            var _loc_1:* = new ToggleButton();
            _loc_1.buttonMode = true;
            _loc_1.mouseChildren = false;
            _loc_1.useHandCursor = true;
            _loc_1.setStyle("skinClass", YouTubeShuffleButtonSkin);
            _loc_1.id = "shuffle";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.shuffle = _loc_1;
            BindingManager.executeBindings(this, "shuffle", this.shuffle);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_List1_i() : List
        {
            var _loc_1:* = new List();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 38;
            _loc_1.bottom = 0;
            _loc_1.allowMultipleSelection = false;
            _loc_1.itemRenderer = this._YouTubeSelectionScreenSkin_ClassFactory2_c();
            _loc_1.setStyle("borderVisible", false);
            _loc_1.setStyle("contentBackgroundAlpha", 0);
            _loc_1.id = "listDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.listDisplay = _loc_1;
            BindingManager.executeBindings(this, "listDisplay", this.listDisplay);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionScreenSkin_ClassFactory2_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = YouTubeSelectionScreenSkinInnerClass1;
            _loc_1.properties = {outerDocument:this};
            return _loc_1;
        }// end function

        public function get _YouTubeSelectionScreenSkin_VGroup3() : VGroup
        {
            return this._921050492_YouTubeSelectionScreenSkin_VGroup3;
        }// end function

        public function set _YouTubeSelectionScreenSkin_VGroup3(param1:VGroup) : void
        {
            var _loc_2:* = this._921050492_YouTubeSelectionScreenSkin_VGroup3;
            if (_loc_2 !== param1)
            {
                this._921050492_YouTubeSelectionScreenSkin_VGroup3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_YouTubeSelectionScreenSkin_VGroup3", _loc_2, param1));
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

        public function get infoLabel() : Label
        {
            return this._1213523686infoLabel;
        }// end function

        public function set infoLabel(param1:Label) : void
        {
            var _loc_2:* = this._1213523686infoLabel;
            if (_loc_2 !== param1)
            {
                this._1213523686infoLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get listDisplay() : List
        {
            return this._1983820356listDisplay;
        }// end function

        public function set listDisplay(param1:List) : void
        {
            var _loc_2:* = this._1983820356listDisplay;
            if (_loc_2 !== param1)
            {
                this._1983820356listDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "listDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get loop() : ToggleButton
        {
            return this._3327652loop;
        }// end function

        public function set loop(param1:ToggleButton) : void
        {
            var _loc_2:* = this._3327652loop;
            if (_loc_2 !== param1)
            {
                this._3327652loop = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loop", _loc_2, param1));
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

        public function get shuffle() : ToggleButton
        {
            return this._2072332025shuffle;
        }// end function

        public function set shuffle(param1:ToggleButton) : void
        {
            var _loc_2:* = this._2072332025shuffle;
            if (_loc_2 !== param1)
            {
                this._2072332025shuffle = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shuffle", _loc_2, param1));
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

        public function get hostComponent() : YouTubeClipSelectionScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:YouTubeClipSelectionScreen) : void
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

    }
}
