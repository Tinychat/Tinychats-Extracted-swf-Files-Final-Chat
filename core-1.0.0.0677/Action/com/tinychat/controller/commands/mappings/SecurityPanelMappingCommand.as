package com.tinychat.controller.commands.mappings
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.proxies.*;

    public class SecurityPanelMappingCommand extends MappingCommand
    {
        public var flashvarsProxy:FlashvarsProxy;

        public function SecurityPanelMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingletonOf(SecurityPanelProxy, InternalSecurityPanel);
            return;
        }// end function

    }
}
