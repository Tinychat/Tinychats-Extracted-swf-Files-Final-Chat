package com.tinychat.ui.skins.gotham.components.broadcast.containers
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import com.tinychat.ui.skins.gotham.components.video.controls.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.effects.*;
    import spark.primitives.*;

    public class GreenRoomCameraBroadcastContainerSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _GreenRoomCameraBroadcastContainerSkin_AjaxLoader1:AjaxLoader;
        public var _GreenRoomCameraBroadcastContainerSkin_Animate1:Animate;
        public var _GreenRoomCameraBroadcastContainerSkin_Rect2:Rect;
        private var _1648007651_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1:SolidColorStroke;
        private var _1918276642approvalMessageDisplay:Label;
        private var _829945482audioActivityIndicator:AudioActivityBar;
        private var _1123770483audioOnlyIndicator:AudioOnlyIndicator;
        private var _1383304148border:Rect;
        private var _809612678contentGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:GreenRoomCameraBroadcastContainer;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function GreenRoomCameraBroadcastContainerSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._GreenRoomCameraBroadcastContainerSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_containers_GreenRoomCameraBroadcastContainerSkinWatcherSetupUtil");
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
            this.transitions = [this._GreenRoomCameraBroadcastContainerSkin_Transition1_c()];
            this.mxmlContent = [this._GreenRoomCameraBroadcastContainerSkin_Rect1_i(), this._GreenRoomCameraBroadcastContainerSkin_Group1_i(), this._GreenRoomCameraBroadcastContainerSkin_Rect2_i(), this._GreenRoomCameraBroadcastContainerSkin_Label1_i(), this._GreenRoomCameraBroadcastContainerSkin_AudioActivityBar1_i()];
            this.currentState = "normal";
            var _GreenRoomCameraBroadcastContainerSkin_AjaxLoader1_factory:* = new DeferredInstanceFromFunction(this._GreenRoomCameraBroadcastContainerSkin_AjaxLoader1_i);
            var _GreenRoomCameraBroadcastContainerSkin_AudioOnlyIndicator1_factory:* = new DeferredInstanceFromFunction(this._GreenRoomCameraBroadcastContainerSkin_AudioOnlyIndicator1_i);
            states = [new State({name:"normal", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"videoWaiting", overrides:[new AddItems().initializeFromObject({itemsFactory:_GreenRoomCameraBroadcastContainerSkin_AjaxLoader1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["audioActivityIndicator"]})]}), new State({name:"audioOnly", stateGroups:["audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_GreenRoomCameraBroadcastContainerSkin_AudioOnlyIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_GreenRoomCameraBroadcastContainerSkin_Rect2"]})]}), new State({name:"audioOnlyAndOver", stateGroups:["overStates", "audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_GreenRoomCameraBroadcastContainerSkin_AudioOnlyIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_GreenRoomCameraBroadcastContainerSkin_Rect2"]}), new SetProperty().initializeFromObject({target:"_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"disabled", overrides:[]})];
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
            this.audioActivityIndicator.sizeToNearestLevel(10, Math.min(param2 - 10, 50));
            return;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.fromState = "*";
            _loc_1.toState = "overStates";
            _loc_1.autoReverse = true;
            _loc_1.effect = this._GreenRoomCameraBroadcastContainerSkin_Animate1_i();
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Animate1_i() : Animate
        {
            var _loc_1:* = new Animate();
            _loc_1.duration = 250;
            this._GreenRoomCameraBroadcastContainerSkin_Animate1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomCameraBroadcastContainerSkin_Animate1", this._GreenRoomCameraBroadcastContainerSkin_Animate1);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 4079166;
            _loc_1.weight = 1;
            this._GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", this._GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Rect2_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.fill = this._GreenRoomCameraBroadcastContainerSkin_SolidColor1_c();
            _loc_1.initialized(this, "_GreenRoomCameraBroadcastContainerSkin_Rect2");
            this._GreenRoomCameraBroadcastContainerSkin_Rect2 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomCameraBroadcastContainerSkin_Rect2", this._GreenRoomCameraBroadcastContainerSkin_Rect2);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            _loc_1.alpha = 0.8;
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_AudioOnlyIndicator1_i() : AudioOnlyIndicator
        {
            var _loc_1:* = new AudioOnlyIndicator();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.alpha = 0.25;
            _loc_1.id = "audioOnlyIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.audioOnlyIndicator = _loc_1;
            BindingManager.executeBindings(this, "audioOnlyIndicator", this.audioOnlyIndicator);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.percentWidth = 80;
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("color", 16777215);
            _loc_1.setStyle("fontSize", 14);
            _loc_1.id = "approvalMessageDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.approvalMessageDisplay = _loc_1;
            BindingManager.executeBindings(this, "approvalMessageDisplay", this.approvalMessageDisplay);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_AudioActivityBar1_i() : AudioActivityBar
        {
            var _loc_1:* = new AudioActivityBar();
            _loc_1.width = 10;
            _loc_1.height = 50;
            _loc_1.left = 5;
            _loc_1.bottom = 5;
            _loc_1.initialized(this, "audioActivityIndicator");
            this.audioActivityIndicator = _loc_1;
            BindingManager.executeBindings(this, "audioActivityIndicator", this.audioActivityIndicator);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "_GreenRoomCameraBroadcastContainerSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._GreenRoomCameraBroadcastContainerSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_GreenRoomCameraBroadcastContainerSkin_AjaxLoader1", this._GreenRoomCameraBroadcastContainerSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _GreenRoomCameraBroadcastContainerSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, null, null, "_GreenRoomCameraBroadcastContainerSkin_Animate1.target", "border");
            result[1] = new Binding(this, function () : Array
            {
                var _loc_1:* = ["weight", "color"];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_GreenRoomCameraBroadcastContainerSkin_Animate1.relevantProperties");
            return result;
        }// end function

        public function get _GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._1648007651_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1;
        }// end function

        public function set _GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1648007651_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._1648007651_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_GreenRoomCameraBroadcastContainerSkin_SolidColorStroke1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get approvalMessageDisplay() : Label
        {
            return this._1918276642approvalMessageDisplay;
        }// end function

        public function set approvalMessageDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1918276642approvalMessageDisplay;
            if (_loc_2 !== param1)
            {
                this._1918276642approvalMessageDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "approvalMessageDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get audioActivityIndicator() : AudioActivityBar
        {
            return this._829945482audioActivityIndicator;
        }// end function

        public function set audioActivityIndicator(param1:AudioActivityBar) : void
        {
            var _loc_2:* = this._829945482audioActivityIndicator;
            if (_loc_2 !== param1)
            {
                this._829945482audioActivityIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "audioActivityIndicator", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get audioOnlyIndicator() : AudioOnlyIndicator
        {
            return this._1123770483audioOnlyIndicator;
        }// end function

        public function set audioOnlyIndicator(param1:AudioOnlyIndicator) : void
        {
            var _loc_2:* = this._1123770483audioOnlyIndicator;
            if (_loc_2 !== param1)
            {
                this._1123770483audioOnlyIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "audioOnlyIndicator", _loc_2, param1));
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

        public function get contentGroup() : Group
        {
            return this._809612678contentGroup;
        }// end function

        public function set contentGroup(param1:Group) : void
        {
            var _loc_2:* = this._809612678contentGroup;
            if (_loc_2 !== param1)
            {
                this._809612678contentGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : GreenRoomCameraBroadcastContainer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:GreenRoomCameraBroadcastContainer) : void
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
