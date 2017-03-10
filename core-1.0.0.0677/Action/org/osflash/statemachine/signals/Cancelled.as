package org.osflash.statemachine.signals
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;

    public class Cancelled extends Signal
    {

        public function Cancelled()
        {
            super(String, IPayload);
            return;
        }// end function

    }
}
