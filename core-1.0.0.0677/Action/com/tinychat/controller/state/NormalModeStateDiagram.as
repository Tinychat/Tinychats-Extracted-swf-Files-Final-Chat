package com.tinychat.controller.state
{
    import com.tinychat.controller.commands.broadcast.*;
    import com.tinychat.controller.commands.broadcast.authorization.*;
    import com.tinychat.controller.commands.broadcast.device.*;
    import com.tinychat.controller.commands.invite.*;
    import com.tinychat.controller.commands.login.*;
    import com.tinychat.controller.state.fsm.*;

    public class NormalModeStateDiagram extends AbstractStateDiagram
    {

        public function NormalModeStateDiagram()
        {
            return;
        }// end function

        override protected function addStates() : void
        {
            super.addStates();
            var _loc_1:* = createBaseConnectedState(State.APPLICATION);
            addTransition(_loc_1, StateAction.AUTHENTICATE_ROOM_BROADCAST, State.AUTHENTICATING_ROOM_BROADCAST);
            addTransition(_loc_1, StateAction.BROADCAST_BLOCKED, State.BROADCAST_BLOCKED);
            addTransition(_loc_1, StateAction.CHANGE_TOPIC, State.CHANGING_TOPIC);
            addTransition(_loc_1, StateAction.CONFIRM_BAN_USER, State.CONFIRMING_USER_BAN);
            addTransition(_loc_1, StateAction.CONFIRM_FOLLOW_USER, State.CONFIRMING_USER_FOLLOW);
            addTransition(_loc_1, StateAction.CONFIRM_REPORT_USER, State.CONFIRMING_USER_REPORT);
            addTransition(_loc_1, StateAction.INVITE_FACEBOOK_FRIEND, State.INVITING_FACEBOOK_FRIEND);
            addTransition(_loc_1, StateAction.INVITE_FACEBOOK_FRIENDS, State.INVITING_FACEBOOK_FRIENDS);
            addTransition(_loc_1, StateAction.LIMITED_FEATURE, State.LIMITED_FEATURE);
            addTransition(_loc_1, StateAction.LIMITED_VIDEO_FEATURE, State.LIMITED_VIDEO_FEATURE);
            addTransition(_loc_1, StateAction.LINK_BLOCKED, State.LINK_BLOCKED);
            addTransition(_loc_1, StateAction.LINK_WARNING, State.LINK_WARNING);
            addTransition(_loc_1, StateAction.NO_AVAILABLE_BROADCAST_SLOT, State.NO_AVAILABLE_BROADCAST_SLOT);
            addTransition(_loc_1, StateAction.PROMPT_LOGIN, State.PROMPTING_LOGIN);
            addTransition(_loc_1, StateAction.SELECT_CAMERA, State.SELECTING_CAMERA);
            addTransition(_loc_1, StateAction.SELECT_MICROPHONE, State.SELECTING_MICROPHONE);
            addTransition(_loc_1, StateAction.SELECT_SOUNDCLOUD_TRACK, State.SELECTING_SOUNDCLOUD_TRACK);
            addTransition(_loc_1, StateAction.SELECT_YOUTUBE_CLIP, State.SELECTING_YOUTUBE_CLIP);
            addTransition(_loc_1, StateAction.SETUP_BROADCAST, State.BROADCAST_SETUP);
            addTransition(_loc_1, StateAction.SHOW_APPLICATION_SETTINGS, State.APPLICATION_SETTINGS);
            addTransition(_loc_1, StateAction.SHOW_AUTO_BAN_WORD_LIST, State.AUTO_BAN_WORD_LIST);
            addTransition(_loc_1, StateAction.SHOW_BAN_LIST, State.BAN_LIST);
            addTransition(_loc_1, StateAction.SHOW_INVITE_SELECTION, State.INVITE_SELECTION);
            addTransition(_loc_1, StateAction.REPORT_USER_FOLLOW, State.REPORT_USER_FOLLOW);
            addTransition(_loc_1, StateAction.TAKE_SNAPSHOT, State.SNAPSHOT_SHARING);
            addTransition(_loc_1, StateAction.SHOW_TRIAL_POPUP, State.TRIAL_POPUP);
            addTransition(_loc_1, StateAction.TRIAL_RESIZE_VIDEO, State.TRIAL_RESIZE_VIDEO);
            var _loc_2:* = createBaseBroadcastAuthenticationState(State.AUTHENTICATING_ROOM_BROADCAST);
            addTransition(_loc_2, StateAction.SUCCESS, State.APPLICATION);
            addTransition(_loc_2, StateAction.FAILURE, State.APPLICATION);
            addTransition(_loc_2, StateAction.GREENROOM, State.START_GREENROOM_BROADCAST);
            _loc_2.addEnteredCommand(RoomBroadcastAuthorizationSequenceCommand);
            var _loc_3:* = createBaseBroadcastAuthenticationState(State.AUTHENTICATING_GREENROOM_BROADCAST);
            addTransition(_loc_3, StateAction.SUCCESS, State.APPLICATION);
            addTransition(_loc_3, StateAction.FAILURE, State.APPLICATION);
            _loc_3.addEnteredCommand(GreenRoomBroadcastAuthorizationSequenceCommand);
            var _loc_4:* = createBaseModalState(State.BROADCAST_BLOCKED);
            var _loc_5:* = createBaseModalState(State.BROADCAST_SETUP);
            _loc_5.addEnteredCommand(BroadcastDevicesSetupCommand);
            var _loc_6:* = createBaseConnectingState(State.CONNECTING);
            addTransition(_loc_6, StateAction.FACEBOOK_AUTO_LOGIN, State.FACEBOOK_AUTO_LOGGING_IN);
            var _loc_7:* = createBaseModalState(State.INVITE_SELECTION);
            _loc_7.addEnteredCommand(ShowInviteSelectionScreenCommand);
            var _loc_8:* = createBaseModalState(State.INVITING_FACEBOOK_FRIEND);
            var _loc_9:* = createBaseModalState(State.INVITING_FACEBOOK_FRIENDS);
            _loc_9.addEnteredCommand(ShowInviteFriendsScreenCommand);
            var _loc_10:* = createBaseDisconnectedState(State.LOADING_ROOM_INFO);
            addTransition(_loc_10, StateAction.DOMAIN_BLOCKED, State.DOMAIN_BLOCKED);
            addTransition(_loc_10, StateAction.FAILURE, State.CONNECTION_ATTEMPT_FAILED);
            addTransition(_loc_10, StateAction.PROMPT_PASSWORD, State.PROMPTING_ROOM_PASSWORD);
            addTransition(_loc_10, StateAction.ROOM_CLOSED, State.ROOM_CLOSED);
            var _loc_11:* = createBaseModalState(State.NO_AVAILABLE_BROADCAST_SLOT);
            var _loc_12:* = createBaseModalState(State.PROMPTING_LOGIN);
            _loc_12.addEnteredCommand(PromptForLoginCommand);
            var _loc_13:* = createBaseModalState(State.PROMPTING_BROADCAST_PASSWORD);
            var _loc_14:* = createBaseConnectedState(State.START_GREENROOM_BROADCAST);
            _loc_14.addEnteredCommand(StartGreenRoomBroadcastSequenceCommand);
            addTransition(_loc_14, StateAction.AUTHENTICATE_GREENROOM_BROADCAST, State.AUTHENTICATING_GREENROOM_BROADCAST);
            return;
        }// end function

    }
}
