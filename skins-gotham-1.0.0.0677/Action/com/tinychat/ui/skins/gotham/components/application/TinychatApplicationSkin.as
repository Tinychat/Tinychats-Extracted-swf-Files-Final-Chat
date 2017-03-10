package com.tinychat.ui.skins.gotham.components.application
{
    import com.adobe.popup.*;
    import com.tinychat.ui.components.application.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.popups.*;
    import flash.filters.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class TinychatApplicationSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _TinychatApplicationSkin_BlurFilter1:BlurFilter;
        public var _TinychatApplicationSkin_Fade3:Fade;
        public var _TinychatApplicationSkin_Fade4:Fade;
        public var _TinychatApplicationSkin_Fade5:Fade;
        public var _TinychatApplicationSkin_Pause1:Pause;
        public var _TinychatApplicationSkin_Pause2:Pause;
        private var _334924324applicationScreen:ApplicationScreen;
        private var _1488142660connectingScreen:ConnectingScreen;
        private var _1449698319delayPopUpOpening:OpenAfterEventPopUpBehavior;
        private var _92085280fadeConnectingScreen:Sequence;
        private var _104069805modal:Group;
        private var _1554697717modalPopupFactory:PopUpFactory;
        private var _803312998modelessPopupFactory:ClassFactory;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:TinychatApplication;
        private static const STATE_CONNECTING:String = "connecting";
        private static const STATE_MODAL:String = "modal";
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function TinychatApplicationSkin()
        {
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            var bindings:* = this._TinychatApplicationSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_application_TinychatApplicationSkinWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , function (param1:String)
            {
                return TinychatApplicationSkin[param1];
            }// end function
            , bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.transitions = [this._TinychatApplicationSkin_Transition1_c(), this._TinychatApplicationSkin_Transition2_c(), this._TinychatApplicationSkin_Transition3_c()];
            this.mxmlContent = [this._TinychatApplicationSkin_Group1_i(), this._TinychatApplicationSkin_ConnectingScreen1_i()];
            this.currentState = "normal";
            this._TinychatApplicationSkin_Sequence1_i();
            this._TinychatApplicationSkin_PopUpFactory1_i();
            this._TinychatApplicationSkin_ClassFactory2_i();
            this.addEventListener("currentStateChanging", this.___TinychatApplicationSkin_Skin1_currentStateChanging);
            var _TinychatApplicationSkin_ApplicationScreen1_factory:* = new DeferredInstanceFromFunction(this._TinychatApplicationSkin_ApplicationScreen1_i);
            var _TinychatApplicationSkin_BlurFilter1_factory:* = new DeferredInstanceFromFunction(this._TinychatApplicationSkin_BlurFilter1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_ApplicationScreen1_factory, destination:null, propertyName:"mxmlContent", position:"first"}), new SetProperty().initializeFromObject({target:"modal", name:"visible", value:false}), new SetProperty().initializeFromObject({target:"modal", name:"includeInLayout", value:false})]}), new State({name:"connecting", stateGroups:["connectingStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_BlurFilter1_factory, destination:"applicationScreen", propertyName:"filters", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_ApplicationScreen1_factory, destination:null, propertyName:"mxmlContent", position:"first"})]}), new State({name:"connectingAndLoading", stateGroups:["connectingStates", "loadingStates"], overrides:[]}), new State({name:"modal", stateGroups:["modalStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_BlurFilter1_factory, destination:"applicationScreen", propertyName:"filters", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_ApplicationScreen1_factory, destination:null, propertyName:"mxmlContent", position:"first"})]}), new State({name:"modalAndLoading", stateGroups:["loadingStates", "modalStates"], overrides:[]}), new State({name:"disabled", overrides:[new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_BlurFilter1_factory, destination:"applicationScreen", propertyName:"filters", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_TinychatApplicationSkin_ApplicationScreen1_factory, destination:null, propertyName:"mxmlContent", position:"first"})]})];
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

        public function get application() : Application
        {
            return Application(FlexGlobals.topLevelApplication);
        }// end function

        private function currentStateChangingHandler(event:StateChangeEvent) : void
        {
            var _loc_2:* = event.newState.indexOf(STATE_CONNECTING) == 0;
            var _loc_3:* = event.oldState.indexOf(STATE_CONNECTING) == 0;
            var _loc_4:* = event.newState.indexOf(STATE_MODAL) == 0;
            if (!_loc_2)
            {
                if (_loc_3)
                {
                }
            }
            if (_loc_4)
            {
                this.delayPopUpOpening.delayUntilEvent(this.fadeConnectingScreen, EffectEvent.EFFECT_END);
            }
            this.connectingScreen.visible = _loc_2;
            this.connectingScreen.includeInLayout = _loc_2;
            return;
        }// end function

        private function _TinychatApplicationSkin_Sequence1_i() : Sequence
        {
            var _loc_1:* = new Sequence();
            _loc_1.children = [this._TinychatApplicationSkin_CallAction1_c(), this._TinychatApplicationSkin_Pause1_i()];
            this.fadeConnectingScreen = _loc_1;
            BindingManager.executeBindings(this, "fadeConnectingScreen", this.fadeConnectingScreen);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_CallAction1_c() : CallAction
        {
            var _loc_1:* = new CallAction();
            _loc_1.functionName = "fade";
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Pause1_i() : Pause
        {
            var _loc_1:* = new Pause();
            _loc_1.duration = -1;
            _loc_1.eventName = "complete";
            this._TinychatApplicationSkin_Pause1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_Pause1", this._TinychatApplicationSkin_Pause1);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_PopUpFactory1_i() : PopUpFactory
        {
            var _loc_1:* = new PopUpFactory();
            _loc_1.reuse = false;
            _loc_1.center = true;
            _loc_1.popup = this._TinychatApplicationSkin_ClassFactory1_c();
            _loc_1.behaviors = [this._TinychatApplicationSkin_KeepModalCenteredPopUpBehavior1_c(), this._TinychatApplicationSkin_OpenAfterEventPopUpBehavior1_i(), this._TinychatApplicationSkin_PlayEffectsPopUpBehavior1_c()];
            _loc_1.initialized(this, "modalPopupFactory");
            this.modalPopupFactory = _loc_1;
            BindingManager.executeBindings(this, "modalPopupFactory", this.modalPopupFactory);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_ClassFactory1_c() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = AdvancedTitleWindow;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_KeepModalCenteredPopUpBehavior1_c() : KeepModalCenteredPopUpBehavior
        {
            var _loc_1:* = new KeepModalCenteredPopUpBehavior();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_OpenAfterEventPopUpBehavior1_i() : OpenAfterEventPopUpBehavior
        {
            var _loc_1:* = new OpenAfterEventPopUpBehavior();
            this.delayPopUpOpening = _loc_1;
            BindingManager.executeBindings(this, "delayPopUpOpening", this.delayPopUpOpening);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_PlayEffectsPopUpBehavior1_c() : PlayEffectsPopUpBehavior
        {
            var _loc_1:* = new PlayEffectsPopUpBehavior();
            _loc_1.openEffect = this._TinychatApplicationSkin_Parallel1_c();
            _loc_1.closeEffect = this._TinychatApplicationSkin_Fade2_c();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Parallel1_c() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.duration = 300;
            _loc_1.children = [this._TinychatApplicationSkin_Fade1_c()];
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Fade1_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Fade2_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 1;
            _loc_1.alphaTo = 0;
            _loc_1.duration = 300;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_ClassFactory2_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = TinychatApplicationSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            this.modelessPopupFactory = _loc_1;
            BindingManager.executeBindings(this, "modelessPopupFactory", this.modelessPopupFactory);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "modal";
            _loc_1.toState = "normal";
            _loc_1.effect = this._TinychatApplicationSkin_Fade3_i();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Fade3_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0.7;
            _loc_1.alphaTo = 0;
            _loc_1.duration = 300;
            this._TinychatApplicationSkin_Fade3 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_Fade3", this._TinychatApplicationSkin_Fade3);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Transition2_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "connecting";
            _loc_1.toState = "normal";
            _loc_1.effect = this._TinychatApplicationSkin_Sequence2_c();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Sequence2_c() : Sequence
        {
            var _loc_1:* = new Sequence();
            _loc_1.children = [this._TinychatApplicationSkin_Pause2_i(), this._TinychatApplicationSkin_Fade4_i()];
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Pause2_i() : Pause
        {
            var _loc_1:* = new Pause();
            _loc_1.duration = -1;
            _loc_1.eventName = "complete";
            this._TinychatApplicationSkin_Pause2 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_Pause2", this._TinychatApplicationSkin_Pause2);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Fade4_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0.7;
            _loc_1.alphaTo = 0;
            _loc_1.duration = 300;
            this._TinychatApplicationSkin_Fade4 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_Fade4", this._TinychatApplicationSkin_Fade4);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Transition3_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "normal";
            _loc_1.toState = "*";
            _loc_1.effect = this._TinychatApplicationSkin_Fade5_i();
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Fade5_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 0.7;
            _loc_1.duration = 300;
            this._TinychatApplicationSkin_Fade5 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_Fade5", this._TinychatApplicationSkin_Fade5);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_ApplicationScreen1_i() : ApplicationScreen
        {
            var _loc_1:* = new ApplicationScreen();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.filters = [];
            _loc_1.id = "applicationScreen";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.applicationScreen = _loc_1;
            BindingManager.executeBindings(this, "applicationScreen", this.applicationScreen);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_BlurFilter1_i() : BlurFilter
        {
            var _loc_1:* = new BlurFilter();
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            this._TinychatApplicationSkin_BlurFilter1 = _loc_1;
            BindingManager.executeBindings(this, "_TinychatApplicationSkin_BlurFilter1", this._TinychatApplicationSkin_BlurFilter1);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.mouseChildren = false;
            _loc_1.alpha = 0.7;
            _loc_1.visible = true;
            _loc_1.includeInLayout = true;
            _loc_1.mxmlContent = [this._TinychatApplicationSkin_Rect1_c()];
            _loc_1.id = "modal";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.modal = _loc_1;
            BindingManager.executeBindings(this, "modal", this.modal);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._TinychatApplicationSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _TinychatApplicationSkin_ConnectingScreen1_i() : ConnectingScreen
        {
            var _loc_1:* = new ConnectingScreen();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.addEventListener("show", this.__connectingScreen_show);
            _loc_1.id = "connectingScreen";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.connectingScreen = _loc_1;
            BindingManager.executeBindings(this, "connectingScreen", this.connectingScreen);
            return _loc_1;
        }// end function

        public function __connectingScreen_show(event:FlexEvent) : void
        {
            this.connectingScreen.start();
            return;
        }// end function

        public function ___TinychatApplicationSkin_Skin1_currentStateChanging(event:StateChangeEvent) : void
        {
            this.currentStateChangingHandler(event);
            return;
        }// end function

        private function _TinychatApplicationSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, null, null, "modalPopupFactory.parent", "application");
            result[1] = new Binding(this, null, null, "fadeConnectingScreen.target", "connectingScreen");
            result[2] = new Binding(this, null, null, "_TinychatApplicationSkin_Pause1.target", "connectingScreen");
            result[3] = new Binding(this, null, null, "_TinychatApplicationSkin_Fade3.target", "modal");
            result[4] = new Binding(this, null, null, "_TinychatApplicationSkin_Pause2.target", "connectingScreen");
            result[5] = new Binding(this, null, null, "_TinychatApplicationSkin_Fade4.target", "modal");
            result[6] = new Binding(this, null, null, "_TinychatApplicationSkin_Fade5.target", "modal");
            result[7] = new Binding(this, function () : int
            {
                return BitmapFilterQuality.LOW;
            }// end function
            , null, "_TinychatApplicationSkin_BlurFilter1.quality");
            result[8] = new Binding(this, null, function (param1) : void
            {
                connectingScreen.setStyle("hideEffect", param1);
                return;
            }// end function
            , "connectingScreen.hideEffect", "fadeConnectingScreen");
            return result;
        }// end function

        public function get applicationScreen() : ApplicationScreen
        {
            return this._334924324applicationScreen;
        }// end function

        public function set applicationScreen(param1:ApplicationScreen) : void
        {
            var _loc_2:* = this._334924324applicationScreen;
            if (_loc_2 !== param1)
            {
                this._334924324applicationScreen = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "applicationScreen", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get connectingScreen() : ConnectingScreen
        {
            return this._1488142660connectingScreen;
        }// end function

        public function set connectingScreen(param1:ConnectingScreen) : void
        {
            var _loc_2:* = this._1488142660connectingScreen;
            if (_loc_2 !== param1)
            {
                this._1488142660connectingScreen = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "connectingScreen", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get delayPopUpOpening() : OpenAfterEventPopUpBehavior
        {
            return this._1449698319delayPopUpOpening;
        }// end function

        public function set delayPopUpOpening(param1:OpenAfterEventPopUpBehavior) : void
        {
            var _loc_2:* = this._1449698319delayPopUpOpening;
            if (_loc_2 !== param1)
            {
                this._1449698319delayPopUpOpening = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "delayPopUpOpening", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get fadeConnectingScreen() : Sequence
        {
            return this._92085280fadeConnectingScreen;
        }// end function

        public function set fadeConnectingScreen(param1:Sequence) : void
        {
            var _loc_2:* = this._92085280fadeConnectingScreen;
            if (_loc_2 !== param1)
            {
                this._92085280fadeConnectingScreen = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeConnectingScreen", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get modal() : Group
        {
            return this._104069805modal;
        }// end function

        public function set modal(param1:Group) : void
        {
            var _loc_2:* = this._104069805modal;
            if (_loc_2 !== param1)
            {
                this._104069805modal = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modal", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get modalPopupFactory() : PopUpFactory
        {
            return this._1554697717modalPopupFactory;
        }// end function

        public function set modalPopupFactory(param1:PopUpFactory) : void
        {
            var _loc_2:* = this._1554697717modalPopupFactory;
            if (_loc_2 !== param1)
            {
                this._1554697717modalPopupFactory = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modalPopupFactory", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get modelessPopupFactory() : ClassFactory
        {
            return this._803312998modelessPopupFactory;
        }// end function

        public function set modelessPopupFactory(param1:ClassFactory) : void
        {
            var _loc_2:* = this._803312998modelessPopupFactory;
            if (_loc_2 !== param1)
            {
                this._803312998modelessPopupFactory = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "modelessPopupFactory", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : TinychatApplication
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:TinychatApplication) : void
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
            TinychatApplicationSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
