package com.tinychat.controller.commands.chat.signals
{
    import com.tinychat.model.signals.*;

    public class PostActionNotice extends AbstractReadOnlySignal
    {

        public function PostActionNotice()
        {
            super(String, uint);
            return;
        }// end function

        public function dispatch(param1:String, param2:uint = 0) : void
        {
            return signal.dispatch(param1, param2);
        }// end function

    }
}
