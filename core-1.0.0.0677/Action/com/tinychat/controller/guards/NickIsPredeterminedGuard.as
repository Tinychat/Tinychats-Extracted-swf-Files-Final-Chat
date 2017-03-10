package com.tinychat.controller.guards
{
    import com.tinychat.model.flashvars.*;

    public class NickIsPredeterminedGuard extends Object implements IGuard
    {
        private var flashvars:FlashvarsProxy;

        public function NickIsPredeterminedGuard(param1:FlashvarsProxy)
        {
            this.flashvars = param1;
            return;
        }// end function

        public function approve() : Boolean
        {
            if (this.flashvars.nick != "")
            {
            }
            return !this.flashvars.nickChangeAllowed;
        }// end function

    }
}
