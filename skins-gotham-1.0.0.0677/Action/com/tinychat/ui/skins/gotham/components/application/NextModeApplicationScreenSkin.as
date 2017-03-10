package com.tinychat.ui.skins.gotham.components.application
{
    import com.tinychat.ui.components.application.*;
    import com.tinychat.ui.components.broadcast.lists.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.fullscreen.*;
    import com.tinychat.ui.components.social.buttonbar.*;
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.components.social.userlist.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.trial.*;
    import com.tinychat.ui.skins.gotham.components.controlbar.*;
    import com.tinychat.ui.skins.gotham.components.controlbar.buttons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.containers.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class NextModeApplicationScreenSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _NextModeApplicationScreenSkin_AndroidPromoButton1:AndroidPromoButton;
        public var _NextModeApplicationScreenSkin_BitmapImage1:BitmapImage;
        public var _NextModeApplicationScreenSkin_ControlBarFiller1:ControlBarFiller;
        public var _NextModeApplicationScreenSkin_EnterFullScreenButton1:EnterFullScreenButton;
        public var _NextModeApplicationScreenSkin_EnterFullScreenButton2:EnterFullScreenButton;
        private var _1706027379_NextModeApplicationScreenSkin_Group1:Group;
        public var _NextModeApplicationScreenSkin_Group2:Group;
        private var _1706027377_NextModeApplicationScreenSkin_Group3:Group;
        private var _1706027376_NextModeApplicationScreenSkin_Group4:Group;
        public var _NextModeApplicationScreenSkin_HGroup2:HGroup;
        private var _1688192383_NextModeApplicationScreenSkin_HGroup3:HGroup;
        private var _1688192381_NextModeApplicationScreenSkin_HGroup5:HGroup;
        private var _1688192380_NextModeApplicationScreenSkin_HGroup6:HGroup;
        public var _NextModeApplicationScreenSkin_IosPromoButton1:IosPromoButton;
        private var _939652492_NextModeApplicationScreenSkin_NavigatorContent1:NavigatorContent;
        public var _NextModeApplicationScreenSkin_Rect1:Rect;
        private var _1008682879_NextModeApplicationScreenSkin_SkinnableContainer2:SkinnableContainer;
        public var _NextModeApplicationScreenSkin_SkinnableContainer4:SkinnableContainer;
        private var _1008682876_NextModeApplicationScreenSkin_SkinnableContainer5:SkinnableContainer;
        private var _1008682875_NextModeApplicationScreenSkin_SkinnableContainer6:SkinnableContainer;
        private var _1008682873_NextModeApplicationScreenSkin_SkinnableContainer8:SkinnableContainer;
        public var _NextModeApplicationScreenSkin_SnapshotButton1:SnapshotButton;
        public var _NextModeApplicationScreenSkin_SnapshotButton2:SnapshotButton;
        public var _NextModeApplicationScreenSkin_SoundCloudButton2:SoundCloudButton;
        public var _NextModeApplicationScreenSkin_TrialButtonBar1:TrialButtonBar;
        private var _2146924557_NextModeApplicationScreenSkin_VGroup1:VGroup;
        public var _NextModeApplicationScreenSkin_WhiteboardButton1:WhiteboardButton;
        public var _NextModeApplicationScreenSkin_WhiteboardButton2:WhiteboardButton;
        public var _NextModeApplicationScreenSkin_YouTubeButton2:YouTubeButton;
        private var _585363085applicationVolumeControl:ApplicationVolumeControl;
        private var _1014907915chatListButtonBar:SocialButtonBar;
        private var _1437455901chatView:VGroup;
        private var _1848883605chatViewStack:ViewStack;
        private var _1906443829columnContainer:HGroup;
        private var _1715803780controlBar2:HGroup;
        private var _1655307837leftColumn:SkinnableContainer;
        private var _1345708131listView:Group;
        private var _261763201microphoneModeButton:MicrophoneModeButton;
        private var _1749722107nextButton:NextButton;
        private var _1578736024playSounds:PlaySoundsCheckbox;
        private var _953756864privateChatView:PrivateChatView;
        private var _2005234598publicChatView:PublicChatView;
        private var _838339528receiveNotices:ReceiveNoticesCheckbox;
        private var _873431918rightColumn:SkinnableContainer;
        private var _1559672172socialButtonBar:SocialButtonBar;
        private var _1139640822socialViewStack:ViewStack;
        private var _567209395videoCanvas:RoomBroadcastCanvas;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _embed_mxml__images_tinychat_logo_png_13009688:Class;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:ApplicationScreen;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function NextModeApplicationScreenSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._embed_mxml__images_tinychat_logo_png_13009688 = NextModeApplicationScreenSkin__embed_mxml__images_tinychat_logo_png_13009688;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._NextModeApplicationScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_application_NextModeApplicationScreenSkinWatcherSetupUtil");
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
            this.mxmlContent = [this._NextModeApplicationScreenSkin_HGroup1_i()];
            this.currentState = "chatRight";
            var _NextModeApplicationScreenSkin_AndroidPromoButton1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_AndroidPromoButton1_i);
            var _NextModeApplicationScreenSkin_BitmapImage1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_BitmapImage1_i);
            var _NextModeApplicationScreenSkin_EnterFullScreenButton1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_EnterFullScreenButton1_i);
            var _NextModeApplicationScreenSkin_EnterFullScreenButton2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_EnterFullScreenButton2_i);
            var _NextModeApplicationScreenSkin_Group2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Group2_i);
            var _NextModeApplicationScreenSkin_Group4_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Group4_i);
            var _NextModeApplicationScreenSkin_Group5_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Group5_i);
            var _NextModeApplicationScreenSkin_HGroup2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_HGroup2_i);
            var _NextModeApplicationScreenSkin_HGroup4_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_HGroup4_i);
            var _NextModeApplicationScreenSkin_IosPromoButton1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_IosPromoButton1_i);
            var _NextModeApplicationScreenSkin_PrivateChatView1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_PrivateChatView1_i);
            var _NextModeApplicationScreenSkin_PublicChatView1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_PublicChatView1_i);
            var _NextModeApplicationScreenSkin_Rect1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Rect1_i);
            var _NextModeApplicationScreenSkin_SkinnableContainer4_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_SkinnableContainer4_i);
            var _NextModeApplicationScreenSkin_SkinnableContainer7_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_SkinnableContainer7_i);
            var _NextModeApplicationScreenSkin_SnapshotButton1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_SnapshotButton1_i);
            var _NextModeApplicationScreenSkin_SnapshotButton2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_SnapshotButton2_i);
            var _NextModeApplicationScreenSkin_SoundCloudButton2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_SoundCloudButton2_i);
            var _NextModeApplicationScreenSkin_TrialButtonBar1_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_TrialButtonBar1_i);
            var _NextModeApplicationScreenSkin_VGroup2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_VGroup2_i);
            var _NextModeApplicationScreenSkin_WhiteboardButton2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_WhiteboardButton2_i);
            var _NextModeApplicationScreenSkin_YouTubeButton2_factory:* = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_YouTubeButton2_i);
            states = [new State({name:"chatRight", stateGroups:["chatRightStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group5_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer8", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SkinnableContainer7_factory, destination:"columnContainer", propertyName:"mxmlContent", position:"after", relativeTo:["leftColumn"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SnapshotButton2_factory, destination:"_NextModeApplicationScreenSkin_HGroup5", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_EnterFullScreenButton2_factory, destination:"_NextModeApplicationScreenSkin_HGroup5", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_WhiteboardButton2_factory, destination:"_NextModeApplicationScreenSkin_HGroup5", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SoundCloudButton2_factory, destination:"_NextModeApplicationScreenSkin_HGroup5", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_YouTubeButton2_factory, destination:"_NextModeApplicationScreenSkin_HGroup5", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup4_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_TrialButtonBar1_factory, destination:"leftColumn", position:"after", relativeTo:["_NextModeApplicationScreenSkin_SkinnableContainer2"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Rect1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_HGroup6", name:"visible", value:false}), new SetProperty().initializeFromObject({target:"socialViewStack", name:"visible", value:false})]}), new State({name:"chatOnlyRight", stateGroups:["chatOnlyStates", "chatRightStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group5_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer8", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SkinnableContainer7_factory, destination:"columnContainer", propertyName:"mxmlContent", position:"after", relativeTo:["leftColumn"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup4_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PrivateChatView1_factory, destination:"_NextModeApplicationScreenSkin_Group3", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PublicChatView1_factory, destination:"_NextModeApplicationScreenSkin_NavigatorContent1", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_VGroup2_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_TrialButtonBar1_factory, destination:"leftColumn", position:"after", relativeTo:["_NextModeApplicationScreenSkin_SkinnableContainer2"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Rect1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer2", name:"height", value:43}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer5", name:"percentHeight", value:100})]}), new State({name:"chatBelow", stateGroups:["chatBelowStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group5_factory, destination:"_NextModeApplicationScreenSkin_Group4", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group4_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer5", position:"after", relativeTo:["_NextModeApplicationScreenSkin_VGroup1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_BitmapImage1_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer6", position:"after", relativeTo:["_NextModeApplicationScreenSkin_ControlBarFiller1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup4_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PrivateChatView1_factory, destination:"_NextModeApplicationScreenSkin_Group3", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PublicChatView1_factory, destination:"_NextModeApplicationScreenSkin_NavigatorContent1", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SnapshotButton1_factory, destination:"_NextModeApplicationScreenSkin_HGroup3", propertyName:"mxmlContent", position:"after", relativeTo:["_NextModeApplicationScreenSkin_WhiteboardButton1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_EnterFullScreenButton1_factory, destination:"_NextModeApplicationScreenSkin_HGroup3", propertyName:"mxmlContent", position:"after", relativeTo:["_NextModeApplicationScreenSkin_WhiteboardButton1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_VGroup2_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_TrialButtonBar1_factory, destination:"leftColumn", position:"after", relativeTo:["_NextModeApplicationScreenSkin_SkinnableContainer2"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_AndroidPromoButton1_factory, destination:"_NextModeApplicationScreenSkin_Group1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_IosPromoButton1_factory, destination:"_NextModeApplicationScreenSkin_Group1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Rect1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer5", name:"height", value:300})]}), new State({name:"chatOnlyBelow", stateGroups:["chatOnlyStates", "chatBelowStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group5_factory, destination:"_NextModeApplicationScreenSkin_Group4", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group4_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer5", position:"after", relativeTo:["_NextModeApplicationScreenSkin_VGroup1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_BitmapImage1_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer6", position:"after", relativeTo:["_NextModeApplicationScreenSkin_ControlBarFiller1"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup4_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PrivateChatView1_factory, destination:"_NextModeApplicationScreenSkin_Group3", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PublicChatView1_factory, destination:"_NextModeApplicationScreenSkin_NavigatorContent1", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_VGroup2_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_TrialButtonBar1_factory, destination:"leftColumn", position:"after", relativeTo:["_NextModeApplicationScreenSkin_SkinnableContainer2"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_AndroidPromoButton1_factory, destination:"_NextModeApplicationScreenSkin_Group1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_IosPromoButton1_factory, destination:"_NextModeApplicationScreenSkin_Group1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_HGroup2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Rect1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer2", name:"height", value:43}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer5", name:"percentHeight", value:100})]}), new State({name:"videoOnly", overrides:[new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PrivateChatView1_factory, destination:"_NextModeApplicationScreenSkin_Group3", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_PublicChatView1_factory, destination:"_NextModeApplicationScreenSkin_NavigatorContent1", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_VGroup2_factory, destination:"_NextModeApplicationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_SkinnableContainer4_factory, destination:"leftColumn", position:"after", relativeTo:["_NextModeApplicationScreenSkin_SkinnableContainer2"]}), new AddItems().initializeFromObject({itemsFactory:_NextModeApplicationScreenSkin_Group2_factory, destination:"_NextModeApplicationScreenSkin_SkinnableContainer2", position:"first"}), new SetProperty().initializeFromObject({target:"columnContainer", name:"left", value:0}), new SetProperty().initializeFromObject({target:"columnContainer", name:"right", value:0}), new SetProperty().initializeFromObject({target:"columnContainer", name:"top", value:0}), new SetProperty().initializeFromObject({target:"columnContainer", name:"bottom", value:0}), new SetProperty().initializeFromObject({target:"_NextModeApplicationScreenSkin_SkinnableContainer5", name:"percentHeight", value:40})]})];
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

        private function _NextModeApplicationScreenSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._NextModeApplicationScreenSkin_LinearGradient1_c();
            _loc_1.initialized(this, "_NextModeApplicationScreenSkin_Rect1");
            this._NextModeApplicationScreenSkin_Rect1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_Rect1", this._NextModeApplicationScreenSkin_Rect1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_LinearGradient1_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._NextModeApplicationScreenSkin_GradientEntry1_c(), this._NextModeApplicationScreenSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5921370;
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 7;
            _loc_1.right = 7;
            _loc_1.top = 7;
            _loc_1.bottom = 7;
            _loc_1.verticalAlign = "justify";
            _loc_1.gap = 3;
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_SkinnableContainer1_i()];
            _loc_1.id = "columnContainer";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.columnContainer = _loc_1;
            BindingManager.executeBindings(this, "columnContainer", this.columnContainer);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer1_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.percentWidth = 100;
            _loc_1.styleName = "viewContainer";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array9_c);
            _loc_1.id = "leftColumn";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.leftColumn = _loc_1;
            BindingManager.executeBindings(this, "leftColumn", this.leftColumn);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array9_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_SkinnableContainer2_i(), this._NextModeApplicationScreenSkin_SkinnableContainer5_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer2_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.percentHeight = 100;
            _loc_1.styleName = "view";
            _loc_1.mouseEnabled = false;
            _loc_1.layout = this._NextModeApplicationScreenSkin_VerticalLayout1_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array10_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_SkinnableContainer2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SkinnableContainer2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SkinnableContainer2", this._NextModeApplicationScreenSkin_SkinnableContainer2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_VerticalLayout1_c() : VerticalLayout
        {
            var _loc_1:* = new VerticalLayout();
            _loc_1.gap = 1;
            _loc_1.horizontalAlign = "justify";
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array10_c() : Array
        {
            var _loc_1:Array = [];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup2_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.height = 41;
            _loc_1.gap = 0;
            _loc_1.verticalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_SkinnableContainer3_c(), this._NextModeApplicationScreenSkin_OptionsControlBar1_c()];
            _loc_1.id = "_NextModeApplicationScreenSkin_HGroup2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_HGroup2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_HGroup2", this._NextModeApplicationScreenSkin_HGroup2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer3_c() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.styleName = "controlBar";
            _loc_1.mouseEnabled = false;
            _loc_1.layout = this._NextModeApplicationScreenSkin_HorizontalLayout1_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array12_c);
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HorizontalLayout1_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.paddingLeft = 4;
            _loc_1.paddingRight = 4;
            _loc_1.paddingTop = -1;
            _loc_1.gap = 5;
            _loc_1.verticalAlign = "middle";
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array12_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_NextButton1_i(), this._NextModeApplicationScreenSkin_MicrophoneModeButton1_i(), this._NextModeApplicationScreenSkin_Rect2_c(), this._NextModeApplicationScreenSkin_Group1_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_NextButton1_i() : NextButton
        {
            var _loc_1:* = new NextButton();
            _loc_1.width = 150;
            _loc_1.height = 33;
            _loc_1.styleName = "nextButton group";
            _loc_1.id = "nextButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nextButton = _loc_1;
            BindingManager.executeBindings(this, "nextButton", this.nextButton);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_MicrophoneModeButton1_i() : MicrophoneModeButton
        {
            var _loc_1:* = new MicrophoneModeButton();
            _loc_1.width = 150;
            _loc_1.height = 33;
            _loc_1.styleName = "microphoneModeButton group";
            _loc_1.id = "microphoneModeButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.microphoneModeButton = _loc_1;
            BindingManager.executeBindings(this, "microphoneModeButton", this.microphoneModeButton);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.width = 5;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.mxmlContent = [];
            _loc_1.id = "_NextModeApplicationScreenSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_Group1", this._NextModeApplicationScreenSkin_Group1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_IosPromoButton1_i() : IosPromoButton
        {
            var _loc_1:* = new IosPromoButton();
            _loc_1.styleName = "iosPromoButton";
            _loc_1.left = 0;
            _loc_1.width = 24;
            _loc_1.height = 24;
            _loc_1.id = "_NextModeApplicationScreenSkin_IosPromoButton1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_IosPromoButton1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_IosPromoButton1", this._NextModeApplicationScreenSkin_IosPromoButton1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_AndroidPromoButton1_i() : AndroidPromoButton
        {
            var _loc_1:* = new AndroidPromoButton();
            _loc_1.styleName = "androidPromoButton";
            _loc_1.left = 29;
            _loc_1.width = 24;
            _loc_1.height = 24;
            _loc_1.id = "_NextModeApplicationScreenSkin_AndroidPromoButton1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_AndroidPromoButton1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_AndroidPromoButton1", this._NextModeApplicationScreenSkin_AndroidPromoButton1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_OptionsControlBar1_c() : OptionsControlBar
        {
            var _loc_1:* = new OptionsControlBar();
            _loc_1.percentWidth = 100;
            _loc_1.mouseEnabled = false;
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentHeight = 100;
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_Rect3_c(), this._NextModeApplicationScreenSkin_RoomBroadcastCanvas1_i()];
            _loc_1.id = "_NextModeApplicationScreenSkin_Group2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_Group2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_Group2", this._NextModeApplicationScreenSkin_Group2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._NextModeApplicationScreenSkin_LinearGradient2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_LinearGradient2_c() : LinearGradient
        {
            var _loc_1:* = new LinearGradient();
            _loc_1.rotation = 90;
            _loc_1.entries = [this._NextModeApplicationScreenSkin_GradientEntry3_c(), this._NextModeApplicationScreenSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5263440;
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 5000268;
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_RoomBroadcastCanvas1_i() : RoomBroadcastCanvas
        {
            var _loc_1:* = new RoomBroadcastCanvas();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "videoCanvas";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.videoCanvas = _loc_1;
            BindingManager.executeBindings(this, "videoCanvas", this.videoCanvas);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer4_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.height = 33;
            _loc_1.styleName = "view";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array16_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_SkinnableContainer4";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SkinnableContainer4 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SkinnableContainer4", this._NextModeApplicationScreenSkin_SkinnableContainer4);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array16_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_ExitFullScreenButton1_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ExitFullScreenButton1_c() : ExitFullScreenButton
        {
            var _loc_1:* = new ExitFullScreenButton();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.styleName = "exitFullScreenButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_TrialButtonBar1_i() : TrialButtonBar
        {
            var _loc_1:* = new TrialButtonBar();
            _loc_1.height = 29;
            _loc_1.styleName = "view";
            _loc_1.mouseEnabled = false;
            _loc_1.layout = this._NextModeApplicationScreenSkin_HorizontalLayout2_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array17_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_TrialButtonBar1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_TrialButtonBar1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_TrialButtonBar1", this._NextModeApplicationScreenSkin_TrialButtonBar1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HorizontalLayout2_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.gap = -1;
            _loc_1.verticalAlign = "justify";
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array17_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_TrialButton1_c(), this._NextModeApplicationScreenSkin_UpgradeButton1_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_TrialButton1_c() : TrialButton
        {
            var _loc_1:* = new TrialButton();
            _loc_1.percentWidth = 100;
            _loc_1.styleName = "trialButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_UpgradeButton1_c() : UpgradeButton
        {
            var _loc_1:* = new UpgradeButton();
            _loc_1.maxWidth = 200;
            _loc_1.minWidth = 100;
            _loc_1.styleName = "upgradeButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer5_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.styleName = "view";
            _loc_1.mouseEnabled = false;
            _loc_1.layout = this._NextModeApplicationScreenSkin_HorizontalLayout3_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array18_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_SkinnableContainer5";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SkinnableContainer5 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SkinnableContainer5", this._NextModeApplicationScreenSkin_SkinnableContainer5);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HorizontalLayout3_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array18_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_VGroup1_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.gap = 1;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [];
            _loc_1.id = "_NextModeApplicationScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_VGroup1", this._NextModeApplicationScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentHeight = 100;
            _loc_1.gap = 1;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_HGroup3_i(), this._NextModeApplicationScreenSkin_ViewStack1_i()];
            _loc_1.id = "chatView";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatView = _loc_1;
            BindingManager.executeBindings(this, "chatView", this.chatView);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup3_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.height = 41;
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.styleName = "controlBar";
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_SocialButtonBar1_i(), this._NextModeApplicationScreenSkin_YouTubeButton1_c(), this._NextModeApplicationScreenSkin_SoundCloudButton1_c(), this._NextModeApplicationScreenSkin_WhiteboardButton1_i()];
            _loc_1.id = "_NextModeApplicationScreenSkin_HGroup3";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_HGroup3 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_HGroup3", this._NextModeApplicationScreenSkin_HGroup3);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SocialButtonBar1_i() : SocialButtonBar
        {
            var _loc_1:* = new SocialButtonBar();
            _loc_1.percentWidth = 100;
            _loc_1.mouseEnabled = false;
            _loc_1.id = "chatListButtonBar";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatListButtonBar = _loc_1;
            BindingManager.executeBindings(this, "chatListButtonBar", this.chatListButtonBar);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_YouTubeButton1_c() : YouTubeButton
        {
            var _loc_1:* = new YouTubeButton();
            _loc_1.width = 42;
            _loc_1.styleName = "youTubeButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SoundCloudButton1_c() : SoundCloudButton
        {
            var _loc_1:* = new SoundCloudButton();
            _loc_1.width = 42;
            _loc_1.styleName = "soundCloudButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_WhiteboardButton1_i() : WhiteboardButton
        {
            var _loc_1:* = new WhiteboardButton();
            _loc_1.width = 42;
            _loc_1.styleName = "whiteboardButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_WhiteboardButton1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_WhiteboardButton1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_WhiteboardButton1", this._NextModeApplicationScreenSkin_WhiteboardButton1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_EnterFullScreenButton1_i() : EnterFullScreenButton
        {
            var _loc_1:* = new EnterFullScreenButton();
            _loc_1.minWidth = 42;
            _loc_1.styleName = "enterFullScreenButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_EnterFullScreenButton1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_EnterFullScreenButton1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_EnterFullScreenButton1", this._NextModeApplicationScreenSkin_EnterFullScreenButton1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SnapshotButton1_i() : SnapshotButton
        {
            var _loc_1:* = new SnapshotButton();
            _loc_1.minWidth = 42;
            _loc_1.styleName = "snapshotButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_SnapshotButton1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SnapshotButton1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SnapshotButton1", this._NextModeApplicationScreenSkin_SnapshotButton1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ViewStack1_i() : ViewStack
        {
            var temp:* = new ViewStack();
            temp.percentHeight = 100;
            temp.mouseEnabled = false;
            temp.id = "chatViewStack";
            if (!temp.document)
            {
                temp.document = this;
            }
            mx_internal::_documentDescriptor = new UIComponentDescriptor({type:ViewStack, id:"chatViewStack", propertiesFactory:function () : Object
            {
                return {childDescriptors:[new UIComponentDescriptor({type:NavigatorContent, id:"_NextModeApplicationScreenSkin_NavigatorContent1", propertiesFactory:function () : Object
                {
                    return {percentWidth:100, name:"publicChatListContainer", styleName:"socialContentContainer", mouseEnabled:false, mxmlContentFactory:new DeferredInstanceFromFunction(_NextModeApplicationScreenSkin_Array22_c)};
                }// end function
                }), new UIComponentDescriptor({type:AdvancedNavigatorContent, propertiesFactory:function () : Object
                {
                    return {percentWidth:100, name:"privateChatListContainer", styleName:"socialContentContainer", mouseEnabled:false, mxmlContentFactory:new DeferredInstanceFromFunction(_NextModeApplicationScreenSkin_Array23_c)};
                }// end function
                })]};
            }// end function
            });
            mx_internal::_documentDescriptor.document = this;
            this.chatViewStack = temp;
            BindingManager.executeBindings(this, "chatViewStack", this.chatViewStack);
            return temp;
        }// end function

        private function _NextModeApplicationScreenSkin_Array22_c() : Array
        {
            var _loc_1:Array = [];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_PublicChatView1_i() : PublicChatView
        {
            var _loc_1:* = new PublicChatView();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.id = "publicChatView";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.publicChatView = _loc_1;
            BindingManager.executeBindings(this, "publicChatView", this.publicChatView);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array23_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_Group3_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Group3_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.mxmlContent = [];
            _loc_1.id = "_NextModeApplicationScreenSkin_Group3";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_Group3 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_Group3", this._NextModeApplicationScreenSkin_Group3);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_PrivateChatView1_i() : PrivateChatView
        {
            var _loc_1:* = new PrivateChatView();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.id = "privateChatView";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.privateChatView = _loc_1;
            BindingManager.executeBindings(this, "privateChatView", this.privateChatView);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup4_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.percentWidth = 100;
            _loc_1.height = 30;
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_SkinnableContainer6_i(), this._NextModeApplicationScreenSkin_HGroup5_i()];
            _loc_1.id = "controlBar2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.controlBar2 = _loc_1;
            BindingManager.executeBindings(this, "controlBar2", this.controlBar2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer6_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.percentWidth = 100;
            _loc_1.styleName = "controlBar";
            _loc_1.mouseEnabled = false;
            _loc_1.layout = this._NextModeApplicationScreenSkin_HorizontalLayout4_c();
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array26_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_SkinnableContainer6";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SkinnableContainer6 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SkinnableContainer6", this._NextModeApplicationScreenSkin_SkinnableContainer6);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HorizontalLayout4_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.verticalAlign = "middle";
            _loc_1.gap = 10;
            _loc_1.paddingLeft = 5;
            _loc_1.paddingRight = 10;
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array26_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_ReceiveNoticesCheckbox1_i(), this._NextModeApplicationScreenSkin_PlaySoundsCheckbox1_i(), this._NextModeApplicationScreenSkin_ControlBarFiller1_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ReceiveNoticesCheckbox1_i() : ReceiveNoticesCheckbox
        {
            var _loc_1:* = new ReceiveNoticesCheckbox();
            _loc_1.id = "receiveNotices";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.receiveNotices = _loc_1;
            BindingManager.executeBindings(this, "receiveNotices", this.receiveNotices);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_PlaySoundsCheckbox1_i() : PlaySoundsCheckbox
        {
            var _loc_1:* = new PlaySoundsCheckbox();
            _loc_1.id = "playSounds";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.playSounds = _loc_1;
            BindingManager.executeBindings(this, "playSounds", this.playSounds);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ControlBarFiller1_i() : ControlBarFiller
        {
            var _loc_1:* = new ControlBarFiller();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.initialized(this, "_NextModeApplicationScreenSkin_ControlBarFiller1");
            this._NextModeApplicationScreenSkin_ControlBarFiller1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_ControlBarFiller1", this._NextModeApplicationScreenSkin_ControlBarFiller1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_BitmapImage1_i() : BitmapImage
        {
            var _loc_1:* = new BitmapImage();
            _loc_1.source = this._embed_mxml__images_tinychat_logo_png_13009688;
            _loc_1.initialized(this, "_NextModeApplicationScreenSkin_BitmapImage1");
            this._NextModeApplicationScreenSkin_BitmapImage1 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_BitmapImage1", this._NextModeApplicationScreenSkin_BitmapImage1);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup5_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            _loc_1.horizontalAlign = "right";
            _loc_1.columnWidth = 40;
            _loc_1.variableColumnWidth = false;
            _loc_1.styleName = "controlBar";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_ApplicationVolumeControl1_i()];
            _loc_1.id = "_NextModeApplicationScreenSkin_HGroup5";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_HGroup5 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_HGroup5", this._NextModeApplicationScreenSkin_HGroup5);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_YouTubeButton2_i() : YouTubeButton
        {
            var _loc_1:* = new YouTubeButton();
            _loc_1.styleName = "youTubeButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_YouTubeButton2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_YouTubeButton2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_YouTubeButton2", this._NextModeApplicationScreenSkin_YouTubeButton2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SoundCloudButton2_i() : SoundCloudButton
        {
            var _loc_1:* = new SoundCloudButton();
            _loc_1.styleName = "soundCloudButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_SoundCloudButton2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SoundCloudButton2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SoundCloudButton2", this._NextModeApplicationScreenSkin_SoundCloudButton2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_WhiteboardButton2_i() : WhiteboardButton
        {
            var _loc_1:* = new WhiteboardButton();
            _loc_1.styleName = "whiteboardButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_WhiteboardButton2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_WhiteboardButton2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_WhiteboardButton2", this._NextModeApplicationScreenSkin_WhiteboardButton2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_EnterFullScreenButton2_i() : EnterFullScreenButton
        {
            var _loc_1:* = new EnterFullScreenButton();
            _loc_1.showLabel = false;
            _loc_1.styleName = "enterFullScreenButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_EnterFullScreenButton2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_EnterFullScreenButton2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_EnterFullScreenButton2", this._NextModeApplicationScreenSkin_EnterFullScreenButton2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SnapshotButton2_i() : SnapshotButton
        {
            var _loc_1:* = new SnapshotButton();
            _loc_1.showLabel = false;
            _loc_1.styleName = "snapshotButton";
            _loc_1.id = "_NextModeApplicationScreenSkin_SnapshotButton2";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SnapshotButton2 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SnapshotButton2", this._NextModeApplicationScreenSkin_SnapshotButton2);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ApplicationVolumeControl1_i() : ApplicationVolumeControl
        {
            var _loc_1:* = new ApplicationVolumeControl();
            _loc_1.styleName = "applicationVolumeControl";
            _loc_1.id = "applicationVolumeControl";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.applicationVolumeControl = _loc_1;
            BindingManager.executeBindings(this, "applicationVolumeControl", this.applicationVolumeControl);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Group4_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.width = 170;
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [];
            _loc_1.id = "_NextModeApplicationScreenSkin_Group4";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_Group4 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_Group4", this._NextModeApplicationScreenSkin_Group4);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer7_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.width = 258;
            _loc_1.styleName = "viewContainer";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array29_c);
            _loc_1.id = "rightColumn";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.rightColumn = _loc_1;
            BindingManager.executeBindings(this, "rightColumn", this.rightColumn);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array29_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_SkinnableContainer8_i()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SkinnableContainer8_i() : SkinnableContainer
        {
            var _loc_1:* = new SkinnableContainer();
            _loc_1.percentHeight = 100;
            _loc_1.styleName = "view";
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContentFactory = new DeferredInstanceFromFunction(this._NextModeApplicationScreenSkin_Array30_c);
            _loc_1.id = "_NextModeApplicationScreenSkin_SkinnableContainer8";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_SkinnableContainer8 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_SkinnableContainer8", this._NextModeApplicationScreenSkin_SkinnableContainer8);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array30_c() : Array
        {
            var _loc_1:Array = [];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Group5_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.mouseEnabled = false;
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_HGroup6_i(), this._NextModeApplicationScreenSkin_LayoutChangeButton1_c(), this._NextModeApplicationScreenSkin_ViewStack2_i()];
            _loc_1.id = "listView";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.listView = _loc_1;
            BindingManager.executeBindings(this, "listView", this.listView);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_HGroup6_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 41;
            _loc_1.gap = 1;
            _loc_1.verticalAlign = "justify";
            _loc_1.mouseEnabled = false;
            _loc_1.styleName = "controlBar";
            _loc_1.mxmlContent = [this._NextModeApplicationScreenSkin_SocialButtonBar2_i()];
            _loc_1.id = "_NextModeApplicationScreenSkin_HGroup6";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._NextModeApplicationScreenSkin_HGroup6 = _loc_1;
            BindingManager.executeBindings(this, "_NextModeApplicationScreenSkin_HGroup6", this._NextModeApplicationScreenSkin_HGroup6);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_SocialButtonBar2_i() : SocialButtonBar
        {
            var _loc_1:* = new SocialButtonBar();
            _loc_1.percentWidth = 100;
            _loc_1.id = "socialButtonBar";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.socialButtonBar = _loc_1;
            BindingManager.executeBindings(this, "socialButtonBar", this.socialButtonBar);
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_LayoutChangeButton1_c() : LayoutChangeButton
        {
            var _loc_1:* = new LayoutChangeButton();
            _loc_1.width = 13;
            _loc_1.height = 11;
            _loc_1.left = -1;
            _loc_1.top = -1;
            _loc_1.setStyle("skinClass", LayoutChangeButtonSkin);
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_ViewStack2_i() : ViewStack
        {
            var temp:* = new ViewStack();
            temp.left = 0;
            temp.right = 0;
            temp.top = 42;
            temp.bottom = 0;
            temp.creationPolicy = "auto";
            temp.mouseEnabled = false;
            temp.id = "socialViewStack";
            if (!temp.document)
            {
                temp.document = this;
            }
            mx_internal::_documentDescriptor = new UIComponentDescriptor({type:ViewStack, id:"socialViewStack", propertiesFactory:function () : Object
            {
                return {childDescriptors:[new UIComponentDescriptor({type:NavigatorContent, propertiesFactory:function () : Object
                {
                    return {percentWidth:100, name:"usersListContainer", mouseEnabled:false, styleName:"socialContentContainer", mxmlContentFactory:new DeferredInstanceFromFunction(_NextModeApplicationScreenSkin_Array33_c)};
                }// end function
                }), new UIComponentDescriptor({type:NavigatorContent, propertiesFactory:function () : Object
                {
                    return {percentWidth:100, name:"mqttListContainer", mouseEnabled:false, styleName:"socialContentContainer", mxmlContentFactory:new DeferredInstanceFromFunction(_NextModeApplicationScreenSkin_Array34_c)};
                }// end function
                }), new UIComponentDescriptor({type:NavigatorContent, propertiesFactory:function () : Object
                {
                    return {percentWidth:100, name:"facebookListContainer", mouseEnabled:false, styleName:"socialContentContainer", mxmlContentFactory:new DeferredInstanceFromFunction(_NextModeApplicationScreenSkin_Array35_c)};
                }// end function
                })]};
            }// end function
            });
            mx_internal::_documentDescriptor.document = this;
            this.socialViewStack = temp;
            BindingManager.executeBindings(this, "socialViewStack", this.socialViewStack);
            return temp;
        }// end function

        private function _NextModeApplicationScreenSkin_Array33_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_TinychatUsersList1_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_TinychatUsersList1_c() : TinychatUsersList
        {
            var _loc_1:* = new TinychatUsersList();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.itemDoubleClickEnabled = true;
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array34_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_MqttUsersList1_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_MqttUsersList1_c() : MqttUsersList
        {
            var _loc_1:* = new MqttUsersList();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.itemDoubleClickEnabled = true;
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_Array35_c() : Array
        {
            var _loc_1:Array = [this._NextModeApplicationScreenSkin_FacebookUsersList1_c()];
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_FacebookUsersList1_c() : FacebookUsersList
        {
            var _loc_1:* = new FacebookUsersList();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.itemDoubleClickEnabled = true;
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _NextModeApplicationScreenSkin_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "chatListButtonBar.dataProvider", "chatViewStack");
            _loc_1[1] = new Binding(this, null, null, "socialButtonBar.dataProvider", "socialViewStack");
            return _loc_1;
        }// end function

        public function get _NextModeApplicationScreenSkin_Group1() : Group
        {
            return this._1706027379_NextModeApplicationScreenSkin_Group1;
        }// end function

        public function set _NextModeApplicationScreenSkin_Group1(param1:Group) : void
        {
            var _loc_2:* = this._1706027379_NextModeApplicationScreenSkin_Group1;
            if (_loc_2 !== param1)
            {
                this._1706027379_NextModeApplicationScreenSkin_Group1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_Group1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_Group3() : Group
        {
            return this._1706027377_NextModeApplicationScreenSkin_Group3;
        }// end function

        public function set _NextModeApplicationScreenSkin_Group3(param1:Group) : void
        {
            var _loc_2:* = this._1706027377_NextModeApplicationScreenSkin_Group3;
            if (_loc_2 !== param1)
            {
                this._1706027377_NextModeApplicationScreenSkin_Group3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_Group3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_Group4() : Group
        {
            return this._1706027376_NextModeApplicationScreenSkin_Group4;
        }// end function

        public function set _NextModeApplicationScreenSkin_Group4(param1:Group) : void
        {
            var _loc_2:* = this._1706027376_NextModeApplicationScreenSkin_Group4;
            if (_loc_2 !== param1)
            {
                this._1706027376_NextModeApplicationScreenSkin_Group4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_Group4", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_HGroup3() : HGroup
        {
            return this._1688192383_NextModeApplicationScreenSkin_HGroup3;
        }// end function

        public function set _NextModeApplicationScreenSkin_HGroup3(param1:HGroup) : void
        {
            var _loc_2:* = this._1688192383_NextModeApplicationScreenSkin_HGroup3;
            if (_loc_2 !== param1)
            {
                this._1688192383_NextModeApplicationScreenSkin_HGroup3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_HGroup3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_HGroup5() : HGroup
        {
            return this._1688192381_NextModeApplicationScreenSkin_HGroup5;
        }// end function

        public function set _NextModeApplicationScreenSkin_HGroup5(param1:HGroup) : void
        {
            var _loc_2:* = this._1688192381_NextModeApplicationScreenSkin_HGroup5;
            if (_loc_2 !== param1)
            {
                this._1688192381_NextModeApplicationScreenSkin_HGroup5 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_HGroup5", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_HGroup6() : HGroup
        {
            return this._1688192380_NextModeApplicationScreenSkin_HGroup6;
        }// end function

        public function set _NextModeApplicationScreenSkin_HGroup6(param1:HGroup) : void
        {
            var _loc_2:* = this._1688192380_NextModeApplicationScreenSkin_HGroup6;
            if (_loc_2 !== param1)
            {
                this._1688192380_NextModeApplicationScreenSkin_HGroup6 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_HGroup6", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_NavigatorContent1() : NavigatorContent
        {
            return this._939652492_NextModeApplicationScreenSkin_NavigatorContent1;
        }// end function

        public function set _NextModeApplicationScreenSkin_NavigatorContent1(param1:NavigatorContent) : void
        {
            var _loc_2:* = this._939652492_NextModeApplicationScreenSkin_NavigatorContent1;
            if (_loc_2 !== param1)
            {
                this._939652492_NextModeApplicationScreenSkin_NavigatorContent1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_NavigatorContent1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_SkinnableContainer2() : SkinnableContainer
        {
            return this._1008682879_NextModeApplicationScreenSkin_SkinnableContainer2;
        }// end function

        public function set _NextModeApplicationScreenSkin_SkinnableContainer2(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._1008682879_NextModeApplicationScreenSkin_SkinnableContainer2;
            if (_loc_2 !== param1)
            {
                this._1008682879_NextModeApplicationScreenSkin_SkinnableContainer2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_SkinnableContainer2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_SkinnableContainer5() : SkinnableContainer
        {
            return this._1008682876_NextModeApplicationScreenSkin_SkinnableContainer5;
        }// end function

        public function set _NextModeApplicationScreenSkin_SkinnableContainer5(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._1008682876_NextModeApplicationScreenSkin_SkinnableContainer5;
            if (_loc_2 !== param1)
            {
                this._1008682876_NextModeApplicationScreenSkin_SkinnableContainer5 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_SkinnableContainer5", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_SkinnableContainer6() : SkinnableContainer
        {
            return this._1008682875_NextModeApplicationScreenSkin_SkinnableContainer6;
        }// end function

        public function set _NextModeApplicationScreenSkin_SkinnableContainer6(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._1008682875_NextModeApplicationScreenSkin_SkinnableContainer6;
            if (_loc_2 !== param1)
            {
                this._1008682875_NextModeApplicationScreenSkin_SkinnableContainer6 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_SkinnableContainer6", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_SkinnableContainer8() : SkinnableContainer
        {
            return this._1008682873_NextModeApplicationScreenSkin_SkinnableContainer8;
        }// end function

        public function set _NextModeApplicationScreenSkin_SkinnableContainer8(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._1008682873_NextModeApplicationScreenSkin_SkinnableContainer8;
            if (_loc_2 !== param1)
            {
                this._1008682873_NextModeApplicationScreenSkin_SkinnableContainer8 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_SkinnableContainer8", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _NextModeApplicationScreenSkin_VGroup1() : VGroup
        {
            return this._2146924557_NextModeApplicationScreenSkin_VGroup1;
        }// end function

        public function set _NextModeApplicationScreenSkin_VGroup1(param1:VGroup) : void
        {
            var _loc_2:* = this._2146924557_NextModeApplicationScreenSkin_VGroup1;
            if (_loc_2 !== param1)
            {
                this._2146924557_NextModeApplicationScreenSkin_VGroup1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_NextModeApplicationScreenSkin_VGroup1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get applicationVolumeControl() : ApplicationVolumeControl
        {
            return this._585363085applicationVolumeControl;
        }// end function

        public function set applicationVolumeControl(param1:ApplicationVolumeControl) : void
        {
            var _loc_2:* = this._585363085applicationVolumeControl;
            if (_loc_2 !== param1)
            {
                this._585363085applicationVolumeControl = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "applicationVolumeControl", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get chatListButtonBar() : SocialButtonBar
        {
            return this._1014907915chatListButtonBar;
        }// end function

        public function set chatListButtonBar(param1:SocialButtonBar) : void
        {
            var _loc_2:* = this._1014907915chatListButtonBar;
            if (_loc_2 !== param1)
            {
                this._1014907915chatListButtonBar = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatListButtonBar", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get chatView() : VGroup
        {
            return this._1437455901chatView;
        }// end function

        public function set chatView(param1:VGroup) : void
        {
            var _loc_2:* = this._1437455901chatView;
            if (_loc_2 !== param1)
            {
                this._1437455901chatView = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatView", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get chatViewStack() : ViewStack
        {
            return this._1848883605chatViewStack;
        }// end function

        public function set chatViewStack(param1:ViewStack) : void
        {
            var _loc_2:* = this._1848883605chatViewStack;
            if (_loc_2 !== param1)
            {
                this._1848883605chatViewStack = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatViewStack", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get columnContainer() : HGroup
        {
            return this._1906443829columnContainer;
        }// end function

        public function set columnContainer(param1:HGroup) : void
        {
            var _loc_2:* = this._1906443829columnContainer;
            if (_loc_2 !== param1)
            {
                this._1906443829columnContainer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "columnContainer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get controlBar2() : HGroup
        {
            return this._1715803780controlBar2;
        }// end function

        public function set controlBar2(param1:HGroup) : void
        {
            var _loc_2:* = this._1715803780controlBar2;
            if (_loc_2 !== param1)
            {
                this._1715803780controlBar2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "controlBar2", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get leftColumn() : SkinnableContainer
        {
            return this._1655307837leftColumn;
        }// end function

        public function set leftColumn(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._1655307837leftColumn;
            if (_loc_2 !== param1)
            {
                this._1655307837leftColumn = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftColumn", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get listView() : Group
        {
            return this._1345708131listView;
        }// end function

        public function set listView(param1:Group) : void
        {
            var _loc_2:* = this._1345708131listView;
            if (_loc_2 !== param1)
            {
                this._1345708131listView = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "listView", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get microphoneModeButton() : MicrophoneModeButton
        {
            return this._261763201microphoneModeButton;
        }// end function

        public function set microphoneModeButton(param1:MicrophoneModeButton) : void
        {
            var _loc_2:* = this._261763201microphoneModeButton;
            if (_loc_2 !== param1)
            {
                this._261763201microphoneModeButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "microphoneModeButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nextButton() : NextButton
        {
            return this._1749722107nextButton;
        }// end function

        public function set nextButton(param1:NextButton) : void
        {
            var _loc_2:* = this._1749722107nextButton;
            if (_loc_2 !== param1)
            {
                this._1749722107nextButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nextButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get playSounds() : PlaySoundsCheckbox
        {
            return this._1578736024playSounds;
        }// end function

        public function set playSounds(param1:PlaySoundsCheckbox) : void
        {
            var _loc_2:* = this._1578736024playSounds;
            if (_loc_2 !== param1)
            {
                this._1578736024playSounds = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playSounds", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get privateChatView() : PrivateChatView
        {
            return this._953756864privateChatView;
        }// end function

        public function set privateChatView(param1:PrivateChatView) : void
        {
            var _loc_2:* = this._953756864privateChatView;
            if (_loc_2 !== param1)
            {
                this._953756864privateChatView = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "privateChatView", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get publicChatView() : PublicChatView
        {
            return this._2005234598publicChatView;
        }// end function

        public function set publicChatView(param1:PublicChatView) : void
        {
            var _loc_2:* = this._2005234598publicChatView;
            if (_loc_2 !== param1)
            {
                this._2005234598publicChatView = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "publicChatView", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get receiveNotices() : ReceiveNoticesCheckbox
        {
            return this._838339528receiveNotices;
        }// end function

        public function set receiveNotices(param1:ReceiveNoticesCheckbox) : void
        {
            var _loc_2:* = this._838339528receiveNotices;
            if (_loc_2 !== param1)
            {
                this._838339528receiveNotices = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "receiveNotices", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get rightColumn() : SkinnableContainer
        {
            return this._873431918rightColumn;
        }// end function

        public function set rightColumn(param1:SkinnableContainer) : void
        {
            var _loc_2:* = this._873431918rightColumn;
            if (_loc_2 !== param1)
            {
                this._873431918rightColumn = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightColumn", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get socialButtonBar() : SocialButtonBar
        {
            return this._1559672172socialButtonBar;
        }// end function

        public function set socialButtonBar(param1:SocialButtonBar) : void
        {
            var _loc_2:* = this._1559672172socialButtonBar;
            if (_loc_2 !== param1)
            {
                this._1559672172socialButtonBar = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "socialButtonBar", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get socialViewStack() : ViewStack
        {
            return this._1139640822socialViewStack;
        }// end function

        public function set socialViewStack(param1:ViewStack) : void
        {
            var _loc_2:* = this._1139640822socialViewStack;
            if (_loc_2 !== param1)
            {
                this._1139640822socialViewStack = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "socialViewStack", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get videoCanvas() : RoomBroadcastCanvas
        {
            return this._567209395videoCanvas;
        }// end function

        public function set videoCanvas(param1:RoomBroadcastCanvas) : void
        {
            var _loc_2:* = this._567209395videoCanvas;
            if (_loc_2 !== param1)
            {
                this._567209395videoCanvas = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "videoCanvas", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ApplicationScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ApplicationScreen) : void
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
