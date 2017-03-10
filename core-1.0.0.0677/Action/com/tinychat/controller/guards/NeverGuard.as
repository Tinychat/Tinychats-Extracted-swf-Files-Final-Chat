package com.tinychat.controller.guards
{

    public class NeverGuard extends Object implements IGuard
    {

        public function NeverGuard()
        {
            return;
        }// end function

        public function approve() : Boolean
        {
            return false;
        }// end function

    }
}
