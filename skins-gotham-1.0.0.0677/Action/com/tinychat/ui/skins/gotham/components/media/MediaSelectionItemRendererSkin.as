package com.tinychat.ui.skins.gotham.components.media
{
    import com.tinychat.ui.components.spark.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class MediaSelectionItemRendererSkin extends Skin implements IStateClient2
    {
        private var _799936938_MediaSelectionItemRendererSkin_GradientEntry3:GradientEntry;
        private var _799936937_MediaSelectionItemRendererSkin_GradientEntry4:GradientEntry;
        private var _1535405344_MediaSelectionItemRendererSkin_LinearGradientStroke2:LinearGradientStroke;
        private var _2080885097defaultThumbnailDisplay:VectorImage;
        private var _1184053038labelDisplay:Label;
        private var _1701494326thumbnailDisplay:AdvancedBitmapImage;
        private var _2050771691thumbnailDisplayContainer:Group;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ButtonBarButton;

        public function MediaSelectionItemRendererSkin()
        {
            mx_internal::_document = this;
            this.width = 90;
            this.mxmlContent = [this._MediaSelectionItemRendererSkin_Group1_i(), this._MediaSelectionItemRendererSkin_Label1_i()];
            this.currentState = "up";
            this.addEventListener("creationComplete", this.___MediaSelectionItemRendererSkin_Skin1_creationComplete);
            states = [new State({name:"up", overrides:[]}), new State({name:"over", stateGroups:["overStates"], overrides:[]}), new State({name:"down", stateGroups:["downStates"], overrides:[]}), new State({name:"disabled", stateGroups:["disabledStates"], overrides:[]}), new State({name:"upAndSelected", stateGroups:["selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_LinearGradientStroke2", name:"weight", value:3}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry3", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry4", name:"color", value:3459567})]}), new State({name:"overAndSelected", stateGroups:["overStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_LinearGradientStroke2", name:"weight", value:3}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry3", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry4", name:"color", value:3459567})]}), new State({name:"downAndSelected", stateGroups:["downStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_LinearGradientStroke2", name:"weight", value:3}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry3", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry4", name:"color", value:3459567})]}), new State({name:"disabledAndSelected", stateGroups:["disabledStates", "selectedUpStates", "selectedStates"], overrides:[new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_LinearGradientStroke2", name:"weight", value:3}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry3", name:"color", value:3459567}), new SetProperty().initializeFromObject({target:"_MediaSelectionItemRendererSkin_GradientEntry4", name:"color", value:3459567})]})];
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

        private function creationCompleteHandler() : void
        {
            this.hostComponent.mouseChildren = false;
            this.hostComponent.useHandCursor = true;
            this.hostComponent.buttonMode = true;
            return;
        }// end function

        private function _MediaSelectionItemRendererSkin_Group1_i() : Group
        {
            var _loc_1:* = new Group();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.height = 75;
            _loc_1.mxmlContent = [this._MediaSelectionItemRendererSkin_Rect1_c(), this._MediaSelectionItemRendererSkin_VectorImage1_i(), this._MediaSelectionItemRendererSkin_AdvancedBitmapImage1_i(), this._MediaSelectionItemRendererSkin_Rect2_c(), this._MediaSelectionItemRendererSkin_Rect3_c()];
            _loc_1.id = "thumbnailDisplayContainer";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.thumbnailDisplayContainer = _loc_1;
            BindingManager.executeBindings(this, "thumbnailDisplayContainer", this.thumbnailDisplayContainer);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 2;
            _loc_1.right = 2;
            _loc_1.top = 2;
            _loc_1.bottom = 2;
            _loc_1.fill = this._MediaSelectionItemRendererSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 0;
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_VectorImage1_i() : VectorImage
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

        private function _MediaSelectionItemRendererSkin_AdvancedBitmapImage1_i() : AdvancedBitmapImage
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

        private function _MediaSelectionItemRendererSkin_Rect2_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 1;
            _loc_1.right = 1;
            _loc_1.top = 1;
            _loc_1.bottom = 1;
            _loc_1.stroke = this._MediaSelectionItemRendererSkin_LinearGradientStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_LinearGradientStroke1_c() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.weight = 1;
            _loc_1.rotation = 90;
            _loc_1.entries = [this._MediaSelectionItemRendererSkin_GradientEntry1_c(), this._MediaSelectionItemRendererSkin_GradientEntry2_c()];
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_GradientEntry1_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 15790573;
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_GradientEntry2_c() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 12566978;
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_Rect3_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.stroke = this._MediaSelectionItemRendererSkin_LinearGradientStroke2_i();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_LinearGradientStroke2_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            _loc_1.weight = 1;
            _loc_1.rotation = 90;
            _loc_1.entries = [this._MediaSelectionItemRendererSkin_GradientEntry3_i(), this._MediaSelectionItemRendererSkin_GradientEntry4_i()];
            this._MediaSelectionItemRendererSkin_LinearGradientStroke2 = _loc_1;
            BindingManager.executeBindings(this, "_MediaSelectionItemRendererSkin_LinearGradientStroke2", this._MediaSelectionItemRendererSkin_LinearGradientStroke2);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_GradientEntry3_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 1381653;
            this._MediaSelectionItemRendererSkin_GradientEntry3 = _loc_1;
            BindingManager.executeBindings(this, "_MediaSelectionItemRendererSkin_GradientEntry3", this._MediaSelectionItemRendererSkin_GradientEntry3);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_GradientEntry4_i() : GradientEntry
        {
            var _loc_1:* = new GradientEntry();
            _loc_1.color = 3487029;
            this._MediaSelectionItemRendererSkin_GradientEntry4 = _loc_1;
            BindingManager.executeBindings(this, "_MediaSelectionItemRendererSkin_GradientEntry4", this._MediaSelectionItemRendererSkin_GradientEntry4);
            return _loc_1;
        }// end function

        private function _MediaSelectionItemRendererSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.width = 90;
            _loc_1.top = 85;
            _loc_1.maxDisplayedLines = 2;
            _loc_1.setStyle("textAlign", "center");
            _loc_1.setStyle("fontSize", 11);
            _loc_1.setStyle("color", 7445190);
            _loc_1.id = "labelDisplay";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.labelDisplay = _loc_1;
            BindingManager.executeBindings(this, "labelDisplay", this.labelDisplay);
            return _loc_1;
        }// end function

        public function ___MediaSelectionItemRendererSkin_Skin1_creationComplete(event:FlexEvent) : void
        {
            this.creationCompleteHandler();
            return;
        }// end function

        public function get _MediaSelectionItemRendererSkin_GradientEntry3() : GradientEntry
        {
            return this._799936938_MediaSelectionItemRendererSkin_GradientEntry3;
        }// end function

        public function set _MediaSelectionItemRendererSkin_GradientEntry3(param1:GradientEntry) : void
        {
            var _loc_2:* = this._799936938_MediaSelectionItemRendererSkin_GradientEntry3;
            if (_loc_2 !== param1)
            {
                this._799936938_MediaSelectionItemRendererSkin_GradientEntry3 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MediaSelectionItemRendererSkin_GradientEntry3", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _MediaSelectionItemRendererSkin_GradientEntry4() : GradientEntry
        {
            return this._799936937_MediaSelectionItemRendererSkin_GradientEntry4;
        }// end function

        public function set _MediaSelectionItemRendererSkin_GradientEntry4(param1:GradientEntry) : void
        {
            var _loc_2:* = this._799936937_MediaSelectionItemRendererSkin_GradientEntry4;
            if (_loc_2 !== param1)
            {
                this._799936937_MediaSelectionItemRendererSkin_GradientEntry4 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MediaSelectionItemRendererSkin_GradientEntry4", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get _MediaSelectionItemRendererSkin_LinearGradientStroke2() : LinearGradientStroke
        {
            return this._1535405344_MediaSelectionItemRendererSkin_LinearGradientStroke2;
        }// end function

        public function set _MediaSelectionItemRendererSkin_LinearGradientStroke2(param1:LinearGradientStroke) : void
        {
            var _loc_2:* = this._1535405344_MediaSelectionItemRendererSkin_LinearGradientStroke2;
            if (_loc_2 !== param1)
            {
                this._1535405344_MediaSelectionItemRendererSkin_LinearGradientStroke2 = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_MediaSelectionItemRendererSkin_LinearGradientStroke2", _loc_2, param1));
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
