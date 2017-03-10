package org.osflash.statemachine.signals
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;

    public class EnteringGuard extends Signal
    {

        public function EnteringGuard()
        {
            super(IPayload);
            return;
        }// end function

    }
}
