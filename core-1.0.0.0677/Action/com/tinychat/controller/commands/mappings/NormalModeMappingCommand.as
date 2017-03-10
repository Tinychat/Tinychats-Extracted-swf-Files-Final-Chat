package com.tinychat.controller.commands.mappings
{
    import com.tinychat.controller.commands.login.*;
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.controller.commands.startup.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.mediators.alerts.*;

    public class NormalModeMappingCommand extends MappingCommand
    {

        public function NormalModeMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingletonOf(StateDiagram, NormalModeStateDiagram);
            injector.mapClass(ModeStartupSequenceCommand, NormalModeStartupSequenceCommand);
            signalCommandMap.mapSignalClass(LoginChangeRequest, LoginChangeRequestCommand);
            mediatorMap.mapView(NoAvailableBroadcastSlotScreen, NoAvailableBroadcastSlotScreenMediator);
            return;
        }// end function

    }
}
