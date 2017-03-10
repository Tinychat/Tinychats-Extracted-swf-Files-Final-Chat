package com.tinychat.controller.commands.chat.signals
{
    import com.tinychat.model.signals.*;

    public class PostGlobalNotice extends AbstractReadOnlySignal
    {

        public function PostGlobalNotice()
        {
            super(String, Boolean);
            return;
        }// end function

        public function dispatch(param1:String, param2:Boolean = false) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
