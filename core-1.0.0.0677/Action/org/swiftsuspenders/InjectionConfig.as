package org.swiftsuspenders
{
    import org.swiftsuspenders.injectionresults.*;

    public class InjectionConfig extends Object
    {
        public var request:Class;
        public var injectionName:String;
        private var m_injector:Injector;
        private var m_result:InjectionResult;

        public function InjectionConfig(request:Class, injectionName:String)
        {
            this.request = request;
            this.injectionName = injectionName;
            return;
        }// end function

        public function getResponse(injector:Injector) : Object
        {
            if (this.m_result)
            {
                if (!this.m_injector)
                {
                }
                return this.m_result.getResponse(injector);
            }
            if (!this.m_injector)
            {
            }
            var _loc_2:* = injector.getAncestorMapping(this.request, this.injectionName);
            if (_loc_2)
            {
                return _loc_2.getResponse(injector);
            }
            return null;
        }// end function

        public function hasResponse(injector:Injector) : Boolean
        {
            if (this.m_result)
            {
                return true;
            }
            if (!this.m_injector)
            {
            }
            var _loc_2:* = injector.getAncestorMapping(this.request, this.injectionName);
            return _loc_2 != null;
        }// end function

        public function hasOwnResponse() : Boolean
        {
            return this.m_result != null;
        }// end function

        public function setResult(result:InjectionResult) : void
        {
            this.m_result = result;
            return;
        }// end function

        public function setInjector(injector:Injector) : void
        {
            this.m_injector = injector;
            return;
        }// end function

    }
}
