package com.tinychat.ui.skins.gotham.components.social.chat.list
{
    import com.tinychat.ui.components.social.chat.list.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.states.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.core.*;

    public class ChatListSkin extends Skin implements IStateClient2
    {
        private var _385593099dataGroup:DataGroup;
        private var _21672681textSelectionCanvas:SpriteVisualElement;
        private var _1618627376verticalScrollBar:VScrollBar;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:ChatList;

        public function ChatListSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._ChatListSkin_SpriteVisualElement1_i(), this._ChatListSkin_DataGroup1_i(), this._ChatListSkin_VScrollBar1_i()];
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            this.dataGroup.right = this.verticalScrollBar.width + 8;
            return;
        }// end function

        private function _ChatListSkin_SpriteVisualElement1_i() : SpriteVisualElement
        {
            var _loc_1:* = new SpriteVisualElement();
            _loc_1.left = 8;
            _loc_1.right = 8;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.initialized(this, "textSelectionCanvas");
            this.textSelectionCanvas = _loc_1;
            BindingManager.executeBindings(this, "textSelectionCanvas", this.textSelectionCanvas);
            return _loc_1;
        }// end function

        private function _ChatListSkin_DataGroup1_i() : DataGroup
        {
            var _loc_1:* = new DataGroup();
            _loc_1.left = 8;
            _loc_1.right = 8;
            _loc_1.top = 0;
            _loc_1.bottom = 8;
            _loc_1.minWidth = 0;
            _loc_1.minHeight = 0;
            _loc_1.id = "dataGroup";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.dataGroup = _loc_1;
            BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
            return _loc_1;
        }// end function

        private function _ChatListSkin_VScrollBar1_i() : VScrollBar
        {
            var _loc_1:* = new VScrollBar();
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.id = "verticalScrollBar";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.verticalScrollBar = _loc_1;
            BindingManager.executeBindings(this, "verticalScrollBar", this.verticalScrollBar);
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

        public function get textSelectionCanvas() : SpriteVisualElement
        {
            return this._21672681textSelectionCanvas;
        }// end function

        public function set textSelectionCanvas(param1:SpriteVisualElement) : void
        {
            var _loc_2:* = this._21672681textSelectionCanvas;
            if (_loc_2 !== param1)
            {
                this._21672681textSelectionCanvas = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "textSelectionCanvas", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get verticalScrollBar() : VScrollBar
        {
            return this._1618627376verticalScrollBar;
        }// end function

        public function set verticalScrollBar(param1:VScrollBar) : void
        {
            var _loc_2:* = this._1618627376verticalScrollBar;
            if (_loc_2 !== param1)
            {
                this._1618627376verticalScrollBar = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalScrollBar", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : ChatList
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:ChatList) : void
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
