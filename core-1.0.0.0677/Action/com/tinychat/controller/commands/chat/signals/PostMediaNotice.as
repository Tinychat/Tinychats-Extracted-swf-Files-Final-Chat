package com.tinychat.controller.commands.chat.signals
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.signals.*;

    public class PostMediaNotice extends AbstractReadOnlySignal
    {

        public function PostMediaNotice()
        {
            super(String, User);
            return;
        }// end function

        public function dispatch(param1:String, param2:User) : void
        {
            return signal.dispatch(param1, param2);
        }// end function

    }
}
