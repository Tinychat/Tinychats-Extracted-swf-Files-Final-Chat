package com.tinychat.ui.skins.gotham.components.youtube
{
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.skins.gotham.components.video.controls.*;
    import flash.events.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class YouTubeSelectionItemRendererSkin extends Skin implements IStateClient2
    {
        private var _484847821addButton:ToggleButton;
        private var _2080885097defaultThumbnailDisplay:VectorImage;
        private var _1184053038labelDisplay:Label;
        private var _1701494326thumbnailDisplay:AdvancedBitmapImage;
        private var _2050771691thumbnailDisplayContainer:Group;
        private var _737765619thumbnailGroup:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ButtonBarButton;

        public function YouTubeSelectionItemRendererSkin()
        {
            mx_internal::_document = this;
            this.width = 90;
            this.mxmlContent = [this._YouTubeSelectionItemRendererSkin_Group1_i(), this._YouTubeSelectionItemRendererSkin_Label1_i()];
            this.currentState = "up";
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[]}), new State({name:"down", stateGroups:["downStates"], overrides:[]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[]})];
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

        protected function addPlaylistButton_changeHandler(event:Event) : void
        {
            if (ToggleButton(event.currentTarget).selected)
            {
                event.stopImmediatePropagation();
                event.preventDefault();
            }
            return;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 75;
            _loc_1.mxmlContent = [this._YouTubeSelectionItemRendererSkin_Group2_i(), this._YouTubeSelectionItemRendererSkin_ToggleButton1_i(), this._YouTubeSelectionItemRendererSkin_Rect2_c(), this._YouTubeSelectionItemRendererSkin_Rect3_c()];
            _loc_1.id = "thumbnailDisplayContainer";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.thumbnailDisplayContainer = _loc_1;
            BindingManager.executeBindings(this, "thumbnailDisplayContainer", this.thumbnailDisplayContainer);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Group2_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.mxmlContent = [this._YouTubeSelectionItemRendererSkin_Rect1_c(), this._YouTubeSelectionItemRendererSkin_VectorImage1_i(), this._YouTubeSelectionItemRendererSkin_AdvancedBitmapImage1_i()];
            _loc_1.id = "thumbnailGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.thumbnailGroup = _loc_1;
            BindingManager.executeBindings(this, "thumbnailGroup", this.thumbnailGroup);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.fill = this._YouTubeSelectionItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_VectorImage1_i() : VectorImage
        {
            var _loc_1:* = new VectorImage();
            _loc_1.left = 5;
            _loc_1.right = 5;
            _loc_1.verticalCenter = 0;
            _loc_1.setStyle("tintColor", 16777215);
            _loc_1.id = "defaultThumbnailDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.defaultThumbnailDisplay = _loc_1;
            BindingManager.executeBindings(this, "defaultThumbnailDisplay", this.defaultThumbnailDisplay);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
        {
            var _loc_1:* = new AdvancedBitmapImage();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.initialized(this, "thumbnailDisplay");
            this.thumbnailDisplay = _loc_1;
            BindingManager.executeBindings(this, "thumbnailDisplay", this.thumbnailDisplay);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_ToggleButton1_i() : ToggleButton
        {
            var _loc_1:* = new ToggleButton();
            _loc_1.right = 4;
            _loc_1.bottom = 4;
            _loc_1.setStyle("skinClass", AddSmallButtonSkin);
            _loc_1.addEventListener("change", this.__addButton_change);
            _loc_1.id = "addButton";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.addButton = _loc_1;
            BindingManager.executeBindings(this, "addButton", this.addButton);
            return _loc_1;
        }// end function

        public function __addButton_change(event:Event) : void
        {
            this.addPlaylistButton_changeHandler(event);
            return;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.stroke = this._YouTubeSelectionItemRendererSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._YouTubeSelectionItemRendererSkin_GradientEntry1_c(), this._YouTubeSelectionItemRendererSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15790573;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12566978;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._YouTubeSelectionItemRendererSkin_LinearGradientStroke2_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_LinearGradientStroke2_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.rotation = 90;
            _loc_1.weight = 1;
            _loc_1.entries = [this._YouTubeSelectionItemRendererSkin_GradientEntry3_c(), this._YouTubeSelectionItemRendererSkin_GradientEntry4_c()];
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_GradientEntry3_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 1381653;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_GradientEntry4_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 3487029;
            return _loc_1;
        }// end function

        private function _YouTubeSelectionItemRendererSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.top = 85;
            _loc_1.width = 90;
            _loc_1.maxDisplayedLines = 2;
            _loc_1.setStyle("color", 7445190);
            _loc_1.setStyle("fontSize", 11);
            _loc_1.setStyle("textAlign", "center");
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        public function get addButton() : ToggleButton
        {
            return this._484847821addButton;
        }// end function

        public function set addButton(param1:ToggleButton) : void
        {
            var _loc_2:* = this._484847821addButton;
            if (_loc_2 !== param1)
            {
                this._484847821addButton = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addButton", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get defaultThumbnailDisplay() : VectorImage
        {
            return this._2080885097defaultThumbnailDisplay;
        }// end function

        public function set defaultThumbnailDisplay(param1:VectorImage) : void
        {
            var _loc_2:* = this._2080885097defaultThumbnailDisplay;
            if (_loc_2 !== param1)
            {
                this._2080885097defaultThumbnailDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "defaultThumbnailDisplay", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get labelDisplay() : Label
        {
            return this._1184053038labelDisplay;
        }// end function

        public function set labelDisplay(param1:Label) : void
        {
            var _loc_2:* = this._1184053038labelDisplay;
            if (_loc_2 !== param1)
            {
                this._1184053038labelDisplay = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelDisplay", _loc_2, param1));
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

        public function get thumbnailDisplayContainer() : Group
        {
            return this._2050771691thumbnailDisplayContainer;
        }// end function

        public function set thumbnailDisplayContainer(param1:Group) : void
        {
            var _loc_2:* = this._2050771691thumbnailDisplayContainer;
            if (_loc_2 !== param1)
            {
                this._2050771691thumbnailDisplayContainer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumbnailDisplayContainer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get thumbnailGroup() : Group
        {
            return this._737765619thumbnailGroup;
        }// end function

        public function set thumbnailGroup(param1:Group) : void
        {
            var _loc_2:* = this._737765619thumbnailGroup;
            if (_loc_2 !== param1)
            {
                this._737765619thumbnailGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumbnailGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ButtonBarButton
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ButtonBarButton) : void
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
