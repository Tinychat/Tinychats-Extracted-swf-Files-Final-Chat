package com.tinychat.ui.skins.gotham.components.invite
{
    import com.tinychat.ui.components.invite.*;
    import com.tinychat.ui.components.login.facebook.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.spark.*;
    import com.tinychat.ui.skins.gotham.icons.*;
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

    public class FacebookInviteFriendsScreenSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _FacebookInviteFriendsScreenSkin_VGroup1:VGroup;
        public var _FacebookInviteFriendsScreenSkin_VGroup2:VGroup;
        public var _FacebookInviteFriendsScreenSkin_VectorImage1:VectorImage;
        private var _77388586batchSelect:IconToggleButton;
        private var _951117504confirm:Button;
        private var _399947769friendsFoundLabel:Label;
        private var _1405524947friendsList:MultipleSelectionList;
        private var _1261015468inviteMessageInput:InviteMessageInput;
        private var _1735090125loadingIndicator:FacebookDistractorVisualElement;
        private var _151689773searchFriendsField:AdvancedTextInput;
        private var _17757503selectedFriendsCountLabel:Label;
        private var _909318622statusLabel:Label;
        private var _1167261832tileLayout:TileLayout;
        private var _1893287094titleDisplay:TitleDisplay;
        private var _713076478updateStatusCheckbox:CheckBox;
        private var _879608141userPicture:BitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_icons_facebook_default_avatar_png_135542103:Class;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:InviteFriendsScreenBase;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function FacebookInviteFriendsScreenSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._embed_mxml__images_icons_facebook_default_avatar_png_135542103 = FacebookInviteFriendsScreenSkin__embed_mxml__images_icons_facebook_default_avatar_png_135542103;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._FacebookInviteFriendsScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_invite_FacebookInviteFriendsScreenSkinWatcherSetupUtil");
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
            this.minWidth = 510;
            this.mxmlContent = [this._FacebookInviteFriendsScreenSkin_TitleDisplay1_i(), this._FacebookInviteFriendsScreenSkin_Group1_c(), this._FacebookInviteFriendsScreenSkin_VectorImage1_i()];
            this.currentState = "normal";
            var _FacebookInviteFriendsScreenSkin_VGroup1_factory:* = new DeferredInstanceFromFunction(this._FacebookInviteFriendsScreenSkin_VGroup1_i);
            var _FacebookInviteFriendsScreenSkin_VGroup2_factory:* = new DeferredInstanceFromFunction(this._FacebookInviteFriendsScreenSkin_VGroup2_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_FacebookInviteFriendsScreenSkin_VGroup2_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_FacebookInviteFriendsScreenSkin_VectorImage1"]}), new SetProperty().initializeFromObject({name:"height", value:500})]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_FacebookInviteFriendsScreenSkin_VGroup1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_FacebookInviteFriendsScreenSkin_VectorImage1"]})]})];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            if (this.tileLayout)
            {
            }
            if (!isNaN(param1))
            {
                this.tileLayout.columnWidth = Math.max(1, param1 / this.tileLayout.columnCount - 10);
            }
            return;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 60;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.id = "titleDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.titleDisplay = _loc_1;
            BindingManager.executeBindings(this, "titleDisplay", this.titleDisplay);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 3;
            _loc_1.top = 3;
            _loc_1.height = 52;
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Rect1_c(), this._FacebookInviteFriendsScreenSkin_BitmapImage1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._FacebookInviteFriendsScreenSkin_SolidColorStroke1_c();
            _loc_1.fill = this._FacebookInviteFriendsScreenSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13092807;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.source = this._embed_mxml__images_icons_facebook_default_avatar_png_135542103;
            _loc_1.initialized(this, "userPicture");
            this.userPicture = _loc_1;
            BindingManager.executeBindings(this, "userPicture", this.userPicture);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 40;
            _loc_1.top = 32;
            _loc_1.width = 24;
            _loc_1.height = 24;
            _loc_1.id = "_FacebookInviteFriendsScreenSkin_VectorImage1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._FacebookInviteFriendsScreenSkin_VectorImage1 = _loc_1;
            BindingManager.executeBindings(this, "_FacebookInviteFriendsScreenSkin_VectorImage1", this._FacebookInviteFriendsScreenSkin_VectorImage1);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.top = 70;
            _loc_1.paddingBottom = 20;
            _loc_1.horizontalCenter = 0;
            _loc_1.horizontalAlign = "center";
            _loc_1.mouseEnabled = false;
            _loc_1.mouseChildren = false;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Label1_i(), this._FacebookInviteFriendsScreenSkin_FacebookDistractorVisualElement1_i()];
            _loc_1.id = "_FacebookInviteFriendsScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._FacebookInviteFriendsScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_FacebookInviteFriendsScreenSkin_VGroup1", this._FacebookInviteFriendsScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "statusLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.statusLabel = _loc_1;
            BindingManager.executeBindings(this, "statusLabel", this.statusLabel);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_FacebookDistractorVisualElement1_i() : FacebookDistractorVisualElement
        {
            var _loc_1:* = new FacebookDistractorVisualElement();
            _loc_1.initialized(this, "loadingIndicator");
            this.loadingIndicator = _loc_1;
            BindingManager.executeBindings(this, "loadingIndicator", this.loadingIndicator);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 70;
            _loc_1.bottom = 0;
            _loc_1.gap = 15;
            _loc_1.paddingBottom = 10;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Group2_c(), this._FacebookInviteFriendsScreenSkin_Group3_c(), this._FacebookInviteFriendsScreenSkin_Group4_c(), this._FacebookInviteFriendsScreenSkin_Group5_c()];
            _loc_1.id = "_FacebookInviteFriendsScreenSkin_VGroup2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._FacebookInviteFriendsScreenSkin_VGroup2 = _loc_1;
            BindingManager.executeBindings(this, "_FacebookInviteFriendsScreenSkin_VGroup2", this._FacebookInviteFriendsScreenSkin_VGroup2);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Group2_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 33;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Label2_i(), this._FacebookInviteFriendsScreenSkin_AdvancedTextInput1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Label2_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.left = 15;
            _loc_1.width = 300;
            _loc_1.verticalCenter = 0;
            _loc_1.mouseEnabled = false;
            _loc_1.setStyle("lineBreak", "toFit");
            _loc_1.id = "friendsFoundLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.friendsFoundLabel = _loc_1;
            BindingManager.executeBindings(this, "friendsFoundLabel", this.friendsFoundLabel);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_AdvancedTextInput1_i() : AdvancedTextInput
        {
            var _loc_1:* = new AdvancedTextInput();
            _loc_1.styleName = "search";
            _loc_1.right = 15;
            _loc_1.width = 175;
            _loc_1.height = 33;
            _loc_1.top = 0;
            _loc_1.setStyle("fontSize", 12);
            _loc_1.id = "searchFriendsField";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.searchFriendsField = _loc_1;
            BindingManager.executeBindings(this, "searchFriendsField", this.searchFriendsField);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Group3_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Scroller1_c()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.viewport = this._FacebookInviteFriendsScreenSkin_MultipleSelectionList1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_MultipleSelectionList1_i() : MultipleSelectionList
        {
            var _loc_1:* = new MultipleSelectionList();
            _loc_1.percentWidth = 100;
            _loc_1.itemRenderer = this._FacebookInviteFriendsScreenSkin_ClassFactory1_c();
            _loc_1.layout = this._FacebookInviteFriendsScreenSkin_TileLayout1_i();
            _loc_1.id = "friendsList";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.friendsList = _loc_1;
            BindingManager.executeBindings(this, "friendsList", this.friendsList);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = InviteFriendsItemRenderer;
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_TileLayout1_i() : TileLayout
        {
            var _loc_1:* = new TileLayout();
            _loc_1.requestedColumnCount = 2;
            _loc_1.horizontalGap = 0;
            _loc_1.verticalGap = 0;
            _loc_1.columnAlign = "justifyUsingWidth";
            _loc_1.horizontalAlign = "justify";
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.useVirtualLayout = true;
            this.tileLayout = _loc_1;
            BindingManager.executeBindings(this, "tileLayout", this.tileLayout);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Group4_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.minHeight = 36;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_InviteMessageInput1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_InviteMessageInput1_i() : InviteMessageInput
        {
            var _loc_1:* = new InviteMessageInput();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.setStyle("fontSize", 12);
            _loc_1.setStyle("errorSkin", ErrorSkin);
            _loc_1.id = "inviteMessageInput";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.inviteMessageInput = _loc_1;
            BindingManager.executeBindings(this, "inviteMessageInput", this.inviteMessageInput);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Group5_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_VGroup3_c(), this._FacebookInviteFriendsScreenSkin_Button1_i(), this._FacebookInviteFriendsScreenSkin_IconToggleButton1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_VGroup3_c() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 15;
            _loc_1.verticalCenter = 0;
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._FacebookInviteFriendsScreenSkin_Label3_i(), this._FacebookInviteFriendsScreenSkin_CheckBox1_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Label3_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.id = "selectedFriendsCountLabel";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.selectedFriendsCountLabel = _loc_1;
            BindingManager.executeBindings(this, "selectedFriendsCountLabel", this.selectedFriendsCountLabel);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_CheckBox1_i() : CheckBox
        {
            var _loc_1:* = new CheckBox();
            _loc_1.id = "updateStatusCheckbox";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.updateStatusCheckbox = _loc_1;
            BindingManager.executeBindings(this, "updateStatusCheckbox", this.updateStatusCheckbox);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_Button1_i() : Button
        {
            var _loc_1:* = new Button();
            _loc_1.width = 120;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "confirm";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.confirm = _loc_1;
            BindingManager.executeBindings(this, "confirm", this.confirm);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_IconToggleButton1_i() : IconToggleButton
        {
            var _loc_1:* = new IconToggleButton();
            _loc_1.width = 120;
            _loc_1.right = 12;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "batchSelect";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.batchSelect = _loc_1;
            BindingManager.executeBindings(this, "batchSelect", this.batchSelect);
            return _loc_1;
        }// end function

        private function _FacebookInviteFriendsScreenSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return FacebookSquareLogo;
            }// end function
            , null, "_FacebookInviteFriendsScreenSkin_VectorImage1.source");
            return result;
        }// end function

        public function get batchSelect() : IconToggleButton
        {
            return this._77388586batchSelect;
        }// end function

        public function set batchSelect(param1:IconToggleButton) : void
        {
            var _loc_2:* = this._77388586batchSelect;
            if (_loc_2 !== param1)
            {
                this._77388586batchSelect = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "batchSelect", _loc_2, param1));
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

        public function get friendsFoundLabel() : Label
        {
            return this._399947769friendsFoundLabel;
        }// end function

        public function set friendsFoundLabel(param1:Label) : void
        {
            var _loc_2:* = this._399947769friendsFoundLabel;
            if (_loc_2 !== param1)
            {
                this._399947769friendsFoundLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendsFoundLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get friendsList() : MultipleSelectionList
        {
            return this._1405524947friendsList;
        }// end function

        public function set friendsList(param1:MultipleSelectionList) : void
        {
            var _loc_2:* = this._1405524947friendsList;
            if (_loc_2 !== param1)
            {
                this._1405524947friendsList = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "friendsList", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get inviteMessageInput() : InviteMessageInput
        {
            return this._1261015468inviteMessageInput;
        }// end function

        public function set inviteMessageInput(param1:InviteMessageInput) : void
        {
            var _loc_2:* = this._1261015468inviteMessageInput;
            if (_loc_2 !== param1)
            {
                this._1261015468inviteMessageInput = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteMessageInput", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get loadingIndicator() : FacebookDistractorVisualElement
        {
            return this._1735090125loadingIndicator;
        }// end function

        public function set loadingIndicator(param1:FacebookDistractorVisualElement) : void
        {
            var _loc_2:* = this._1735090125loadingIndicator;
            if (_loc_2 !== param1)
            {
                this._1735090125loadingIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadingIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get searchFriendsField() : AdvancedTextInput
        {
            return this._151689773searchFriendsField;
        }// end function

        public function set searchFriendsField(param1:AdvancedTextInput) : void
        {
            var _loc_2:* = this._151689773searchFriendsField;
            if (_loc_2 !== param1)
            {
                this._151689773searchFriendsField = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "searchFriendsField", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get selectedFriendsCountLabel() : Label
        {
            return this._17757503selectedFriendsCountLabel;
        }// end function

        public function set selectedFriendsCountLabel(param1:Label) : void
        {
            var _loc_2:* = this._17757503selectedFriendsCountLabel;
            if (_loc_2 !== param1)
            {
                this._17757503selectedFriendsCountLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectedFriendsCountLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get statusLabel() : Label
        {
            return this._909318622statusLabel;
        }// end function

        public function set statusLabel(param1:Label) : void
        {
            var _loc_2:* = this._909318622statusLabel;
            if (_loc_2 !== param1)
            {
                this._909318622statusLabel = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statusLabel", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get tileLayout() : TileLayout
        {
            return this._1167261832tileLayout;
        }// end function

        public function set tileLayout(param1:TileLayout) : void
        {
            var _loc_2:* = this._1167261832tileLayout;
            if (_loc_2 !== param1)
            {
                this._1167261832tileLayout = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tileLayout", _loc_2, param1));
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

        public function get updateStatusCheckbox() : CheckBox
        {
            return this._713076478updateStatusCheckbox;
        }// end function

        public function set updateStatusCheckbox(param1:CheckBox) : void
        {
            var _loc_2:* = this._713076478updateStatusCheckbox;
            if (_loc_2 !== param1)
            {
                this._713076478updateStatusCheckbox = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "updateStatusCheckbox", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get userPicture() : BitmapImage
        {
            return this._879608141userPicture;
        }// end function

        public function set userPicture(param1:BitmapImage) : void
        {
            var _loc_2:* = this._879608141userPicture;
            if (_loc_2 !== param1)
            {
                this._879608141userPicture = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userPicture", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : InviteFriendsScreenBase
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:InviteFriendsScreenBase) : void
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
