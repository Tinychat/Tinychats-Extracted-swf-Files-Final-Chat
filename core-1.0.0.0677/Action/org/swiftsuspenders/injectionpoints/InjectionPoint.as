package org.swiftsuspenders.injectionpoints
{
    import org.swiftsuspenders.*;

    public class InjectionPoint extends Object
    {

        public function InjectionPoint(node:XML, injector:Injector)
        {
            this.initializeInjection(node, injector);
            return;
        }// end function

        public function applyInjection(target:Object, injector:Injector) : Object
        {
            return target;
        }// end function

        protected function initializeInjection(node:XML, injector:Injector) : void
        {
            return;
        }// end function

    }
}
