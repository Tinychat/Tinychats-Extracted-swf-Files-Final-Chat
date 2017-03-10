package com.tinychat.model.snapshot.facebook
{
    import com.tinychat.model.room.*;

    public class FacebookSnapshotTemplates extends Object
    {
        private var roomInfo:RoomSettingsProxy;

        public function FacebookSnapshotTemplates(param1:RoomSettingsProxy)
        {
            this.roomInfo = param1;
            return;
        }// end function

        public function get caption() : String
        {
            return this.roomInfo.url;
        }// end function

        public function get description1() : String
        {
            return "I just took a video chat snapshot";
        }// end function

        public function get description2() : String
        {
            return "Check out the snapshot I just took in Tinychat.";
        }// end function

    }
}
