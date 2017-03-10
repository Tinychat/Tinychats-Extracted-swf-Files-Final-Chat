package com.tinychat.controller.commands.chat.signals
{
    import com.tinychat.model.signals.*;

    public class OpenLink extends AbstractReadOnlySignal
    {

        public function OpenLink()
        {
            super(String);
            return;
        }// end function

        public function dispatch(param1:String) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
