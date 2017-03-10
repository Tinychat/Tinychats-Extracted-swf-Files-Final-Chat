package com.tinychat.controller.commands.popup.signals
{
    import org.osflash.signals.*;

    public class OpenPopup extends Signal
    {

        public function OpenPopup()
        {
            super(Object, Boolean, Boolean);
            return;
        }// end function

        public function open(param1:Object, param2:Boolean = true, param3:Boolean = true) : void
        {
            dispatch(param1, param2, param3);
            return;
        }// end function

    }
}
