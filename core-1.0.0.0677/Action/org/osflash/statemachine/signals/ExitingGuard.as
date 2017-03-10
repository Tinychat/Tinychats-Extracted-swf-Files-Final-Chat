package org.osflash.statemachine.signals
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;

    public class ExitingGuard extends Signal
    {

        public function ExitingGuard()
        {
            super(IPayload);
            return;
        }// end function

    }
}
