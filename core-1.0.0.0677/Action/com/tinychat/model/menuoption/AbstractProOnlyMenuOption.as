package com.tinychat.model.menuoption
{
    import __AS3__.vec.*;
    import com.tinychat.controller.guards.*;

    public class AbstractProOnlyMenuOption extends AbstractMenuOption
    {
        private var isPro:IsPaidUserGuard;

        public function AbstractProOnlyMenuOption(param1:String, param2:IsPaidUserGuard, param3:Vector.<IdentityValidation> = null)
        {
            super(param1, param3);
            this.isPro = param2;
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return this.isPro.approve();
        }// end function

    }
}
