package com.tinychat.controller.commands.chat.signals
{
    import com.tinychat.model.signals.*;

    public class PostChatMessage extends AbstractReadOnlySignal
    {

        public function PostChatMessage()
        {
            super(String, Boolean);
            return;
        }// end function

        public function dispatch(param1:String) : void
        {
            signal.dispatch(param1, true);
            return;
        }// end function

    }
}
