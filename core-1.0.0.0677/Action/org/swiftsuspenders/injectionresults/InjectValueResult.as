package org.swiftsuspenders.injectionresults
{
    import org.swiftsuspenders.*;

    public class InjectValueResult extends InjectionResult
    {
        private var m_value:Object;

        public function InjectValueResult(value:Object)
        {
            this.m_value = value;
            return;
        }// end function

        override public function getResponse(injector:Injector) : Object
        {
            return this.m_value;
        }// end function

    }
}
