package org.swiftsuspenders.injectionresults
{
    import org.swiftsuspenders.*;

    public class InjectSingletonResult extends InjectionResult
    {
        private var m_responseType:Class;
        private var m_response:Object;

        public function InjectSingletonResult(responseType:Class)
        {
            this.m_responseType = responseType;
            return;
        }// end function

        override public function getResponse(injector:Injector) : Object
        {
            if (!this.m_response)
            {
            }
            var _loc_2:* = this.createResponse(injector);
            this.m_response = this.createResponse(injector);
            return _loc_2;
        }// end function

        private function createResponse(injector:Injector) : Object
        {
            return injector.instantiate(this.m_responseType);
        }// end function

    }
}
