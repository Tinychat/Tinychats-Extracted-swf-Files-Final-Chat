package com.tinychat.ui.skins.gotham.components.broadcast.containers
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.components.video.controls.*;
    import com.tinychat.ui.components.youtube.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import flash.events.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class YouTubeBroadcastContainerSkin extends Skin implements IStateClient2
    {
        public var _YouTubeBroadcastContainerSkin_AjaxLoader1:AjaxLoader;
        public var _YouTubeBroadcastContainerSkin_Group1:Group;
        private var _18843363_YouTubeBroadcastContainerSkin_SolidColorStroke1:SolidColorStroke;
        private var _493512067blockedIndicator:BlockedIndicator;
        private var _1383304148border:Rect;
        private var _1844466615nameDisplay:NameDisplay;
        private var _2112979296playerContainer:YouTubePlayerContainer;
        private var _1996457281videoControlsOverlay:VideoControlsOverlay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:YouTubeBroadcastContainer;

        public function YouTubeBroadcastContainerSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._YouTubeBroadcastContainerSkin_Rect1_i(), this._YouTubeBroadcastContainerSkin_YouTubePlayerContainer1_i(), this._YouTubeBroadcastContainerSkin_Group1_i()];
            this.currentState = "normal";
            var _loc_1:* = new DeferredInstanceFromFunction(this._YouTubeBroadcastContainerSkin_AjaxLoader1_i);
            var _loc_2:* = new DeferredInstanceFromFunction(this._YouTubeBroadcastContainerSkin_BlockedIndicator1_i);
            var _loc_3:* = new DeferredInstanceFromFunction(this._YouTubeBroadcastContainerSkin_NameDisplay1_i);
            var _loc_4:* = new DeferredInstanceFromFunction(this._YouTubeBroadcastContainerSkin_VideoControlsOverlay1_i);
            states = [new State({name:"normal", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]})]}), new State({name:"over", stateGroups:["overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_4, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]}), new SetProperty().initializeFromObject({target:"_YouTubeBroadcastContainerSkin_SolidColorStroke1", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_YouTubeBroadcastContainerSkin_SolidColorStroke1", name:"weight", value:2})]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]})]}), new State({name:"blocked", stateGroups:["blockedStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]})]}), new State({name:"blockedAndOver", stateGroups:["blockedStates", "overStates"], overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_4, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]}), new AddItems().initializeFromObject({itemsFactory:_loc_2, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]})]}), new State({name:"disabled", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_3, destination:null, propertyName:"mxmlContent", position:"after", relativeTo:["_YouTubeBroadcastContainerSkin_Group1"]})]})];
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

        protected function resizeHandler(event:ResizeEvent) : void
        {
            mask.width = Group(event.currentTarget).width;
            mask.height = Group(event.currentTarget).height * 0.913;
            return;
        }// end function

        private function _YouTubeBroadcastContainerSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._YouTubeBroadcastContainerSkin_SolidColorStroke1_i();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 4079166;
            _loc_1.weight = 1;
            this._YouTubeBroadcastContainerSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeBroadcastContainerSkin_SolidColorStroke1", this._YouTubeBroadcastContainerSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_YouTubePlayerContainer1_i() : YouTubePlayerContainer
        {
            var _loc_1:* = new YouTubePlayerContainer();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.initialized(this, "playerContainer");
            this.playerContainer = _loc_1;
            BindingManager.executeBindings(this, "playerContainer", this.playerContainer);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.mask = this._YouTubeBroadcastContainerSkin_Group2_i();
            _loc_1.addEventListener("mouseOut", this.___YouTubeBroadcastContainerSkin_Group1_mouseOut);
            _loc_1.addEventListener("mouseOver", this.___YouTubeBroadcastContainerSkin_Group1_mouseOver);
            _loc_1.addEventListener("resize", this.___YouTubeBroadcastContainerSkin_Group1_resize);
            _loc_1.id = "_YouTubeBroadcastContainerSkin_Group1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._YouTubeBroadcastContainerSkin_Group1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeBroadcastContainerSkin_Group1", this._YouTubeBroadcastContainerSkin_Group1);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.x = 0;
            _loc_1.y = 0;
            _loc_1.mxmlContent = [this._YouTubeBroadcastContainerSkin_Rect2_c()];
            _loc_1.id = "mask";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            mask = _loc_1;
            BindingManager.executeBindings(this, "mask", mask);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.fill = this._YouTubeBroadcastContainerSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeBroadcastContainerSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        public function ___YouTubeBroadcastContainerSkin_Group1_mouseOut(event:MouseEvent) : void
        {
            dispatchEvent(event.clone());
            return;
        }// end function

        public function ___YouTubeBroadcastContainerSkin_Group1_mouseOver(event:MouseEvent) : void
        {
            dispatchEvent(event.clone());
            return;
        }// end function

        public function ___YouTubeBroadcastContainerSkin_Group1_resize(event:ResizeEvent) : void
        {
            this.resizeHandler(event);
            return;
        }// end function

        private function _YouTubeBroadcastContainerSkin_BlockedIndicator1_i() : BlockedIndicator
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

        private function _YouTubeBroadcastContainerSkin_NameDisplay1_i() : NameDisplay
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

        private function _YouTubeBroadcastContainerSkin_VideoControlsOverlay1_i() : VideoControlsOverlay
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

        private function _YouTubeBroadcastContainerSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 0;
            _loc_1.id = "_YouTubeBroadcastContainerSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._YouTubeBroadcastContainerSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_YouTubeBroadcastContainerSkin_AjaxLoader1", this._YouTubeBroadcastContainerSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        public function get _YouTubeBroadcastContainerSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._18843363_YouTubeBroadcastContainerSkin_SolidColorStroke1;
        }// end function

        public function set _YouTubeBroadcastContainerSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._18843363_YouTubeBroadcastContainerSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._18843363_YouTubeBroadcastContainerSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_YouTubeBroadcastContainerSkin_SolidColorStroke1", _loc_2, param1));
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

        public function get playerContainer() : YouTubePlayerContainer
        {
            return this._2112979296playerContainer;
        }// end function

        public function set playerContainer(param1:YouTubePlayerContainer) : void
        {
            var _loc_2:* = this._2112979296playerContainer;
            if (_loc_2 !== param1)
            {
                this._2112979296playerContainer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerContainer", _loc_2, param1));
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

        public function get hostComponent() : YouTubeBroadcastContainer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:YouTubeBroadcastContainer) : void
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
