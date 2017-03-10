package com.tinychat.ui.skins.gotham.components.broadcast.containers
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.pro.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
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

    public class StreamBroadcastContainerSkin extends Skin implements IBindingClient, IStateClient2
    {
        public var _StreamBroadcastContainerSkin_AjaxLoader1:AjaxLoader;
        public var _StreamBroadcastContainerSkin_Fade1:Fade;
        private var _111238327_StreamBroadcastContainerSkin_HGroup1:HGroup;
        private var _1297066686_StreamBroadcastContainerSkin_SolidColorStroke1:SolidColorStroke;
        private var _829945482audioActivityIndicator:AudioActivityBar;
        private var _1123770483audioOnlyIndicator:AudioOnlyIndicator;
        private var _493512067blockedIndicator:BlockedIndicator;
        private var _1383304148border:Rect;
        private var _809612678contentGroup:Group;
        private var _1028312467iconAchiev:AchievementDisplay;
        private var _1844466615nameDisplay:NameDisplay;
        private var _462823966proIndicator:ProIndicator;
        private var _1996457281videoControlsOverlay:VideoControlsOverlay;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:StreamBroadcastContainer;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function StreamBroadcastContainerSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._StreamBroadcastContainerSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_containers_StreamBroadcastContainerSkinWatcherSetupUtil");
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
            this.transitions = [this._StreamBroadcastContainerSkin_Transition1_c()];
            this.mxmlContent = [this._StreamBroadcastContainerSkin_Rect1_i(), this._StreamBroadcastContainerSkin_Group1_i(), this._StreamBroadcastContainerSkin_AudioActivityBar1_i(), this._StreamBroadcastContainerSkin_HGroup1_i()];
            this.currentState = "normal";
            var _StreamBroadcastContainerSkin_AchievementDisplay1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_AchievementDisplay1_i);
            var _StreamBroadcastContainerSkin_AjaxLoader1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_AjaxLoader1_i);
            var _StreamBroadcastContainerSkin_AudioOnlyIndicator1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_AudioOnlyIndicator1_i);
            var _StreamBroadcastContainerSkin_BlockedIndicator1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_BlockedIndicator1_i);
            var _StreamBroadcastContainerSkin_NameDisplay1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_NameDisplay1_i);
            var _StreamBroadcastContainerSkin_VideoControlsOverlay1_factory:* = new DeferredInstanceFromFunction(this._StreamBroadcastContainerSkin_VideoControlsOverlay1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_NameDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AchievementDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_VideoControlsOverlay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["audioActivityIndicator"]}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"videoWaiting", overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AjaxLoader1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_StreamBroadcastContainerSkin_HGroup1"]}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_NameDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AchievementDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]}), new State({name:"audioOnly", stateGroups:["audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_NameDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AchievementDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AudioOnlyIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"audioOnlyAndOver", stateGroups:["overStates", "audioOnlyStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_VideoControlsOverlay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["audioActivityIndicator"]}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AudioOnlyIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"blocked", stateGroups:["blockedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_NameDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AchievementDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_BlockedIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]})]}), new State({name:"blockedAndOver", stateGroups:["blockedStates", "overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_VideoControlsOverlay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["audioActivityIndicator"]}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_BlockedIndicator1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["contentGroup"]}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_StreamBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"disabled", overrides:[new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_NameDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"}), new AddItems().initializeFromObject({itemsFactory:_StreamBroadcastContainerSkin_AchievementDisplay1_factory, destination:"_StreamBroadcastContainerSkin_HGroup1", propertyName:"mxmlContent", position:"first"})]})];
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
            this.proIndicator.width = Math.round(this.proIndicator.getStyle("iconWidth") * Math.max(15, Math.min(50, param2 / 17)) / 18);
            return;
        }// end function

        private function _StreamBroadcastContainerSkin_Transition1_c() : Transition
        {
            var _loc_1:* = new Transition();
            _loc_1.effect = this._StreamBroadcastContainerSkin_Fade1_i();
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_Fade1_i() : Fade
        {
            var _loc_1:* = new Fade();
            _loc_1.duration = 300;
            this._StreamBroadcastContainerSkin_Fade1 = _loc_1;
            BindingManager.executeBindings(this, "_StreamBroadcastContainerSkin_Fade1", this._StreamBroadcastContainerSkin_Fade1);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._StreamBroadcastContainerSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 4079166;
            _loc_1.weight = 1;
            this._StreamBroadcastContainerSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_StreamBroadcastContainerSkin_SolidColorStroke1", this._StreamBroadcastContainerSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_Group1_i() : Group
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

        private function _StreamBroadcastContainerSkin_AudioOnlyIndicator1_i() : AudioOnlyIndicator
        {
            var _loc_1:* = new AudioOnlyIndicator();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.id = "audioOnlyIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.audioOnlyIndicator = _loc_1;
            BindingManager.executeBindings(this, "audioOnlyIndicator", this.audioOnlyIndicator);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_BlockedIndicator1_i() : BlockedIndicator
        {
            var _loc_1:* = new BlockedIndicator();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.id = "blockedIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.blockedIndicator = _loc_1;
            BindingManager.executeBindings(this, "blockedIndicator", this.blockedIndicator);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_AudioActivityBar1_i() : AudioActivityBar
        {
            var _loc_1:* = new AudioActivityBar();
            _loc_1.left = 5;
            _loc_1.bottom = 5;
            _loc_1.initialized(this, "audioActivityIndicator");
            this.audioActivityIndicator = _loc_1;
            BindingManager.executeBindings(this, "audioActivityIndicator", this.audioActivityIndicator);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_VideoControlsOverlay1_i() : VideoControlsOverlay
        {
            var _loc_1:* = new VideoControlsOverlay();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.id = "videoControlsOverlay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.videoControlsOverlay = _loc_1;
            BindingManager.executeBindings(this, "videoControlsOverlay", this.videoControlsOverlay);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_HGroup1_i() : HGroup
        {
            var _loc_1:* = new HGroup();
            _loc_1.top = 5;
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.gap = 5;
            _loc_1.horizontalAlign = "right";
            _loc_1.verticalAlign = "middle";
            _loc_1.mxmlContent = [this._StreamBroadcastContainerSkin_ProIndicator1_i()];
            _loc_1.id = "_StreamBroadcastContainerSkin_HGroup1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._StreamBroadcastContainerSkin_HGroup1 = _loc_1;
            BindingManager.executeBindings(this, "_StreamBroadcastContainerSkin_HGroup1", this._StreamBroadcastContainerSkin_HGroup1);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_AchievementDisplay1_i() : AchievementDisplay
        {
            var _loc_1:* = new AchievementDisplay();
            _loc_1.initialized(this, "iconAchiev");
            this.iconAchiev = _loc_1;
            BindingManager.executeBindings(this, "iconAchiev", this.iconAchiev);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.percentWidth = 100;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("color", 16777215);
            _loc_1.setStyle("paddingTop", 2);
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_ProIndicator1_i() : ProIndicator
        {
            var _loc_1:* = new ProIndicator();
            _loc_1.sizeInclude = false;
            _loc_1.showLabel = false;
            _loc_1.id = "proIndicator";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.proIndicator = _loc_1;
            BindingManager.executeBindings(this, "proIndicator", this.proIndicator);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "_StreamBroadcastContainerSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._StreamBroadcastContainerSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_StreamBroadcastContainerSkin_AjaxLoader1", this._StreamBroadcastContainerSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _StreamBroadcastContainerSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Array
            {
                var _loc_1:* = [border, videoControlsOverlay];
                if (_loc_1 != null)
                {
                }
                if (!(_loc_1 is Array))
                {
                }
                return _loc_1 is Proxy ? (_loc_1) : ([_loc_1]);
            }// end function
            , null, "_StreamBroadcastContainerSkin_Fade1.targets");
            return result;
        }// end function

        public function get _StreamBroadcastContainerSkin_HGroup1() : HGroup
        {
            return this._111238327_StreamBroadcastContainerSkin_HGroup1;
        }// end function

        public function set _StreamBroadcastContainerSkin_HGroup1(param1:HGroup) : void
        {
            var _loc_2:* = this._111238327_StreamBroadcastContainerSkin_HGroup1;
            if (_loc_2 !== param1)
            {
                this._111238327_StreamBroadcastContainerSkin_HGroup1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_StreamBroadcastContainerSkin_HGroup1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _StreamBroadcastContainerSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._1297066686_StreamBroadcastContainerSkin_SolidColorStroke1;
        }// end function

        public function set _StreamBroadcastContainerSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1297066686_StreamBroadcastContainerSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._1297066686_StreamBroadcastContainerSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_StreamBroadcastContainerSkin_SolidColorStroke1", _loc_2, param1));
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

        public function get blockedIndicator() : BlockedIndicator
        {
            return this._493512067blockedIndicator;
        }// end function

        public function set blockedIndicator(param1:BlockedIndicator) : void
        {
            var _loc_2:* = this._493512067blockedIndicator;
            if (_loc_2 !== param1)
            {
                this._493512067blockedIndicator = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "blockedIndicator", _loc_2, param1));
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

        public function get iconAchiev() : AchievementDisplay
        {
            return this._1028312467iconAchiev;
        }// end function

        public function set iconAchiev(param1:AchievementDisplay) : void
        {
            var _loc_2:* = this._1028312467iconAchiev;
            if (_loc_2 !== param1)
            {
                this._1028312467iconAchiev = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconAchiev", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get nameDisplay() : NameDisplay
        {
            return this._1844466615nameDisplay;
        }// end function

        public function set nameDisplay(param1:NameDisplay) : void
        {
            var _loc_2:* = this._1844466615nameDisplay;
            if (_loc_2 !== param1)
            {
                this._1844466615nameDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameDisplay", _loc_2, param1));
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

        public function get videoControlsOverlay() : VideoControlsOverlay
        {
            return this._1996457281videoControlsOverlay;
        }// end function

        public function set videoControlsOverlay(param1:VideoControlsOverlay) : void
        {
            var _loc_2:* = this._1996457281videoControlsOverlay;
            if (_loc_2 !== param1)
            {
                this._1996457281videoControlsOverlay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "videoControlsOverlay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : StreamBroadcastContainer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:StreamBroadcastContainer) : void
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
