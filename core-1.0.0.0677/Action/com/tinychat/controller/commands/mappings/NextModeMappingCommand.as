package com.tinychat.controller.commands.mappings
{
    import com.tinychat.controller.commands.broadcast.next.*;
    import com.tinychat.controller.commands.broadcast.signals.*;
    import com.tinychat.controller.commands.login.signals.*;
    import com.tinychat.controller.commands.startup.*;
    import com.tinychat.controller.state.*;
    import com.tinychat.ui.components.alerts.*;
    import com.tinychat.ui.components.broadcast.screens.*;
    import com.tinychat.ui.components.controlbar.buttons.*;
    import com.tinychat.ui.components.spark.*;
    import com.tinychat.ui.mediators.alerts.*;
    import com.tinychat.ui.mediators.broadcast.screens.*;
    import com.tinychat.ui.mediators.controlbar.buttons.*;

    public class NextModeMappingCommand extends MappingCommand
    {

        public function NextModeMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            injector.mapSingletonOf(StateDiagram, NextModeStateDiagram);
            injector.mapClass(ModeStartupSequenceCommand, NextModeStartupSequenceCommand);
            injector.mapSingleton(LoginChangeRequest);
            signalCommandMap.mapSignalClass(ConnectToNextRoom, ConnectToNextRoomSequenceCommand);
            mediatorMap.mapView(NextButton, NextButtonMediator);
            mediatorMap.mapView(NoNextRoomScreen, NoNextRoomScreenMediator, TitleWindowElementBase);
            mediatorMap.mapView(NoAvailableBroadcastSlotScreen, NoNextRoomScreenMediator, TitleWindowElementBase);
            mediatorMap.mapView(Push2TalkOnlyNotificationScreen, Push2TalkOnlyNotificationScreenMediator);
            return;
        }// end function

    }
}
