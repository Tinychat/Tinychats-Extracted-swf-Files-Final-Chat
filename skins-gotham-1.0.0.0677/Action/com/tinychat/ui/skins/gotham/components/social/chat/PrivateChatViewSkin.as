package com.tinychat.ui.skins.gotham.components.social.chat
{
    import com.tinychat.ui.components.social.chat.*;
    import com.tinychat.ui.components.social.chat.list.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.graphics.*;
    import spark.components.*;
    import spark.components.supportClasses.*;
    import spark.primitives.*;

    public class PrivateChatViewSkin extends Skin
    {
        private var _852420684centered:VGroup;
        private var _1599613778chatInput:ChatInput;
        private var _1437158422chatList:UserPopupMenuChatList;
        private var _592402699chatListContainer:VGroup;
        private var _110371416title:Label;
        private var _1975549942userButtonBar:PrivateChatUserButtonBar;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _213507019hostComponent:PrivateChatView;

        public function PrivateChatViewSkin()
        {
            mx_internal::_document = this;
            this.mxmlContent = [this._PrivateChatViewSkin_Rect1_c(), this._PrivateChatViewSkin_VGroup1_i(), this._PrivateChatViewSkin_ChatInput1_i()];
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
            if (this.centered)
            {
                this.centered.width = param1 - 18;
            }
            if (this.chatListContainer)
            {
            }
            if (this.chatInput)
            {
                this.chatListContainer.bottom = this.chatInput.visible ? (this.chatInput.height) : (0);
            }
            return;
        }// end function

        private function _PrivateChatViewSkin_Rect1_c() : Rect
        {
            var _loc_1:* = new Rect();
            _loc_1.left = 0;
            _loc_1.right = 0;
            _loc_1.top = 0;
            _loc_1.bottom = 0;
            _loc_1.fill = this._PrivateChatViewSkin_SolidColor1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_SolidColor1_c() : SolidColor
        {
            var _loc_1:* = new SolidColor();
            _loc_1.color = 16777215;
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_VGroup1_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.percentWidth = 100;
            _loc_1.top = 0;
            _loc_1.bottom = 35;
            _loc_1.paddingTop = 12;
            _loc_1.horizontalAlign = "center";
            _loc_1.mxmlContent = [this._PrivateChatViewSkin_VGroup2_i(), this._PrivateChatViewSkin_PrivateChatUserButtonBar1_i(), this._PrivateChatViewSkin_UserPopupMenuChatList1_i()];
            _loc_1.id = "chatListContainer";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatListContainer = _loc_1;
            BindingManager.executeBindings(this, "chatListContainer", this.chatListContainer);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_VGroup2_i() : VGroup
        {
            var _loc_1:* = new VGroup();
            _loc_1.horizontalAlign = "justify";
            _loc_1.mxmlContent = [this._PrivateChatViewSkin_Label1_i(), this._PrivateChatViewSkin_Line1_c()];
            _loc_1.id = "centered";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.centered = _loc_1;
            BindingManager.executeBindings(this, "centered", this.centered);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_Label1_i() : Label
        {
            var _loc_1:* = new Label();
            _loc_1.top = 12;
            _loc_1.id = "title";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.title = _loc_1;
            BindingManager.executeBindings(this, "title", this.title);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.percentWidth = 100;
            _loc_1.stroke = this._PrivateChatViewSkin_SolidColorStroke1_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_SolidColorStroke1_c() : SolidColorStroke
        {
            var _loc_1:* = new SolidColorStroke();
            _loc_1.color = 14079702;
            _loc_1.weight = 1;
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_PrivateChatUserButtonBar1_i() : PrivateChatUserButtonBar
        {
            var _loc_1:* = new PrivateChatUserButtonBar();
            _loc_1.percentWidth = 100;
            _loc_1.maxHeight = 100;
            _loc_1.id = "userButtonBar";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.userButtonBar = _loc_1;
            BindingManager.executeBindings(this, "userButtonBar", this.userButtonBar);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_UserPopupMenuChatList1_i() : UserPopupMenuChatList
        {
            var _loc_1:* = new UserPopupMenuChatList();
            _loc_1.percentWidth = 100;
            _loc_1.percentHeight = 100;
            _loc_1.id = "chatList";
            if (!_loc_1.document)
            {
                _loc_1.document = this;
            }
            this.chatList = _loc_1;
            BindingManager.executeBindings(this, "chatList", this.chatList);
            return _loc_1;
        }// end function

        private function _PrivateChatViewSkin_ChatInput1_i() : ChatInput
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

        public function get centered() : VGroup
        {
            return this._852420684centered;
        }// end function

        public function set centered(param1:VGroup) : void
        {
            var _loc_2:* = this._852420684centered;
            if (_loc_2 !== param1)
            {
                this._852420684centered = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centered", _loc_2, param1));
                }
            }
            return;
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

        public function get chatListContainer() : VGroup
        {
            return this._592402699chatListContainer;
        }// end function

        public function set chatListContainer(param1:VGroup) : void
        {
            var _loc_2:* = this._592402699chatListContainer;
            if (_loc_2 !== param1)
            {
                this._592402699chatListContainer = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatListContainer", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get title() : Label
        {
            return this._110371416title;
        }// end function

        public function set title(param1:Label) : void
        {
            var _loc_2:* = this._110371416title;
            if (_loc_2 !== param1)
            {
                this._110371416title = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get userButtonBar() : PrivateChatUserButtonBar
        {
            return this._1975549942userButtonBar;
        }// end function

        public function set userButtonBar(param1:PrivateChatUserButtonBar) : void
        {
            var _loc_2:* = this._1975549942userButtonBar;
            if (_loc_2 !== param1)
            {
                this._1975549942userButtonBar = param1;
                if (this.hasEventListener("propertyChange"))
                {
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userButtonBar", _loc_2, param1));
                }
            }
            return;
        }// end function

        public function get hostComponent() : PrivateChatView
        {
            return this._213507019hostComponent;
        }// end function

        public function set hostComponent(param1:PrivateChatView) : void
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
