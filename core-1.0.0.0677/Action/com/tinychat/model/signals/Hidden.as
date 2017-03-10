package com.tinychat.model.signals
{

    public class Hidden extends AbstractReadOnlySignal
    {

        public function Hidden()
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
