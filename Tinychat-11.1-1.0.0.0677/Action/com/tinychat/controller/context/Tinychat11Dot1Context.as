package com.tinychat.controller.context
{
    import com.tinychat.controller.commands.mappings.*;
    import flash.display.*;
    import org.robotlegs.base.*;

    public class Tinychat11Dot1Context extends TinychatBaseContext
    {

        public function Tinychat11Dot1Context(param1:DisplayObjectContainer = null, param2:Boolean = true)
        {
            super(param1, param2);
            return;
        }// end function

        override protected function mapMappingCommands() : void
        {
            super.mapMappingCommands();
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SoftwareVideoMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StandardBroadcastMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, EnhancedBroadcastDeviceMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, EnhancedBroadcastDeviceApplicationSettingsCommand, ContextEvent, true);
            return;
        }// end function

    }
}
