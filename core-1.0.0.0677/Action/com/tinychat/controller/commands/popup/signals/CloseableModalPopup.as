package com.tinychat.controller.commands.popup.signals
{
    import com.tinychat.model.signals.*;

    public class CloseableModalPopup extends AbstractReadOnlySignal
    {

        public function CloseableModalPopup()
        {
            super(Boolean);
            return;
        }// end function

        public function dispatch(param1:Boolean) : void
        {
            signal.dispatch(param1);
            return;
        }// end function

    }
}
