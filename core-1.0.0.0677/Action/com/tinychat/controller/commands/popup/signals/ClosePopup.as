package com.tinychat.controller.commands.popup.signals
{
    import org.osflash.signals.*;

    public class ClosePopup extends Signal
    {

        public function ClosePopup()
        {
            super(Object);
            return;
        }// end function

        public function close(param1:Object) : void
        {
            dispatch(param1);
            return;
        }// end function

    }
}
