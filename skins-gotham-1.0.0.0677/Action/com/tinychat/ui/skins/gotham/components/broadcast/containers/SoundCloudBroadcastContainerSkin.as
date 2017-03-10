package com.tinychat.ui.skins.gotham.components.broadcast.containers
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.skins.gotham.icons.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class SoundCloudBroadcastContainerSkin extends Skin implements IBindingClient, IStateClient2
    {
        private var _1915470812_SoundCloudBroadcastContainerSkin_SolidColorStroke1:SolidColorStroke;
        private var _1383304148border:Rect;
        private var _1844466615nameDisplay:NameDisplay;
        private var _714966015soundCloudIcon:VectorImage;
        private var _1701494326thumbnailDisplay:AdvancedBitmapImage;
        private var _1996457281videoControlsOverlay:VideoControlsOverlay;
        private var __moduleFactoryInitialized:Boolean = false;
        var _bindings:Array;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _213507019hostComponent:SoundCloudBroadcastContainer;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public function SoundCloudBroadcastContainerSkin()
        {
            var bindings:Array;
            var target:Object;
            var watcherSetupUtilClass:Object;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            mx_internal::_document = this;
            bindings = this._SoundCloudBroadcastContainerSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_tinychat_ui_skins_gotham_components_broadcast_containers_SoundCloudBroadcastContainerSkinWatcherSetupUtil");
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
            this.mxmlContent = [this._SoundCloudBroadcastContainerSkin_Rect1_i(), this._SoundCloudBroadcastContainerSkin_VectorImage1_i(), this._SoundCloudBroadcastContainerSkin_AdvancedBitmapImage1_i()];
            this.currentState = "normal";
            var _SoundCloudBroadcastContainerSkin_NameDisplay1_factory:* = new DeferredInstanceFromFunction(this._SoundCloudBroadcastContainerSkin_NameDisplay1_i);
            var _SoundCloudBroadcastContainerSkin_VideoControlsOverlay1_factory:* = new DeferredInstanceFromFunction(this._SoundCloudBroadcastContainerSkin_VideoControlsOverlay1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_SoundCloudBroadcastContainerSkin_NameDisplay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["border"]})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_SoundCloudBroadcastContainerSkin_VideoControlsOverlay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["thumbnailDisplay"]}), new SetProperty().initializeFromObject({target:"_SoundCloudBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_SoundCloudBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"disabled", overrides:[new AddItems().initializeFromObject({itemsFactory:_SoundCloudBroadcastContainerSkin_NameDisplay1_factory, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["border"]})]})];
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
            if (this.soundCloudIcon)
            {
                this.soundCloudIcon.width = Math.round(param1 * 0.8);
            }
            return;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._SoundCloudBroadcastContainerSkin_SolidColorStroke1_i();
            _loc_1.fill = this._SoundCloudBroadcastContainerSkin_SolidColor1_c();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 4079166;
            _loc_1.weight = 1;
            this._SoundCloudBroadcastContainerSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_SoundCloudBroadcastContainerSkin_SolidColorStroke1", this._SoundCloudBroadcastContainerSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.top = 5;
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("color", 16777215);
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.horizontalCenter = 0;
            _loc_1.bottom = 20;
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "soundCloudIcon";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.soundCloudIcon = _loc_1;
            BindingManager.executeBindings(this, "soundCloudIcon", this.soundCloudIcon);
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.initialized(this, "thumbnailDisplay");
            this.thumbnailDisplay = _loc_1;
            BindingManager.executeBindings(this, "thumbnailDisplay", this.thumbnailDisplay);
            return _loc_1;
        }// end function

        private function _SoundCloudBroadcastContainerSkin_VideoControlsOverlay1_i() : VideoControlsOverlay
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

        private function _SoundCloudBroadcastContainerSkin_bindingsSetup() : Array
        {
            var result:Array;
            result[0] = new Binding(this, function () : Object
            {
                return SoundCloudIcon;
            }// end function
            , null, "soundCloudIcon.source");
            return result;
        }// end function

        public function get _SoundCloudBroadcastContainerSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._1915470812_SoundCloudBroadcastContainerSkin_SolidColorStroke1;
        }// end function

        public function set _SoundCloudBroadcastContainerSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1915470812_SoundCloudBroadcastContainerSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._1915470812_SoundCloudBroadcastContainerSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_SoundCloudBroadcastContainerSkin_SolidColorStroke1", _loc_2, param1));
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

        public function get soundCloudIcon() : VectorImage
        {
            return this._714966015soundCloudIcon;
        }// end function

        public function set soundCloudIcon(param1:VectorImage) : void
        {
            var _loc_2:* = this._714966015soundCloudIcon;
            if (_loc_2 !== param1)
            {
                this._714966015soundCloudIcon = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "soundCloudIcon", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get thumbnailDisplay() : AdvancedBitmapImage
        {
            return this._1701494326thumbnailDisplay;
        }// end function

        public function set thumbnailDisplay(param1:AdvancedBitmapImage) : void
        {
            var _loc_2:* = this._1701494326thumbnailDisplay;
            if (_loc_2 !== param1)
            {
                this._1701494326thumbnailDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumbnailDisplay", _loc_2, param1));
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

        public function get hostComponent() : SoundCloudBroadcastContainer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:SoundCloudBroadcastContainer) : void
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
