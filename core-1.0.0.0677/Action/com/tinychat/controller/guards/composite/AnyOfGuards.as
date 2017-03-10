package com.tinychat.controller.guards.composite
{
    import __AS3__.vec.*;
    import org.robotlegs.core.*;

    public class AnyOfGuards extends AbstractCompositeGuard
    {

        public function AnyOfGuards(... args)
        {
            super(this.Vector.<IGuard>(args));
            return;
        }// end function

        override public function approve() : Boolean
        {
            return guards.some(function (param1:IGuard, param2:int, param3:Vector.<IGuard>) : Boolean
            {
                return param1.approve();
            }// end function
            );
        }// end function

    }
}
