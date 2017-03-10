package com.tinychat.controller.state
{

    public class StateAction extends Object
    {
        private var value:String;
        public static const AUTHENTICATE_GREENROOM_BROADCAST:StateAction = new StateAction(AUTHENTICATE_GREENROOM_BROADCAST, "action/authenticateGreenRoomBroadcast");
        public static const AUTHENTICATE_ROOM_BROADCAST:StateAction = new StateAction(AUTHENTICATE_ROOM_BROADCAST, "action/authenticateRoomBroadcast");
        public static const BANNED:StateAction = new StateAction(BANNED, "action/banned");
        public static const BROADCAST_BLOCKED:StateAction = new StateAction(BROADCAST_BLOCKED, "action/broadcastBlocked");
        public static const CANCEL:StateAction = new StateAction(CANCEL, "action/cancel");
        public static const CHANGE_TOPIC:StateAction = new StateAction(CHANGE_TOPIC, "action/changeTopic");
        public static const COMPLETE:StateAction = new StateAction(COMPLETE, "action/complete");
        public static const CONFIRM_BAN_USER:StateAction = new StateAction(CONFIRM_BAN_USER, "action/confirmBanUser");
        public static const CONFIRM_FOLLOW_USER:StateAction = new StateAction(CONFIRM_FOLLOW_USER, "action/confirmFollowUser");
        public static const CONFIRM_REPORT_USER:StateAction = new StateAction(CONFIRM_REPORT_USER, "action/confirmReportUser");
        public static const CONNECTION_ATTEMPT:StateAction = new StateAction(CONNECTION_ATTEMPT, "action/connectionAttempt");
        public static const CONNECTION_ATTEMPT_SUCCESS:StateAction = new StateAction(CONNECTION_ATTEMPT_SUCCESS, "action/connectionAttemptSuccess");
        public static const CONNECTION_ATTEMPT_FAILED:StateAction = new StateAction(CONNECTION_ATTEMPT_FAILED, "action/connectionAttemptFailed");
        public static const CONNECTION_LOST:StateAction = new StateAction(CONNECTION_LOST, "action/connectionLost");
        public static const DOMAIN_BLOCKED:StateAction = new StateAction(DOMAIN_BLOCKED, "action/domainBlocked");
        public static const FACEBOOK_AUTO_LOGIN:StateAction = new StateAction(FACEBOOK_AUTO_LOGIN, "action/facebookAutoLoggingIn");
        public static const FAILURE:StateAction = new StateAction(FAILURE, "action/failure");
        public static const GREENROOM:StateAction = new StateAction(GREENROOM, "action/greenroom");
        public static const INVITE_FACEBOOK_FRIEND:StateAction = new StateAction(INVITE_FACEBOOK_FRIEND, "action/inviteFacebookFriend");
        public static const INVITE_FACEBOOK_FRIENDS:StateAction = new StateAction(INVITE_FACEBOOK_FRIENDS, "action/inviteFacebookFriends");
        public static const LIMITED_FEATURE:StateAction = new StateAction(LIMITED_FEATURE, "action/limitedFeature");
        public static const LIMITED_VIDEO_FEATURE:StateAction = new StateAction(LIMITED_VIDEO_FEATURE, "action/limitedVideoFeature");
        public static const LINK_BLOCKED:StateAction = new StateAction(LINK_BLOCKED, "action/linkBlocked");
        public static const LINK_WARNING:StateAction = new StateAction(LINK_WARNING, "action/linkWarning");
        public static const LOAD_ROOM_INFO:StateAction = new StateAction(LOAD_ROOM_INFO, "action/loadRoomInfo");
        public static const LOGIN_SUCCESS:StateAction = new StateAction(LOGIN_SUCCESS, "action/loginSuccess");
        public static const NO_NEXT_ROOM:StateAction = new StateAction(NO_NEXT_ROOM, "action/noNextRoom");
        public static const NO_AVAILABLE_BROADCAST_SLOT:StateAction = new StateAction(NO_AVAILABLE_BROADCAST_SLOT, "action/noAvailableBroadcastSlot");
        public static const PROMPT_LOGIN:StateAction = new StateAction(PROMPT_LOGIN, "action/promptLogin");
        public static const PROMPT_PASSWORD:StateAction = new StateAction(PROMPT_PASSWORD, "action/promptPassword");
        public static const REPORT_USER_FOLLOW:StateAction = new StateAction(REPORT_USER_FOLLOW, "action/reportUserFollow");
        public static const ROOM_CLOSED:StateAction = new StateAction(ROOM_CLOSED, "action/roomClosed");
        public static const SELECT_CAMERA:StateAction = new StateAction(SELECT_CAMERA, "action/selectCamera");
        public static const SELECT_MICROPHONE:StateAction = new StateAction(SELECT_MICROPHONE, "action/selectMicrophone");
        public static const SELECT_YOUTUBE_CLIP:StateAction = new StateAction(SELECT_YOUTUBE_CLIP, "action/selectingYouTubeClip");
        public static const SELECT_SOUNDCLOUD_TRACK:StateAction = new StateAction(SELECT_SOUNDCLOUD_TRACK, "action/selectingSoundCloudTrack");
        public static const SETUP_BROADCAST:StateAction = new StateAction(SETUP_BROADCAST, "action/setupBroadcast");
        public static const SHOW_APPLICATION_SETTINGS:StateAction = new StateAction(SHOW_APPLICATION_SETTINGS, "action/showApplicationSettings");
        public static const SHOW_AUTO_BAN_WORD_LIST:StateAction = new StateAction(SHOW_AUTO_BAN_WORD_LIST, "action/showAutoBanWordList");
        public static const SHOW_BAN_LIST:StateAction = new StateAction(SHOW_BAN_LIST, "action/showBanList");
        public static const SHOW_INVITE_SELECTION:StateAction = new StateAction(SHOW_INVITE_SELECTION, "action/showInviteSelection");
        public static const SHOW_TRIAL_POPUP:StateAction = new StateAction(SHOW_TRIAL_POPUP, "action/showTrialPopup");
        public static const SUCCESS:StateAction = new StateAction(SUCCESS, "action/success");
        public static const TAKE_SNAPSHOT:StateAction = new StateAction(TAKE_SNAPSHOT, "action/takeSnapshot");
        public static const TRIAL_RESIZE_VIDEO:StateAction = new StateAction(TRIAL_RESIZE_VIDEO, "action/trialResizeVideo");

        public function StateAction(param1:StateAction, param2:String)
        {
            this.value = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

    }
}
