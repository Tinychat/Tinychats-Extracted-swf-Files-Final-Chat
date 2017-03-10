package com.tinychat.ui.skins.gotham.components.broadcast.selectors
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import com.tinychat.ui.skins.gotham.components.loadingindicators.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class CameraSelectorSkin extends Skin implements IStateClient2
    {
        public var _CameraSelectorSkin_AjaxLoader1:AjaxLoader;
        private var _385593099dataGroup:DataGroup;
        private var _193724820deviceItemRenderer:ClassFactory;
        private var _1041825777iconItemRenderer:ClassFactory;
        private var _402164678scroller:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:CameraSelector;

        public function CameraSelectorSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._CameraSelectorSkin_Scroller1_i()];
            this.currentState = "disabled";
            this._CameraSelectorSkin_ClassFactory2_i();
            this._CameraSelectorSkin_ClassFactory1_i();
            var _loc_1:* = new DeferredInstanceFromFunction(this._CameraSelectorSkin_AjaxLoader1_i);
            states = [new State({name:"disabled", overrides:[]}), new State({name:"normal", overrides:[]}), new State({name:"loading", overrides:[new AddItems().initializeFromObject({itemsFactory:_loc_1, destination:null, propertyName:"mxmlContent", position:"first"})]})];
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

        private function _CameraSelectorSkin_ClassFactory2_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = CameraSelectorSkinInnerClass1;
            _loc_1.properties = {outerDocument:this};
            this.deviceItemRenderer = _loc_1;
            BindingManager.executeBindings(this, "deviceItemRenderer", this.deviceItemRenderer);
            return _loc_1;
        }// end function

        private function _CameraSelectorSkin_ClassFactory1_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = CameraSelectorSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            this.iconItemRenderer = _loc_1;
            BindingManager.executeBindings(this, "iconItemRenderer", this.iconItemRenderer);
            return _loc_1;
        }// end function

        private function _CameraSelectorSkin_AjaxLoader1_i() : AjaxLoader
        {
            var _loc_1:* = new AjaxLoader();
            _loc_1.horizontalCenter = 0;
            _loc_1.verticalCenter = 10;
            _loc_1.id = "_CameraSelectorSkin_AjaxLoader1";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this._CameraSelectorSkin_AjaxLoader1 = _loc_1;
            BindingManager.executeBindings(this, "_CameraSelectorSkin_AjaxLoader1", this._CameraSelectorSkin_AjaxLoader1);
            return _loc_1;
        }// end function

        private function _CameraSelectorSkin_Scroller1_i() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.minWidth = 0;
            _loc_1.minHeight = 0;
            _loc_1.minViewportInset = 20;
            _loc_1.viewport = this._CameraSelectorSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            _loc_1.id = "scroller";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.scroller = _loc_1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return _loc_1;
        }// end function

        private function _CameraSelectorSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.clipAndEnableScrolling = true;
            _loc_1.layout = this._CameraSelectorSkin_TileLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _CameraSelectorSkin_TileLayout1_c() : TileLayout
        {
            var _loc_1:* = new TileLayout();
            _loc_1.requestedColumnCount = 3;
            _loc_1.columnWidth = 126;
            _loc_1.rowHeight = 121;
            _loc_1.horizontalGap = 20;
            _loc_1.verticalGap = 10;
            _loc_1.clipAndEnableScrolling = true;
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

        public function get deviceItemRenderer() : ClassFactory
        {
            return this._193724820deviceItemRenderer;
        }// end function

        public function set deviceItemRenderer(param1:ClassFactory) : void
        {
            var _loc_2:* = this._193724820deviceItemRenderer;
            if (_loc_2 !== param1)
            {
                this._193724820deviceItemRenderer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "deviceItemRenderer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get iconItemRenderer() : ClassFactory
        {
            return this._1041825777iconItemRenderer;
        }// end function

        public function set iconItemRenderer(param1:ClassFactory) : void
        {
            var _loc_2:* = this._1041825777iconItemRenderer;
            if (_loc_2 !== param1)
            {
                this._1041825777iconItemRenderer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "iconItemRenderer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get scroller() : Scroller
        {
            return this._402164678scroller;
        }// end function

        public function set scroller(param1:Scroller) : void
        {
            var _loc_2:* = this._402164678scroller;
            if (_loc_2 !== param1)
            {
                this._402164678scroller = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scroller", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : CameraSelector
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:CameraSelector) : void
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
