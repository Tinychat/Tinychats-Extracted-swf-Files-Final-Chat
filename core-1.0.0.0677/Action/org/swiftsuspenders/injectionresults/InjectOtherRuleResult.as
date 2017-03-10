package org.swiftsuspenders.injectionresults
{
    import org.swiftsuspenders.*;

    public class InjectOtherRuleResult extends InjectionResult
    {
        private var m_rule:InjectionConfig;

        public function InjectOtherRuleResult(rule:InjectionConfig)
        {
            this.m_rule = rule;
            return;
        }// end function

        override public function getResponse(injector:Injector) : Object
        {
            return this.m_rule.getResponse(injector);
        }// end function

    }
}
