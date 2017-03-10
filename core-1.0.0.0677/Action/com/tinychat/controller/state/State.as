package com.tinychat.controller.state
{

    public class State extends Object
    {
        private var value:String;
        static var lookup:Object = {};
        public static const APPLICATION:State = new State(APPLICATION, "state/application");
        public static const APPLICATION_SETTINGS:State = new State(APPLICATION_SETTINGS, "state/applicationSettings");
        public static const AUTHENTICATING_GREENROOM_BROADCAST:State = new State(AUTHENTICATING_GREENROOM_BROADCAST, "state/authenticatingGreenRoomBroadcast");
        public static const AUTHENTICATING_ROOM_BROADCAST:State = new State(AUTHENTICATING_ROOM_BROADCAST, "state/authenticatingRoomBroadcast");
        public static const AUTO_BAN_WORD_LIST:State = new State(AUTO_BAN_WORD_LIST, "state/autoBanWordList");
        public static const BAN_LIST:State = new State(BAN_LIST, "state/banlist");
        public static const BANNED:State = new State(BANNED, "state/banned");
        public static const BROADCAST_BLOCKED:State = new State(BROADCAST_BLOCKED, "state/broadcastBlocked");
        public static const BROADCAST_SETUP:State = new State(BROADCAST_SETUP, "state/broadcastSetup");
        public static const CHANGING_TOPIC:State = new State(CHANGING_TOPIC, "state/changingTopic");
        public static const CONFIRMING_USER_BAN:State = new State(CONFIRMING_USER_BAN, "state/confirmingUserBan");
        public static const CONFIRMING_USER_FOLLOW:State = new State(CONFIRMING_USER_FOLLOW, "state/confirmingUserFollow");
        public static const CONFIRMING_USER_REPORT:State = new State(CONFIRMING_USER_REPORT, "state/confirmingUserReport");
        public static const CONNECTING:State = new State(CONNECTING, "state/connecting");
        public static const CONNECTION_LOST:State = new State(CONNECTION_LOST, "state/connectionLost");
        public static const CONNECTION_ATTEMPT_FAILED:State = new State(CONNECTION_ATTEMPT_FAILED, "state/connectionAttemptFailed");
        public static const DOMAIN_BLOCKED:State = new State(DOMAIN_BLOCKED, "state/domainBlock");
        public static const FACEBOOK_AUTO_LOGGING_IN:State = new State(FACEBOOK_AUTO_LOGGING_IN, "state/facebookAutoLoggingIn");
        public static const INVITING_FACEBOOK_FRIEND:State = new State(INVITING_FACEBOOK_FRIEND, "state/invitingFacebookFriend");
        public static const INVITING_FACEBOOK_FRIENDS:State = new State(INVITING_FACEBOOK_FRIENDS, "state/invitingFacebookFriends");
        public static const INVITE_SELECTION:State = new State(INVITE_SELECTION, "state/inviteSelection");
        public static const LOADING_ROOM_INFO:State = new State(LOADING_ROOM_INFO, "state/loadingRoomInfo");
        public static const LIMITED_FEATURE:State = new State(LIMITED_FEATURE, "state/limitedFeature");
        public static const LIMITED_VIDEO_FEATURE:State = new State(LIMITED_VIDEO_FEATURE, "state/limitedVideoFeature");
        public static const LINK_BLOCKED:State = new State(LINK_BLOCKED, "state/linkBlocked");
        public static const LINK_WARNING:State = new State(LINK_WARNING, "state/linkWarning");
        public static const NO_AVAILABLE_BROADCAST_SLOT:State = new State(NO_AVAILABLE_BROADCAST_SLOT, "state/noAvailableBroadcastSlot");
        public static const NO_NEXT_ROOM:State = new State(NO_NEXT_ROOM, "state/noNextRoom");
        public static const PROMPTING_BROADCAST_PASSWORD:State = new State(PROMPTING_BROADCAST_PASSWORD, "state/promptingBroadcastPassword");
        public static const PROMPTING_LOGIN:State = new State(PROMPTING_LOGIN, "state/loginPrompt");
        public static const PROMPTING_ROOM_PASSWORD:State = new State(PROMPTING_ROOM_PASSWORD, "state/promptingRoomPassword");
        public static const REPORT_USER_FOLLOW:State = new State(REPORT_USER_FOLLOW, "state/reportUserFollow");
        public static const ROOM_CLOSED:State = new State(ROOM_CLOSED, "state/roomClosed");
        public static const SELECTING_CAMERA:State = new State(SELECTING_CAMERA, "state/selectingCamera");
        public static const SELECTING_MICROPHONE:State = new State(SELECTING_MICROPHONE, "state/selectingMicrophone");
        public static const SELECTING_SOUNDCLOUD_TRACK:State = new State(SELECTING_SOUNDCLOUD_TRACK, "state/selectingSoundCloudTrack");
        public static const SELECTING_YOUTUBE_CLIP:State = new State(SELECTING_YOUTUBE_CLIP, "state/selectingYouTubeClip");
        public static const SNAPSHOT_SHARING:State = new State(SNAPSHOT_SHARING, "state/snapshotSharing");
        public static const START:State = new State(START, "state/start");
        public static const START_GREENROOM_BROADCAST:State = new State(START_GREENROOM_BROADCAST, "state/startGreenRoomBroadcast");
        public static const TRIAL_RESIZE_VIDEO:State = new State(TRIAL_RESIZE_VIDEO, "state/trialResizeVideo");
        public static const TRIAL_POPUP:State = new State(TRIAL_POPUP, "state/trialPopup");

        public function State(param1:State, param2:String)
        {
            this.value = param2;
            lookup[param2] = this;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

        public static function from(param1:String) : State
        {
            return lookup[param1];
        }// end function

    }
}
