package com.tinychat.ui.skins.gotham.components.social.chat
{
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.components.social.chat.list.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class PublicChatViewSkin extends Skin
    {
        private var _1599613778chatInput:ChatInput;
        private var _1437158422chatList:UserPopupMenuChatList;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:PublicChatView;

        public function PublicChatViewSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._PublicChatViewSkin_Rect1_c(), this._PublicChatViewSkin_UserPopupMenuChatList1_i(), this._PublicChatViewSkin_ChatInput1_i()];
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
            if (this.chatList)
            {
            }
            if (this.chatInput)
            {
                this.chatList.bottom = this.chatInput.visible ? (this.chatInput.height) : (0);
            }
            return;
        }// end function

        private function _PublicChatViewSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._PublicChatViewSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PublicChatViewSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _PublicChatViewSkin_UserPopupMenuChatList1_i() : UserPopupMenuChatList
        {
            var _loc_1:* = new UserPopupMenuChatList();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 35;
            _loc_1.id = "chatList";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatList = _loc_1;
            BindingManager.executeBindings(this, "chatList", this.chatList);
            return _loc_1;
        }// end function

        private function _PublicChatViewSkin_ChatInput1_i() : ChatInput
        {
            var _loc_1:* = new ChatInput();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.bottom = 0;
            _loc_1.height = 35;
            _loc_1.id = "chatInput";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatInput = _loc_1;
            BindingManager.executeBindings(this, "chatInput", this.chatInput);
            return _loc_1;
        }// end function

        public function get chatInput() : ChatInput
        {
            return this._1599613778chatInput;
        }// end function

        public function set chatInput(param1:ChatInput) : void
        {
            var _loc_2:* = this._1599613778chatInput;
            if (_loc_2 !== param1)
            {
                this._1599613778chatInput = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatInput", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get chatList() : UserPopupMenuChatList
        {
            return this._1437158422chatList;
        }// end function

        public function set chatList(param1:UserPopupMenuChatList) : void
        {
            var _loc_2:* = this._1437158422chatList;
            if (_loc_2 !== param1)
            {
                this._1437158422chatList = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatList", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : PublicChatView
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PublicChatView) : void
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
