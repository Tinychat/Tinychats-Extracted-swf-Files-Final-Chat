package com.tinychat.controller.commands.mappings
{
    import com.tinychat.controller.commands.broadcast.*;
    import com.tinychat.controller.commands.broadcast.authorization.*;
    import com.tinychat.controller.commands.broadcast.device.*;
    import com.tinychat.controller.commands.broadcast.next.*;
    import com.tinychat.controller.commands.invite.*;
    import com.tinychat.controller.commands.login.*;
    import com.tinychat.controller.commands.room.connection.*;
    import com.tinychat.controller.commands.settings.*;
    import com.tinychat.controller.commands.snapshot.*;
    import com.tinychat.controller.commands.social.network.facebook.*;
    import com.tinychat.controller.commands.state.*;
    import com.tinychat.controller.commands.state.signals.*;
    import com.tinychat.controller.state.*;
    import org.osflash.statemachine.*;

    public class FsmMappingCommand extends MappingCommand
    {

        public function FsmMappingCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = new SignalFSMInjector(injector, signalCommandMap);
            var _loc_2:* = injector.getInstance(StateDiagram);
            _loc_1.initiate(_loc_2.toXML);
            _loc_1.addClass(BroadcastDevicesSetupCommand);
            _loc_1.addClass(NextModeStartBroadcastSequenceCommand);
            _loc_1.addClass(DisplayFacebookAutoLoginCommand);
            _loc_1.addClass(PromptForLoginCommand);
            _loc_1.addClass(SelectCameraCommand);
            _loc_1.addClass(SelectMicrophoneCommand);
            _loc_1.addClass(ShowInviteSelectionScreenCommand);
            _loc_1.addClass(ShowInviteFriendsScreenCommand);
            _loc_1.addClass(ShowTopicSelectionCommand);
            _loc_1.addClass(TakeSnapshotCommand);
            _loc_1.addClass(RoomBroadcastAuthorizationSequenceCommand);
            _loc_1.addClass(GreenRoomBroadcastAuthorizationSequenceCommand);
            _loc_1.addClass(StartGreenRoomBroadcastSequenceCommand);
            _loc_1.addClass(DisconnectFromRoomCommand);
            signalCommandMap.mapSignalClass(TriggerStateAction, TriggerStateActionCommand);
            _loc_1.inject();
            _loc_1.destroy();
            return;
        }// end function

    }
}
