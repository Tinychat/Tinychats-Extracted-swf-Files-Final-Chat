package org.osflash.statemachine.signals
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;

    public class Action extends Signal
    {

        public function Action()
        {
            super(String, IPayload);
            return;
        }// end function

    }
}
