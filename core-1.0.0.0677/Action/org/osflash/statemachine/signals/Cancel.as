package org.osflash.statemachine.signals
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;

    public class Cancel extends Signal
    {

        public function Cancel()
        {
            super(String, IPayload);
            return;
        }// end function

    }
}
