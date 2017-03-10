package com.tinychat.ui.skins.gotham.components.broadcast.screens
{
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.spark.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.effects.easing.*;

    public class BroadcastAuthorizationScreenSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _BroadcastAuthorizationScreenSkin_HGroup1:HGroup;
        public var _BroadcastAuthorizationScreenSkin_Move1:Move;
        public var _BroadcastAuthorizationScreenSkin_Move2:Move;
        private var _1963270185_BroadcastAuthorizationScreenSkin_VGroup1:VGroup;
        private var _1757520704arrowAllow:Group;
        private var _1755670673arrowClose:Group;
        private var _688347722arrowRemember:Group;
        private var _859971561bounceArrowClose:Parallel;
        private var _1320974673bounceLeft:Parallel;
        private var _1367724422cancel:Button;
        private var _951117504confirm:Button;
        private var _1541249471helpDisplay:RichEditableText;
        private var _299873228infoDisplay:Label;
        private var _106858757power:Power;
        private var _1893287094titleDisplay:TitleDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:BroadcastAuthorizationScreen;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function BroadcastAuthorizationScreenSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._BroadcastAuthorizationScreenSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_screens_BroadcastAuthorizationScreenSkinWatcherSetupUtil");
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
            this.width = 490;
            this.minHeight = 250;
            this.mxmlContent = [this._BroadcastAuthorizationScreenSkin_TitleDisplay1_i(), this._BroadcastAuthorizationScreenSkin_VGroup1_i()];
            this.currentState = "privacyPanelOpen";
            this._BroadcastAuthorizationScreenSkin_Parallel2_i();
            this._BroadcastAuthorizationScreenSkin_Parallel1_i();
            this._BroadcastAuthorizationScreenSkin_Power1_i();
            var _BroadcastAuthorizationScreenSkin_Group1_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_Group1_i);
            var _BroadcastAuthorizationScreenSkin_Group2_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_Group2_i);
            var _BroadcastAuthorizationScreenSkin_Group3_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_Group3_i);
            var _BroadcastAuthorizationScreenSkin_HGroup1_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_HGroup1_i);
            var _BroadcastAuthorizationScreenSkin_Label1_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_Label1_i);
            var _BroadcastAuthorizationScreenSkin_RichEditableText1_factory:* = new DeferredInstanceFromFunction(this._BroadcastAuthorizationScreenSkin_RichEditableText1_i);
            states = [new State({name:"privacyPanelOpen", overrides:[new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_Group1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]}), new State({name:"privacyPanelOpenAndAllowed", overrides:[new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_Group3_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]}), new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_Group2_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["titleDisplay"]})]}), new State({name:"deviceAccessPanelOpen", overrides:[]}), new State({name:"panelsClosed", overrides:[new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_HGroup1_factory, destination:"_BroadcastAuthorizationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_RichEditableText1_factory, destination:"_BroadcastAuthorizationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_BroadcastAuthorizationScreenSkin_Label1_factory, destination:"_BroadcastAuthorizationScreenSkin_VGroup1", propertyName:"mxmlContent", position:"first"})]})];
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

        private function _BroadcastAuthorizationScreenSkin_Parallel2_i() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.children = [this._BroadcastAuthorizationScreenSkin_Fade2_c(), this._BroadcastAuthorizationScreenSkin_Move2_i()];
            this.bounceArrowClose = _loc_1;
            BindingManager.executeBindings(this, "bounceArrowClose", this.bounceArrowClose);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Fade2_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 500;
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Move2_i() : Move
        {
            var _loc_1:* = new Move();
            _loc_1.yFrom = 217;
            _loc_1.yTo = 207;
            _loc_1.duration = 600;
            _loc_1.repeatDelay = 10;
            _loc_1.repeatCount = 0;
            _loc_1.repeatBehavior = "reverse";
            this._BroadcastAuthorizationScreenSkin_Move2 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastAuthorizationScreenSkin_Move2", this._BroadcastAuthorizationScreenSkin_Move2);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Parallel1_i() : Parallel
        {
            var _loc_1:* = new Parallel();
            _loc_1.children = [this._BroadcastAuthorizationScreenSkin_Fade1_c(), this._BroadcastAuthorizationScreenSkin_Move1_i()];
            this.bounceLeft = _loc_1;
            BindingManager.executeBindings(this, "bounceLeft", this.bounceLeft);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Fade1_c() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 500;
            _loc_1.alphaFrom = 0;
            _loc_1.alphaTo = 1;
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Move1_i() : Move
        {
            var _loc_1:* = new Move();
            _loc_1.xFrom = 112;
            _loc_1.xTo = 122;
            _loc_1.duration = 600;
            _loc_1.repeatDelay = 10;
            _loc_1.repeatCount = 0;
            _loc_1.repeatBehavior = "reverse";
            this._BroadcastAuthorizationScreenSkin_Move1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastAuthorizationScreenSkin_Move1", this._BroadcastAuthorizationScreenSkin_Move1);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Power1_i() : Power
        {
            var _loc_1:* = new Power();
            _loc_1.easeInFraction = 1;
            this.power = _loc_1;
            BindingManager.executeBindings(this, "power", this.power);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_TitleDisplay1_i() : TitleDisplay
        {
            var _loc_1:* = new TitleDisplay();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
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

        private function _BroadcastAuthorizationScreenSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.x = 112;
            _loc_1.y = 132;
            _loc_1.mxmlContent = [this._BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition01_c()];
            _loc_1.addEventListener("addedToStage", this.__arrowAllow_addedToStage);
            _loc_1.addEventListener("removedFromStage", this.__arrowAllow_removedFromStage);
            _loc_1.id = "arrowAllow";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.arrowAllow = _loc_1;
            BindingManager.executeBindings(this, "arrowAllow", this.arrowAllow);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition01_c() : BroadcastAuthorizationScreenSkin_definition0
        {
            var _loc_1:* = new BroadcastAuthorizationScreenSkin_definition0();
            _loc_1.width = 12;
            _loc_1.height = 12;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function __arrowAllow_addedToStage(event:Event) : void
        {
            this.bounceLeft.play([this.arrowAllow]);
            return;
        }// end function

        public function __arrowAllow_removedFromStage(event:Event) : void
        {
            this.bounceLeft.end();
            return;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.x = 112;
            _loc_1.y = 146;
            _loc_1.mxmlContent = [this._BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition02_c()];
            _loc_1.addEventListener("addedToStage", this.__arrowRemember_addedToStage);
            _loc_1.addEventListener("removedFromStage", this.__arrowRemember_removedFromStage);
            _loc_1.id = "arrowRemember";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.arrowRemember = _loc_1;
            BindingManager.executeBindings(this, "arrowRemember", this.arrowRemember);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition02_c() : BroadcastAuthorizationScreenSkin_definition0
        {
            var _loc_1:* = new BroadcastAuthorizationScreenSkin_definition0();
            _loc_1.width = 12;
            _loc_1.height = 12;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function __arrowRemember_addedToStage(event:Event) : void
        {
            this.bounceLeft.play([this.arrowRemember]);
            return;
        }// end function

        public function __arrowRemember_removedFromStage(event:Event) : void
        {
            this.bounceLeft.end();
            return;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Group3_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.x = 307;
            _loc_1.y = 217;
            _loc_1.rotation = -90;
            _loc_1.mxmlContent = [this._BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition03_c()];
            _loc_1.addEventListener("addedToStage", this.__arrowClose_addedToStage);
            _loc_1.addEventListener("removedFromStage", this.__arrowClose_removedFromStage);
            _loc_1.id = "arrowClose";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.arrowClose = _loc_1;
            BindingManager.executeBindings(this, "arrowClose", this.arrowClose);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_BroadcastAuthorizationScreenSkin_definition03_c() : BroadcastAuthorizationScreenSkin_definition0
        {
            var _loc_1:* = new BroadcastAuthorizationScreenSkin_definition0();
            _loc_1.width = 12;
            _loc_1.height = 12;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function __arrowClose_addedToStage(event:Event) : void
        {
            this.bounceArrowClose.play();
            return;
        }// end function

        public function __arrowClose_removedFromStage(event:Event) : void
        {
            this.bounceArrowClose.end();
            return;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.left = 15;
            _loc_1.right = 15;
            _loc_1.top = 65;
            _loc_1.bottom = 15;
            _loc_1.gap = 15;
            _loc_1.horizontalAlign = "justify";
            _loc_1.mxmlContent = [];
            _loc_1.id = "_BroadcastAuthorizationScreenSkin_VGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._BroadcastAuthorizationScreenSkin_VGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastAuthorizationScreenSkin_VGroup1", this._BroadcastAuthorizationScreenSkin_VGroup1);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.setStyle("textAlignLast", "center");
            _loc_1.id = "infoDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.infoDisplay = _loc_1;
            BindingManager.executeBindings(this, "infoDisplay", this.infoDisplay);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_RichEditableText1_i() : RichEditableText
        {
            var _loc_1:* = new RichEditableText();
            _loc_1.editable = false;
            _loc_1.setStyle("textAlignLast", "center");
            _loc_1.id = "helpDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.helpDisplay = _loc_1;
            BindingManager.executeBindings(this, "helpDisplay", this.helpDisplay);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.gap = 15;
            _loc_1.horizontalAlign = "center";
            _loc_1.variableColumnWidth = false;
            _loc_1.columnWidth = 100;
            _loc_1.mxmlContent = [this._BroadcastAuthorizationScreenSkin_Button1_i(), this._BroadcastAuthorizationScreenSkin_Button2_i()];
            _loc_1.id = "_BroadcastAuthorizationScreenSkin_HGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._BroadcastAuthorizationScreenSkin_HGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_BroadcastAuthorizationScreenSkin_HGroup1", this._BroadcastAuthorizationScreenSkin_HGroup1);
            return _loc_1;
        }// end function

        private function _BroadcastAuthorizationScreenSkin_Button1_i() : Button
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

        private function _BroadcastAuthorizationScreenSkin_Button2_i() : Button
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

        private function _BroadcastAuthorizationScreenSkin_bindingsSetup() : Array
        {
            var _loc_1:Array = [];
            _loc_1[0] = new Binding(this, null, null, "_BroadcastAuthorizationScreenSkin_Move1.easer", "power");
            _loc_1[1] = new Binding(this, null, null, "bounceArrowClose.target", "arrowClose");
            _loc_1[2] = new Binding(this, null, null, "_BroadcastAuthorizationScreenSkin_Move2.easer", "power");
            return _loc_1;
        }// end function

        public function get _BroadcastAuthorizationScreenSkin_VGroup1() : VGroup
        {
            return this._1963270185_BroadcastAuthorizationScreenSkin_VGroup1;
        }// end function

        public function set _BroadcastAuthorizationScreenSkin_VGroup1(param1:VGroup) : void
        {
            var _loc_2:* = this._1963270185_BroadcastAuthorizationScreenSkin_VGroup1;
            if (_loc_2 !== param1)
            {
                this._1963270185_BroadcastAuthorizationScreenSkin_VGroup1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_BroadcastAuthorizationScreenSkin_VGroup1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get arrowAllow() : Group
        {
            return this._1757520704arrowAllow;
        }// end function

        public function set arrowAllow(param1:Group) : void
        {
            var _loc_2:* = this._1757520704arrowAllow;
            if (_loc_2 !== param1)
            {
                this._1757520704arrowAllow = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrowAllow", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get arrowClose() : Group
        {
            return this._1755670673arrowClose;
        }// end function

        public function set arrowClose(param1:Group) : void
        {
            var _loc_2:* = this._1755670673arrowClose;
            if (_loc_2 !== param1)
            {
                this._1755670673arrowClose = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrowClose", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get arrowRemember() : Group
        {
            return this._688347722arrowRemember;
        }// end function

        public function set arrowRemember(param1:Group) : void
        {
            var _loc_2:* = this._688347722arrowRemember;
            if (_loc_2 !== param1)
            {
                this._688347722arrowRemember = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrowRemember", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get bounceArrowClose() : Parallel
        {
            return this._859971561bounceArrowClose;
        }// end function

        public function set bounceArrowClose(param1:Parallel) : void
        {
            var _loc_2:* = this._859971561bounceArrowClose;
            if (_loc_2 !== param1)
            {
                this._859971561bounceArrowClose = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bounceArrowClose", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get bounceLeft() : Parallel
        {
            return this._1320974673bounceLeft;
        }// end function

        public function set bounceLeft(param1:Parallel) : void
        {
            var _loc_2:* = this._1320974673bounceLeft;
            if (_loc_2 !== param1)
            {
                this._1320974673bounceLeft = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bounceLeft", _loc_2, param1));
                }
            }
            return;
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

        public function get helpDisplay() : RichEditableText
        {
            return this._1541249471helpDisplay;
        }// end function

        public function set helpDisplay(param1:RichEditableText) : void
        {
            var _loc_2:* = this._1541249471helpDisplay;
            if (_loc_2 !== param1)
            {
                this._1541249471helpDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "helpDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get infoDisplay() : Label
        {
            return this._299873228infoDisplay;
        }// end function

        public function set infoDisplay(param1:Label) : void
        {
            var _loc_2:* = this._299873228infoDisplay;
            if (_loc_2 !== param1)
            {
                this._299873228infoDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "infoDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get power() : Power
        {
            return this._106858757power;
        }// end function

        public function set power(param1:Power) : void
        {
            var _loc_2:* = this._106858757power;
            if (_loc_2 !== param1)
            {
                this._106858757power = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "power", _loc_2, param1));
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

        public function get hostComponent() : BroadcastAuthorizationScreen
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:BroadcastAuthorizationScreen) : void
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
