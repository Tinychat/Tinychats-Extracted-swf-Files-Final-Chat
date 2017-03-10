package org.swiftsuspenders.injectionresults
{
    import org.swiftsuspenders.*;

    public class InjectClassResult extends InjectionResult
    {
        private var m_responseType:Class;

        public function InjectClassResult(responseType:Class)
        {
            this.m_responseType = responseType;
            return;
        }// end function

        override public function getResponse(injector:Injector) : Object
        {
            return injector.instantiate(this.m_responseType);
        }// end function

    }
}
