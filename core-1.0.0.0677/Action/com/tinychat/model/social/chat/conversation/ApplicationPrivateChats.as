package com.tinychat.model.social.chat.conversation
{
    import __AS3__.vec.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.lists.*;
    import com.tinychat.model.sounds.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class ApplicationPrivateChats extends Object
    {
        private var javascript:ApplicationJavascript;
        private var soundEffect:ChatSoundEffect;
        private var sources:Vector.<AbstractPrivateChats>;
        private var _list:IListAggregation;
        private var selectedConversations:AbstractPrivateChats;
        private var _currentConversationChanged:Signal;
        private var _conversationUnreadMessageCountChanged:Signal;

        public function ApplicationPrivateChats(param1:ApplicationJavascript, param2:ChatSoundEffect)
        {
            this.javascript = param1;
            this.soundEffect = param2;
            this.sources = new Vector.<AbstractPrivateChats>;
            this._list = new IListAggregation();
            this._currentConversationChanged = new Signal();
            this._conversationUnreadMessageCountChanged = new Signal(AbstractUserConversation, uint);
            return;
        }// end function

        public function get conversationUnreadMessageCountChanged() : ISignal
        {
            return this._conversationUnreadMessageCountChanged;
        }// end function

        public function get conversations() : IList
        {
            return this._list;
        }// end function

        public function get currentConversation() : AbstractUserConversation
        {
            return this.selectedConversations ? (this.selectedConversations.selectedConversation) : (null);
        }// end function

        public function set currentConversation(param1:AbstractUserConversation) : void
        {
            var _loc_2:AbstractPrivateChats = null;
            if (this.currentConversation != param1)
            {
                this.selectedConversations = null;
                if (param1)
                {
                    for each (_loc_2 in this.sources)
                    {
                        
                        if (_loc_2.hasConversation(param1))
                        {
                            this.selectedConversations = _loc_2;
                            this.selectedConversations.selectedConversation = param1;
                            break;
                        }
                    }
                }
                this._currentConversationChanged.dispatch(this.currentConversation);
            }
            return;
        }// end function

        public function get currentConversationChanged() : ISignal
        {
            return this._currentConversationChanged;
        }// end function

        public function get conversationsWithUnreadMessagesCount() : uint
        {
            var _loc_3:AbstractUserConversation = null;
            var _loc_1:uint = 0;
            var _loc_2:uint = 0;
            while (_loc_2 < this._list.length)
            {
                
                _loc_3 = AbstractUserConversation(this._list.getItemAt(_loc_2));
                if (_loc_3.unreadMessageCount > 0)
                {
                    _loc_1 = _loc_1 + 1;
                }
                _loc_2 = _loc_2 + 1;
            }
            return _loc_1;
        }// end function

        public function postChat(param1:String, param2:Boolean = true) : void
        {
            if (this.currentConversation)
            {
                this.selectedConversations.postChat(param1, param2);
                this.soundEffect.play();
            }
            return;
        }// end function

        public function addSource(param1:AbstractPrivateChats) : void
        {
            if (this.sources.indexOf(param1) == -1)
            {
                this.sources.push(param1);
                this._list.addItem(param1.conversations);
                param1.conversationUnreadMessageCountChanged.add(this.conversationUnreadMessageCountChangedHandler);
            }
            return;
        }// end function

        private function conversationUnreadMessageCountChangedHandler(param1:AbstractUserConversation, param2:uint) : void
        {
            this._conversationUnreadMessageCountChanged.dispatch(param1, param2);
            this.javascript.privateMessageReceived(param1);
            this.soundEffect.play();
            return;
        }// end function

    }
}
