package com.tinychat.model.signals
{

    public class Renamed extends AbstractReadOnlySignal
    {

        public function Renamed()
        {
            super(String, String);
            return;
        }// end function

        public function dispatch(param1:String, param2:String) : void
        {
            signal.dispatch(param1, param2);
            return;
        }// end function

    }
}
