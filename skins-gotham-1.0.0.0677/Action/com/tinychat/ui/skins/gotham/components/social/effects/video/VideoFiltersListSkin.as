package com.tinychat.ui.skins.gotham.components.social.effects.video
{
    import com.tinychat.ui.components.social.effects.video.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;
    import spark.primitives.*;

    public class VideoFiltersListSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:VideoFiltersList;

        public function VideoFiltersListSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._VideoFiltersListSkin_Rect1_c(), this._VideoFiltersListSkin_Scroller1_c()];
            this.currentState = "normal";
            states = [new State({name:"normal", overrides:[]}), new State({name:"disabled", overrides:[]})];
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

        private function _VideoFiltersListSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._VideoFiltersListSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _VideoFiltersListSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _VideoFiltersListSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.minViewportInset = 1;
            _loc_1.hasFocusableChildren = true;
            _loc_1.viewport = this._VideoFiltersListSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _VideoFiltersListSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.layout = this._VideoFiltersListSkin_TileLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _VideoFiltersListSkin_TileLayout1_c() : TileLayout
        {
            var _loc_1:* = new TileLayout();
            _loc_1.verticalGap = 5;
            _loc_1.horizontalGap = 5;
            _loc_1.horizontalAlign = "justify";
            _loc_1.columnWidth = 124;
            _loc_1.rowHeight = 124;
            _loc_1.useVirtualLayout = true;
            return _loc_1;
        }// end function

        public function get dataGroup() : DataGroup
        {
            return this._385593099dataGroup;
        }// end function

        public function set dataGroup(param1:DataGroup) : void
        {
            var _loc_2:* = this._385593099dataGroup;
            if (_loc_2 !== param1)
            {
                this._385593099dataGroup = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : VideoFiltersList
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:VideoFiltersList) : void
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
