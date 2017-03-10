package com.tinychat.ui.skins.gotham.components.social.effects.video
{
    import com.tinychat.ui.components.broadcast.containers.*;
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.filters.*;
    import spark.primitives.*;

    public class VideoFiltersListItemRendererSkin extends Skin implements IStateClient2
    {
        private var _925956554_VideoFiltersListItemRendererSkin_SolidColor1:SolidColor;
        private var _1820488782_VideoFiltersListItemRendererSkin_SolidColorStroke1:SolidColorStroke;
        private var _1383304148border:Rect;
        private var _809612678contentGroup:Group;
        private var _1844466615nameDisplay:NameDisplay;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VideoBroadcastContainer;

        public function VideoFiltersListItemRendererSkin()
        {
            mx_internal::_document = this;
            this.filters = [this._VideoFiltersListItemRendererSkin_DropShadowFilter1_c()];
            this.mxmlContent = [this._VideoFiltersListItemRendererSkin_Rect1_i(), this._VideoFiltersListItemRendererSkin_Group1_c(), this._VideoFiltersListItemRendererSkin_NameDisplay1_i()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[new SetProperty().initializeFromObject({target:"_VideoFiltersListItemRendererSkin_SolidColor1", name:"color", value:15201786})]}), new State({name:"selected", overrides:[new SetProperty().initializeFromObject({target:"_VideoFiltersListItemRendererSkin_SolidColorStroke1", name:"color", value:9560897}), new SetProperty().initializeFromObject({target:"_VideoFiltersListItemRendererSkin_SolidColor1", name:"color", value:14677670})]}), new State({name:"videoWaiting", overrides:[]}), new State({name:"audioOnly", stateGroups:["audioOnlyStates"], overrides:[]}), new State({name:"audioOnlyAndOver", stateGroups:["overStates", "audioOnlyStates"], overrides:[new SetProperty().initializeFromObject({target:"_VideoFiltersListItemRendererSkin_SolidColor1", name:"color", value:15201786})]}), new State({name:"disabled", overrides:[]})];
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

        private function _VideoFiltersListItemRendererSkin_DropShadowFilter1_c() : DropShadowFilter
        {
            var _loc_1:* = new DropShadowFilter();
            _loc_1.color = 0;
            _loc_1.alpha = 0.2;
            _loc_1.blurX = 2;
            _loc_1.blurY = 2;
            _loc_1.distance = 1;
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_Rect1_i() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 2;
            _loc_1.stroke = this._VideoFiltersListItemRendererSkin_SolidColorStroke1_i();
            _loc_1.fill = this._VideoFiltersListItemRendererSkin_SolidColor1_i();
            _loc_1.initialized(this, "border");
            this.border = _loc_1;
            BindingManager.executeBindings(this, "border", this.border);
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_SolidColorStroke1_i() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 13230315;
            _loc_1.weight = 1;
            this._VideoFiltersListItemRendererSkin_SolidColorStroke1 = _loc_1;
            BindingManager.executeBindings(this, "_VideoFiltersListItemRendererSkin_SolidColorStroke1", this._VideoFiltersListItemRendererSkin_SolidColorStroke1);
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_SolidColor1_i() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16055551;
            this._VideoFiltersListItemRendererSkin_SolidColor1 = _loc_1;
            BindingManager.executeBindings(this, "_VideoFiltersListItemRendererSkin_SolidColor1", this._VideoFiltersListItemRendererSkin_SolidColor1);
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_Group1_c() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 4;
            _loc_1.right = 4;
            _loc_1.top = 4;
            _loc_1.bottom = 27;
            _loc_1.mxmlContent = [this._VideoFiltersListItemRendererSkin_Rect2_c(), this._VideoFiltersListItemRendererSkin_Group2_i()];
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.radiusX = 1;
            _loc_1.stroke = this._VideoFiltersListItemRendererSkin_SolidColorStroke2_c();
            _loc_1.fill = this._VideoFiltersListItemRendererSkin_SolidColor2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_SolidColorStroke2_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 11192789;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_SolidColor2_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 3;
            _loc_1.right = 3;
            _loc_1.top = 3;
            _loc_1.bottom = 3;
            _loc_1.id = "contentGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.contentGroup = _loc_1;
            BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
            return _loc_1;
        }// end function

        private function _VideoFiltersListItemRendererSkin_NameDisplay1_i() : NameDisplay
        {
            var _loc_1:* = new NameDisplay();
            _loc_1.height = 25;
            _loc_1.bottom = 0;
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.maxDisplayedLines = 1;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("fontWeight", "bold");
            _loc_1.setStyle("verticalAlign", "middle");
            _loc_1.id = "nameDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.nameDisplay = _loc_1;
            BindingManager.executeBindings(this, "nameDisplay", this.nameDisplay);
            return _loc_1;
        }// end function

        public function get _VideoFiltersListItemRendererSkin_SolidColor1() : SolidColor
        {
            return this._925956554_VideoFiltersListItemRendererSkin_SolidColor1;
        }// end function

        public function set _VideoFiltersListItemRendererSkin_SolidColor1(param1:SolidColor) : void
        {
            var _loc_2:* = this._925956554_VideoFiltersListItemRendererSkin_SolidColor1;
            if (_loc_2 !== param1)
            {
                this._925956554_VideoFiltersListItemRendererSkin_SolidColor1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoFiltersListItemRendererSkin_SolidColor1", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _VideoFiltersListItemRendererSkin_SolidColorStroke1() : SolidColorStroke
        {
            return this._1820488782_VideoFiltersListItemRendererSkin_SolidColorStroke1;
        }// end function

        public function set _VideoFiltersListItemRendererSkin_SolidColorStroke1(param1:SolidColorStroke) : void
        {
            var _loc_2:* = this._1820488782_VideoFiltersListItemRendererSkin_SolidColorStroke1;
            if (_loc_2 !== param1)
            {
                this._1820488782_VideoFiltersListItemRendererSkin_SolidColorStroke1 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoFiltersListItemRendererSkin_SolidColorStroke1", _loc_2, param1));
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

        public function get hostComponent() : VideoBroadcastContainer
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VideoBroadcastContainer) : void
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
