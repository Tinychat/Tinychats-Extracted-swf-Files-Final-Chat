package com.tinychat.controller.state
{
    import com.tinychat.controller.commands.broadcast.authorization.*;
    import com.tinychat.controller.commands.broadcast.next.*;
    import com.tinychat.controller.commands.login.*;
    import com.tinychat.controller.commands.room.connection.*;
    import com.tinychat.controller.state.fsm.*;

    public class NextModeStateDiagram extends AbstractStateDiagram
    {

        public function NextModeStateDiagram()
        {
            return;
        }// end function

        override protected function addStates() : void
        {
            super.addStates();
            var _loc_1:* = createBaseConnectedState(State.APPLICATION);
            addTransition(_loc_1, StateAction.AUTHENTICATE_ROOM_BROADCAST, State.AUTHENTICATING_ROOM_BROADCAST);
            addTransition(_loc_1, StateAction.BROADCAST_BLOCKED, State.BROADCAST_BLOCKED);
            addTransition(_loc_1, StateAction.CONFIRM_BAN_USER, State.CONFIRMING_USER_BAN);
            addTransition(_loc_1, StateAction.CONFIRM_FOLLOW_USER, State.CONFIRMING_USER_FOLLOW);
            addTransition(_loc_1, StateAction.CONFIRM_REPORT_USER, State.CONFIRMING_USER_REPORT);
            addTransition(_loc_1, StateAction.LIMITED_FEATURE, State.LIMITED_FEATURE);
            addTransition(_loc_1, StateAction.LIMITED_VIDEO_FEATURE, State.LIMITED_VIDEO_FEATURE);
            addTransition(_loc_1, StateAction.LINK_BLOCKED, State.LINK_BLOCKED);
            addTransition(_loc_1, StateAction.LINK_WARNING, State.LINK_WARNING);
            addTransition(_loc_1, StateAction.NO_AVAILABLE_BROADCAST_SLOT, State.NO_AVAILABLE_BROADCAST_SLOT);
            addTransition(_loc_1, StateAction.NO_NEXT_ROOM, State.NO_NEXT_ROOM);
            addTransition(_loc_1, StateAction.PROMPT_LOGIN, State.PROMPTING_LOGIN);
            addTransition(_loc_1, StateAction.SELECT_CAMERA, State.SELECTING_CAMERA);
            addTransition(_loc_1, StateAction.SELECT_MICROPHONE, State.SELECTING_MICROPHONE);
            addTransition(_loc_1, StateAction.SELECT_SOUNDCLOUD_TRACK, State.SELECTING_SOUNDCLOUD_TRACK);
            addTransition(_loc_1, StateAction.SELECT_YOUTUBE_CLIP, State.SELECTING_YOUTUBE_CLIP);
            addTransition(_loc_1, StateAction.SETUP_BROADCAST, State.BROADCAST_SETUP);
            addTransition(_loc_1, StateAction.REPORT_USER_FOLLOW, State.REPORT_USER_FOLLOW);
            addTransition(_loc_1, StateAction.SHOW_APPLICATION_SETTINGS, State.APPLICATION_SETTINGS);
            addTransition(_loc_1, StateAction.SHOW_BAN_LIST, State.BAN_LIST);
            addTransition(_loc_1, StateAction.TAKE_SNAPSHOT, State.SNAPSHOT_SHARING);
            addTransition(_loc_1, StateAction.SHOW_TRIAL_POPUP, State.TRIAL_POPUP);
            var _loc_2:* = createBaseBroadcastAuthenticationState(State.AUTHENTICATING_ROOM_BROADCAST);
            addTransition(_loc_2, StateAction.SUCCESS, State.APPLICATION);
            _loc_2.addEnteredCommand(RoomBroadcastAuthorizationSequenceCommand);
            var _loc_3:* = createBaseDisconnectedState(State.BROADCAST_SETUP);
            _loc_3.addEnteredCommand(NextModeStartBroadcastSequenceCommand);
            var _loc_4:* = createState(State.BROADCAST_BLOCKED);
            _loc_4.addEnteredCommand(DisconnectFromRoomCommand);
            var _loc_5:* = createBaseConnectingState(State.CONNECTING);
            addTransition(_loc_5, StateAction.DOMAIN_BLOCKED, State.DOMAIN_BLOCKED);
            addTransition(_loc_5, StateAction.ROOM_CLOSED, State.ROOM_CLOSED);
            var _loc_6:* = createBaseState(State.LOADING_ROOM_INFO);
            addTransition(_loc_6, StateAction.SUCCESS, State.PROMPTING_LOGIN);
            addTransition(_loc_6, StateAction.FAILURE, State.CONNECTION_ATTEMPT_FAILED);
            var _loc_7:* = createBaseDisconnectedState(State.NO_AVAILABLE_BROADCAST_SLOT);
            _loc_7.addEnteredCommand(DisconnectFromRoomCommand);
            var _loc_8:* = createBaseModalState(State.NO_NEXT_ROOM);
            var _loc_9:* = createBaseConnectedState(State.PROMPTING_LOGIN);
            _loc_9.addEnteredCommand(PromptForLoginCommand);
            addTransition(_loc_9, StateAction.COMPLETE, State.BROADCAST_SETUP);
            var _loc_10:* = createBaseState(State.PROMPTING_BROADCAST_PASSWORD);
            addTransition(_loc_10, StateAction.COMPLETE, State.APPLICATION);
            return;
        }// end function

    }
}
