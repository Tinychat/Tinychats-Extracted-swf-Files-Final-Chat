package com.tinychat.ui.skins.gotham.components.broadcast.selectors
{
    import com.tinychat.ui.components.broadcast.selectors.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.layouts.*;

    public class MicrophoneModeSelectorSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _1041825777iconItemRenderer:ClassFactory;
        private var _402164678scroller:Scroller;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ItemSelectorBase;

        public function MicrophoneModeSelectorSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._MicrophoneModeSelectorSkin_Scroller1_i()];
            this.currentState = "disabled";
            this._MicrophoneModeSelectorSkin_ClassFactory1_i();
            states = [new State({name:"disabled", overrides:[]}), new State({name:"normal", overrides:[]})];
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

        private function _MicrophoneModeSelectorSkin_ClassFactory1_i() : ClassFactory
        {
            var _loc_1:* = new ClassFactory();
            _loc_1.generator = MicrophoneModeSelectorSkinInnerClass0;
            _loc_1.properties = {outerDocument:this};
            this.iconItemRenderer = _loc_1;
            BindingManager.executeBindings(this, "iconItemRenderer", this.iconItemRenderer);
            return _loc_1;
        }// end function

        private function _MicrophoneModeSelectorSkin_Scroller1_i() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.minWidth = 0;
            _loc_1.minHeight = 0;
            _loc_1.minViewportInset = 20;
            _loc_1.viewport = this._MicrophoneModeSelectorSkin_DataGroup1_i();
            _loc_1.setStyle("verticalScrollPolicy", "off");
            _loc_1.id = "scroller";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.scroller = _loc_1;
            BindingManager.executeBindings(this, "scroller", this.scroller);
            return _loc_1;
        }// end function

        private function _MicrophoneModeSelectorSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.layout = this._MicrophoneModeSelectorSkin_HorizontalLayout1_c();
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _MicrophoneModeSelectorSkin_HorizontalLayout1_c() : HorizontalLayout
        {
            var _loc_1:* = new HorizontalLayout();
            _loc_1.gap = 20;
            _loc_1.horizontalAlign = "center";
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

        public function get hostComponent() : ItemSelectorBase
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ItemSelectorBase) : void
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
