package com.tinychat.controller.state
{
    import com.tinychat.controller.commands.broadcast.device.*;
    import com.tinychat.controller.commands.settings.*;
    import com.tinychat.controller.commands.snapshot.*;
    import com.tinychat.controller.commands.social.network.facebook.*;
    import com.tinychat.controller.state.fsm.*;

    public class AbstractStateDiagram extends Object implements StateDiagram
    {
        private var states:Array;

        public function AbstractStateDiagram()
        {
            return;
        }// end function

        public function get toXML() : XML
        {
            return this.createFsm().toXML();
        }// end function

        protected function createFsm() : Fsm
        {
            this.states = [];
            var _loc_1:* = new Fsm(State.START);
            this.addStates();
            _loc_1.addStates.apply(null, this.states);
            return _loc_1;
        }// end function

        protected function addStates() : void
        {
            var _loc_1:* = this.createBaseDisconnectedState(State.START);
            var _loc_2:* = this.createBaseModalState(State.APPLICATION_SETTINGS);
            var _loc_3:* = this.createBaseModalState(State.AUTO_BAN_WORD_LIST);
            var _loc_4:* = this.createBaseModalState(State.BAN_LIST);
            var _loc_5:* = this.createState(State.BANNED);
            var _loc_6:* = this.createBaseModalState(State.CHANGING_TOPIC);
            _loc_6.addEnteredCommand(ShowTopicSelectionCommand);
            var _loc_7:* = this.createBaseModalState(State.CONFIRMING_USER_BAN);
            var _loc_8:* = this.createBaseModalState(State.CONFIRMING_USER_FOLLOW);
            var _loc_9:* = this.createBaseModalState(State.CONFIRMING_USER_REPORT);
            var _loc_10:* = this.createBaseModalState(State.REPORT_USER_FOLLOW);
            var _loc_11:* = this.createBaseDisconnectedState(State.CONNECTION_ATTEMPT_FAILED);
            var _loc_12:* = this.createBaseDisconnectedState(State.CONNECTION_LOST);
            var _loc_13:* = this.createBaseModalState(State.DOMAIN_BLOCKED);
            var _loc_14:* = this.createBaseModalState(State.FACEBOOK_AUTO_LOGGING_IN);
            _loc_14.addEnteredCommand(DisplayFacebookAutoLoginCommand);
            var _loc_15:* = this.createBaseModalState(State.LIMITED_FEATURE);
            var _loc_16:* = this.createBaseModalState(State.LIMITED_VIDEO_FEATURE);
            var _loc_17:* = this.createBaseModalState(State.LINK_BLOCKED);
            var _loc_18:* = this.createBaseModalState(State.LINK_WARNING);
            var _loc_19:* = this.createBaseState(State.PROMPTING_ROOM_PASSWORD);
            this.addTransition(_loc_19, StateAction.COMPLETE, State.CONNECTING);
            var _loc_20:* = this.createState(State.ROOM_CLOSED);
            var _loc_21:* = this.createBaseModalState(State.SELECTING_CAMERA);
            _loc_21.addEnteredCommand(SelectCameraCommand);
            var _loc_22:* = this.createBaseModalState(State.SELECTING_MICROPHONE);
            _loc_22.addEnteredCommand(SelectMicrophoneCommand);
            var _loc_23:* = this.createBaseModalState(State.SELECTING_SOUNDCLOUD_TRACK);
            var _loc_24:* = this.createBaseModalState(State.SELECTING_YOUTUBE_CLIP);
            var _loc_25:* = this.createBaseModalState(State.SNAPSHOT_SHARING);
            _loc_25.addEnteredCommand(TakeSnapshotCommand);
            var _loc_26:* = this.createBaseModalState(State.TRIAL_POPUP);
            var _loc_27:* = this.createBaseModalState(State.TRIAL_RESIZE_VIDEO);
            return;
        }// end function

        protected function createState(param1:State) : FsmState
        {
            var _loc_2:* = new FsmState(param1);
            this.states.push(_loc_2);
            return _loc_2;
        }// end function

        protected function createBaseState(param1:State) : FsmState
        {
            var _loc_2:* = this.createState(param1);
            this.addTransition(_loc_2, StateAction.BANNED, State.BANNED);
            this.addTransition(_loc_2, StateAction.LOAD_ROOM_INFO, State.LOADING_ROOM_INFO);
            return _loc_2;
        }// end function

        protected function createBaseConnectingState(param1:State) : FsmState
        {
            var _loc_2:* = this.createBaseState(param1);
            this.addTransition(_loc_2, StateAction.CONNECTION_ATTEMPT_SUCCESS, State.APPLICATION);
            this.addTransition(_loc_2, StateAction.CONNECTION_ATTEMPT_FAILED, State.CONNECTION_ATTEMPT_FAILED);
            return _loc_2;
        }// end function

        protected function createBaseDisconnectedState(param1:State) : FsmState
        {
            var _loc_2:* = this.createBaseState(param1);
            this.addTransition(_loc_2, StateAction.CONNECTION_ATTEMPT, State.CONNECTING);
            return _loc_2;
        }// end function

        protected function createBaseConnectedState(param1:State) : FsmState
        {
            var _loc_2:* = this.createBaseState(param1);
            this.addTransition(_loc_2, StateAction.CONNECTION_LOST, State.CONNECTION_LOST);
            this.addTransition(_loc_2, StateAction.CONNECTION_ATTEMPT_FAILED, State.CONNECTION_ATTEMPT_FAILED);
            return _loc_2;
        }// end function

        protected function createBaseModalState(param1:State) : FsmState
        {
            var _loc_2:* = this.createBaseConnectedState(param1);
            this.addTransition(_loc_2, StateAction.COMPLETE, State.APPLICATION);
            this.addTransition(_loc_2, StateAction.CANCEL, State.APPLICATION);
            return _loc_2;
        }// end function

        protected function createBaseBroadcastAuthenticationState(param1:State) : FsmState
        {
            var _loc_2:* = this.createBaseConnectedState(param1);
            this.addTransition(_loc_2, StateAction.PROMPT_PASSWORD, State.PROMPTING_BROADCAST_PASSWORD);
            this.addTransition(_loc_2, StateAction.BROADCAST_BLOCKED, State.BROADCAST_BLOCKED);
            return _loc_2;
        }// end function

        protected function addTransition(param1:FsmState, param2:StateAction, param3:State) : void
        {
            param1.addTransition(this.createTransition(param2, param3));
            return;
        }// end function

        protected function createTransition(param1:StateAction, param2:State) : FsmTransition
        {
            return new FsmTransition(param1, param2);
        }// end function

    }
}
