package com.tinychat.controller.guards
{
    import com.tinychat.model.login.*;

    public class AbstractLoginRequestGuard extends Object implements IGuard
    {
        private var expected:LoginType;
        private var actual:LoginType;

        public function AbstractLoginRequestGuard(param1:LoginType, param2:LoginType)
        {
            this.expected = param1;
            this.actual = param2;
            return;
        }// end function

        public function approve() : Boolean
        {
            if (this.expected)
            {
            }
            if (this.actual)
            {
            }
            return this.expected == this.actual;
        }// end function

    }
}
