package com.tinychat.controller.context
{
    import com.tinychat.controller.commands.mappings.*;
    import com.tinychat.controller.commands.startup.*;
    import flash.display.*;
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;
    import org.robotlegs.mvcs.*;

    public class TinychatBaseContext extends SignalContext
    {

        public function TinychatBaseContext(param1:DisplayObjectContainer = null, param2:Boolean = true)
        {
            signalCommandMap = new GuardedSignalCommandMap(injector.createChild(injector.applicationDomain));
            super(param1, param2);
            return;
        }// end function

        override public function startup() : void
        {
            this.mapMappingCommands();
            this.mapStartupCommands();
            super.startup();
            return;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            injector.mapValue(IGuardedSignalCommandMap, signalCommandMap);
            return;
        }// end function

        protected function mapMappingCommands() : void
        {
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ModelMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ModeMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CoreMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, FsmMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ContextMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ValidatorMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, MenuOptionsMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, MediaMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CoreApplicationSettingsCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, GreenRoomMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SecurityPanelMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, YouTubeMappingCommand, ContextEvent, true);
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, SoundCloudMappingCommand, ContextEvent, true);
            return;
        }// end function

        protected function mapStartupCommands() : void
        {
            commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CoreStartupSequenceCommand, ContextEvent, true);
            return;
        }// end function

    }
}
