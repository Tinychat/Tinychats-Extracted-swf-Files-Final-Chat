package com.tinychat.ui.skins.gotham.components.social.chat
{
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.layouts.general.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;

    public class PrivateChatUserButtonBarSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:PrivateChatUserButtonBar;

        public function PrivateChatUserButtonBarSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._PrivateChatUserButtonBarSkin_Scroller1_c()];
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

        override protected function measure() : void
        {
            super.measure();
            measuredMinWidth = this.dataGroup.measuredMinWidth;
            measuredMinHeight = this.dataGroup.measuredMinHeight;
            measuredWidth = measuredMinWidth;
            measuredHeight = measuredMinHeight;
            return;
        }// end function

        private function dataGroupUpdateCompleteHandler() : void
        {
            invalidateSize();
            return;
        }// end function

        private function _PrivateChatUserButtonBarSkin_Scroller1_c() : Scroller
        {
            var _loc_1:* = new Scroller();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.viewport = this._PrivateChatUserButtonBarSkin_DataGroup1_i();
            _loc_1.setStyle("horizontalScrollPolicy", "off");
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            return _loc_1;
        }// end function

        private function _PrivateChatUserButtonBarSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.layout = this._PrivateChatUserButtonBarSkin_FlowLayout1_c();
            _loc_1.addEventListener("updateComplete", this.__dataGroup_updateComplete);
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _PrivateChatUserButtonBarSkin_FlowLayout1_c() : FlowLayout
        {
            var _loc_1:* = new FlowLayout();
            _loc_1.borderX = 9;
            _loc_1.gap = 5;
            _loc_1.clipAndEnableScrolling = true;
            return _loc_1;
        }// end function

        public function __dataGroup_updateComplete(event:FlexEvent) : void
        {
            this.dataGroupUpdateCompleteHandler();
            return;
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

        public function get hostComponent() : PrivateChatUserButtonBar
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PrivateChatUserButtonBar) : void
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
