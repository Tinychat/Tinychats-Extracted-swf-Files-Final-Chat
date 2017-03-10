package com.tinychat.services.social.network.twitter
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.snapshot.*;

    public class TwitterPostSnapshotService extends Object implements PostSnapshotService
    {
        private var javascript:ApplicationJavascript;
        private var roomInfo:RoomSettingsProxy;

        public function TwitterPostSnapshotService(param1:ApplicationJavascript, param2:RoomSettingsProxy)
        {
            this.javascript = param1;
            this.roomInfo = param2;
            return;
        }// end function

        public function post(param1:Snapshot) : void
        {
            var _loc_2:String = "https://twitter.com/intent/tweet?";
            _loc_2 = _loc_2 + ("url=" + encodeURI(param1.pageUrl));
            _loc_2 = _loc_2 + ("&text=" + escape("Check out the snapshot I just took in " + this.roomInfo.url + "."));
            _loc_2 = _loc_2 + ("&original_referer=" + encodeURI(param1.pageUrl));
            this.javascript.openPopup(_loc_2);
            return;
        }// end function

    }
}
