package org.swiftsuspenders.injectionpoints
{
    import org.swiftsuspenders.*;

    public class PropertyInjectionPoint extends InjectionPoint
    {
        private var propertyName:String;
        private var propertyType:String;
        private var m_injectionConfig:InjectionConfig;

        public function PropertyInjectionPoint(node:XML, injector:Injector)
        {
            super(node, injector);
            return;
        }// end function

        override public function applyInjection(target:Object, injector:Injector) : Object
        {
            var _loc_3:* = this.m_injectionConfig.getResponse(injector);
            if (_loc_3 == null)
            {
                throw new InjectorError("Injector is missing a rule to handle injection into target " + target + ". Target dependency: " + this.propertyType);
            }
            target[this.propertyName] = _loc_3;
            return target;
        }// end function

        override protected function initializeInjection(node:XML, injector:Injector) : void
        {
            this.propertyType = node.parent().@type.toString();
            this.propertyName = node.parent().@name.toString();
            this.m_injectionConfig = injector.getMapping(Class(injector.getApplicationDomain().getDefinition(this.propertyType)), node.arg.attribute("value").toString());
            return;
        }// end function

    }
}
