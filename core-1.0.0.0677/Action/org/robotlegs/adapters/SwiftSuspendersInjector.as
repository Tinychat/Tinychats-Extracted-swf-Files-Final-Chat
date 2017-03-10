package org.robotlegs.adapters
{
    import flash.system.*;
    import org.robotlegs.core.*;
    import org.swiftsuspenders.*;

    public class SwiftSuspendersInjector extends Injector implements IInjector
    {
        static const XML_CONFIG:XML = <types>
				<type name='org.robotlegs.mvcs::Actor'>
					<field name='eventDispatcher'/>
				</type>
				<type name='org.robotlegs.mvcs::Command'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
					<field name='injector'/>
					<field name='commandMap'/>
				</type>
				<type name='org.robotlegs.mvcs::Mediator'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
				</type>
			</types>;

        public function SwiftSuspendersInjector(xmlConfig:XML = null)
        {
            var _loc_2:XML = null;
            if (xmlConfig)
            {
                for each (_loc_2 in XML_CONFIG.children())
                {
                    
                    xmlConfig.appendChild(_loc_2);
                }
            }
            super(xmlConfig);
            return;
        }// end function

        public function createChild(applicationDomain:ApplicationDomain = null) : IInjector
        {
            var _loc_2:* = new SwiftSuspendersInjector();
            _loc_2.setApplicationDomain(applicationDomain);
            _loc_2.setParentInjector(this);
            return _loc_2;
        }// end function

        public function get applicationDomain() : ApplicationDomain
        {
            return getApplicationDomain();
        }// end function

        public function set applicationDomain(value:ApplicationDomain) : void
        {
            setApplicationDomain(value);
            return;
        }// end function

    }
}
