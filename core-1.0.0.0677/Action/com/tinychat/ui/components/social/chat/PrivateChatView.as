package com.tinychat.ui.components.social.chat
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.conversation.*;
    import com.tinychat.model.social.chat.conversation.facebook.*;
    import com.tinychat.model.social.chat.conversation.mqtt.*;
    import com.tinychat.model.social.chat.conversation.tinychat.*;
    import com.tinychat.ui.context.social.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.collections.*;
    import mx.core.*;
    import mx.events.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.modular.core.*;
    import spark.components.supportClasses.*;
    import spark.events.*;

    public class PrivateChatView extends ChatViewBase
    {
        public var title:TextBase;
        public var userButtonBar:PrivateChatUserButtonBar;
        private var context:IModuleContext;
        private var _parentInjector:IInjector;
        private var _dataProvider:ApplicationPrivateChats;
        private var sortedDataProvider:ListCollectionView;
        private var closedConversations:Vector.<AbstractUserConversation>;
        private var vScrollPositionStore:Dictionary;
        private var dataProviderChanged:Boolean;
        private var selectedItemChanged:Boolean;
        private static const SCROLLED_TO_BOTTOM:String = "scrolledToBottom";
        private static var _skinParts:Object = {chatInput:true, title:true, userButtonBar:true, chatList:true};

        public function PrivateChatView()
        {
            this.closedConversations = new Vector.<AbstractUserConversation>;
            this.vScrollPositionStore = new Dictionary(true);
            return;
        }// end function

        public function open(param1:AbstractUserConversation) : void
        {
            if (param1 != this.selectedConversation)
            {
                this.removeFromClosedConversations(param1);
                this.userButtonBar.selectedItem = param1;
            }
            return;
        }// end function

        private function get hasSelectedConversation() : Boolean
        {
            if (this.userButtonBar)
            {
            }
            return this.userButtonBar.hasSelectedItem;
        }// end function

        public function get selectedConversation() : AbstractUserConversation
        {
            if (this.userButtonBar)
            {
                return this.userButtonBar.selectedItem;
            }
            return null;
        }// end function

        public function set dataProvider(param1:ApplicationPrivateChats) : void
        {
            var _loc_2:Sort = null;
            if (this._dataProvider)
            {
            }
            if (this._dataProvider != param1)
            {
                this._dataProvider = param1;
                this._dataProvider.conversationUnreadMessageCountChanged.add(this.conversationUnreadMessageCountChangedHandler);
                _loc_2 = new Sort();
                _loc_2.compareFunction = this.sortFunction;
                this.sortedDataProvider = new ListCollectionView(this._dataProvider.conversations);
                this.sortedDataProvider.filterFunction = this.filterFunction;
                this.sortedDataProvider.refresh();
                this.dataProviderChanged = true;
                invalidateProperties();
            }
            return;
        }// end function

        public function set parentInjector(param1:IInjector) : void
        {
            this._parentInjector = param1;
            return;
        }// end function

        protected function createContext() : void
        {
            var _loc_1:Class = null;
            if (this._parentInjector)
            {
            }
            if (chatList.userPopupMenu)
            {
            }
            if (this.hasSelectedConversation)
            {
                switch(true)
                {
                    case this.selectedConversation is FacebookUserConversation:
                    {
                        _loc_1 = FacebookPrivateChatViewContext;
                        break;
                    }
                    case this.selectedConversation is MqttUserConversation:
                    {
                        _loc_1 = MqttPrivateChatViewContext;
                        break;
                    }
                    case this.selectedConversation is TinychatUserConversation:
                    {
                        _loc_1 = TinychatPrivateChatViewContext;
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            if (_loc_1)
            {
                if (this.context)
                {
                }
            }
            if (!(this.context is _loc_1))
            {
                if (this.context)
                {
                    this.context.dispose();
                }
                this.context = new _loc_1(this, this._parentInjector, chatList.userPopupMenu);
            }
            else if (this.context)
            {
                this.context.dispose();
                this.context = null;
            }
            return;
        }// end function

        override protected function get inputEnabled() : Boolean
        {
            if (this.hasSelectedConversation)
            {
            }
            return this.selectedConversation.canSend;
        }// end function

        override protected function updateChatInputState() : void
        {
            super.updateChatInputState();
            if (!this.hasSelectedConversation)
            {
                chatInputPromptMessage = "";
                invalidateProperties();
            }
            return;
        }// end function

        override protected function commitProperties() : void
        {
            var scrollPosition:Object;
            var scrollFunction:Function;
            if (this.dataProviderChanged)
            {
            }
            if (this.userButtonBar)
            {
                this.userButtonBar.dataProvider = this.sortedDataProvider;
                this.dataProviderChanged = false;
            }
            if (this.selectedItemChanged)
            {
            }
            if (chatList)
            {
            }
            if (chatInput)
            {
                if (chatList.dataProvider)
                {
                    if (chatList.isScrolledToBottom)
                    {
                        this.vScrollPositionStore[chatList.dataProvider] = SCROLLED_TO_BOTTOM;
                    }
                    else
                    {
                        this.vScrollPositionStore[chatList.dataProvider] = chatList.verticalScrollPosition;
                    }
                }
                chatList.dataProvider = this.selectedConversation ? (this.selectedConversation.messages) : (null);
                this.createContext();
                if (this.vScrollPositionStore[this.selectedConversation])
                {
                    scrollPosition = this.vScrollPositionStore[this.selectedConversation];
                    if (scrollPosition == SCROLLED_TO_BOTTOM)
                    {
                        scrollFunction = function () : void
            {
                chatList.scrollToBottom();
                return;
            }// end function
            ;
                    }
                    else
                    {
                        scrollFunction = function () : void
            {
                chatList.verticalScrollPosition = Number(scrollPosition);
                return;
            }// end function
            ;
                    }
                    callLater(scrollFunction);
                }
                this.updateChatInputState();
                if (chatInput.inputEnabled)
                {
                    chatInput.maxChars = this.selectedConversation.maximumMessageLength;
                    callLater(chatInput.setFocus);
                }
                else
                {
                    setFocus();
                }
                dispatchEvent(new Event(Event.CHANGE));
                this.selectedItemChanged = false;
            }
            super.commitProperties();
            return;
        }// end function

        override protected function partAdded(param1:String, param2:Object) : void
        {
            super.partAdded(param1, param2);
            if (param2 == this.userButtonBar)
            {
                this.userButtonBar.itemRenderer = new ClassFactory(PrivateChatUserItemRenderer);
                this.userButtonBar.requireSelection = true;
                this.userButtonBar.addEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                this.userButtonBar.addEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
                this.userButtonBar.addEventListener(FlexEvent.VALUE_COMMIT, this.userButtonBarValueCommitHandler);
                this.userButtonBar.addEventListener(Event.CHANGE, this.userButtonBarValueCommitHandler);
                if (this.dataProviderChanged)
                {
                    invalidateProperties();
                }
            }
            return;
        }// end function

        override protected function partRemoved(param1:String, param2:Object) : void
        {
            super.partRemoved(param1, param2);
            if (param2 == this.userButtonBar)
            {
                this.userButtonBar.removeEventListener(RendererExistenceEvent.RENDERER_ADD, this.rendererAddHandler);
                this.userButtonBar.removeEventListener(RendererExistenceEvent.RENDERER_REMOVE, this.rendererRemoveHandler);
                this.userButtonBar.removeEventListener(FlexEvent.VALUE_COMMIT, this.userButtonBarValueCommitHandler);
                this.userButtonBar.removeEventListener(Event.CHANGE, this.userButtonBarValueCommitHandler);
            }
            return;
        }// end function

        private function rendererAddHandler(event:RendererExistenceEvent) : void
        {
            event.renderer.addEventListener(Event.CLOSE, this.closeHandler);
            return;
        }// end function

        private function rendererRemoveHandler(event:RendererExistenceEvent) : void
        {
            event.renderer.removeEventListener(Event.CLOSE, this.closeHandler);
            return;
        }// end function

        private function userButtonBarValueCommitHandler(event:Event) : void
        {
            this.selectedItemChanged = true;
            invalidateProperties();
            return;
        }// end function

        private function closeHandler(event:Event) : void
        {
            this.closedConversations.push(event.target.data);
            this.sortedDataProvider.refresh();
            return;
        }// end function

        private function filterFunction(param1:Object) : Boolean
        {
            return this.closedConversations.indexOf(param1) == -1;
        }// end function

        private function sortFunction(param1:Object, param2:Object, param3:Array = null) : int
        {
            if (this.userButtonBar)
            {
            }
            if (param1 === this.selectedConversation)
            {
                return -1;
            }
            if (AbstractUserConversation(param1).unreadMessageCount > AbstractUserConversation(param2).unreadMessageCount)
            {
                return -1;
            }
            return 1;
        }// end function

        private function conversationUnreadMessageCountChangedHandler(param1:AbstractUserConversation, param2:uint) : void
        {
            if (param2 > 0)
            {
                this.removeFromClosedConversations(param1);
            }
            this.updateChatInputState();
            return;
        }// end function

        private function removeFromClosedConversations(param1:AbstractUserConversation) : void
        {
            var _loc_2:* = this.closedConversations.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.closedConversations.splice(_loc_2, 1);
                this.sortedDataProvider.refresh();
            }
            return;
        }// end function

        override protected function get skinParts() : Object
        {
            return _skinParts;
        }// end function

    }
}
