package com.tinychat.model.invite.facebook
{
    import com.tinychat.model.room.*;
    import com.tinychat.model.social.network.facebook.*;

    public class FacebookGeneralInviteTemplates extends Object
    {
        private var facebookLogin:FacebookLoginProxy;
        private var roomInfo:RoomSettingsProxy;
        private var userCount:RoomUserCount;
        private var _pictureUrl:String;
        private var _description1:String;
        private var _description2:String;

        public function FacebookGeneralInviteTemplates(param1:FacebookLoginProxy, param2:RoomSettingsProxy, param3:RoomUserCount)
        {
            this.facebookLogin = param1;
            this.roomInfo = param2;
            this.userCount = param3;
            return;
        }// end function

        public function get roomUrl() : String
        {
            return this.roomInfo.url + "?t=" + new Date().time.toString();
        }// end function

        public function get pictureUrl() : String
        {
            return this._pictureUrl;
        }// end function

        public function get description1() : String
        {
            return this._description1;
        }// end function

        public function get description2() : String
        {
            return this._description2;
        }// end function

        public function generate() : void
        {
            var _loc_1:* = this.facebookLogin.facebookUser ? (this.facebookLogin.facebookUser.firstName + " is") : ("I am");
            this._pictureUrl = "https://tinychat.com/public/images/tc_share_room.png";
            this._description1 = _loc_1 + " hanging out in a video chat room.";
            this._description2 = "Click to watch or join. No download or signup needed. ";
            return;
        }// end function

    }
}
