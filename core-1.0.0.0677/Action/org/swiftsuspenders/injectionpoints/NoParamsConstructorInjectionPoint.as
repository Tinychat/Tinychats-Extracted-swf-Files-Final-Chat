package org.swiftsuspenders.injectionpoints
{
    import org.swiftsuspenders.*;

    public class NoParamsConstructorInjectionPoint extends InjectionPoint
    {

        public function NoParamsConstructorInjectionPoint()
        {
            super(null, null);
            return;
        }// end function

        override public function applyInjection(target:Object, injector:Injector) : Object
        {
            return new target;
        }// end function

    }
}
