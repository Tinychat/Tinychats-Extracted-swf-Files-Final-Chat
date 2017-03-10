package com.tinychat.model.social.chat.conversation
{
    import com.tinychat.model.social.chat.message.*;
    import mx.collections.*;
    import org.osflash.signals.*;

    public class Conversation extends Object
    {
        private var conversation:IList;
        private var _maximumMessageLength:uint;
        private var _unreadMessageCount:uint;
        private var _unreadMessageCountChanged:Signal;

        public function Conversation(param1:uint)
        {
            this.conversation = new ArrayList();
            this._maximumMessageLength = param1;
            this._unreadMessageCount = 0;
            this._unreadMessageCountChanged = new Signal(uint);
            return;
        }// end function

        public function get length() : int
        {
            return this.conversation.length;
        }// end function

        public function get messages() : IList
        {
            return this.conversation;
        }// end function

        public function get maximumMessageLength() : uint
        {
            return this._maximumMessageLength;
        }// end function

        public function get unreadMessageCount() : uint
        {
            return this._unreadMessageCount;
        }// end function

        public function get unreadMessageCountChanged() : ISignal
        {
            return this._unreadMessageCountChanged;
        }// end function

        public function get canSend() : Boolean
        {
            return true;
        }// end function

        public function addChat(param1:AbstractUserChatMessage) : void
        {
            this.conversation.addItem(param1);
            this.setUnreadMessageCount((this.unreadMessageCount + 1));
            return;
        }// end function

        public function addNotice(param1:Message) : void
        {
            this.conversation.addItem(param1);
            return;
        }// end function

        public function markAllRead() : void
        {
            this.setUnreadMessageCount(0);
            return;
        }// end function

        private function setUnreadMessageCount(param1:uint) : void
        {
            if (this._unreadMessageCount != param1)
            {
                this._unreadMessageCount = param1;
                this._unreadMessageCountChanged.dispatch(param1);
            }
            return;
        }// end function

    }
}
