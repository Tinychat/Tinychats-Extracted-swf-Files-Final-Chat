package com.tinychat.ui.components.social.chat.list
{
    import com.tinychat.model.social.chat.encoding.*;

    public class ChatListItemRendererFactory extends Object implements IFactory
    {
        private var _userEncoder:TextEncoder;
        private var _messageEncoder:TextEncoder;
        private var _timestampEncoder:TextEncoder;

        public function ChatListItemRendererFactory(param1:TextEncoder, param2:TextEncoder, param3:TextEncoder)
        {
            this._userEncoder = param1;
            this._messageEncoder = param2;
            this._timestampEncoder = param3;
            return;
        }// end function

        public function newInstance()
        {
            var _loc_1:* = new ChatListItemRenderer();
            _loc_1.userEncoder = this._userEncoder;
            _loc_1.messageEncoder = this._messageEncoder;
            _loc_1.timestampEncoder = this._timestampEncoder;
            return _loc_1;
        }// end function

    }
}
