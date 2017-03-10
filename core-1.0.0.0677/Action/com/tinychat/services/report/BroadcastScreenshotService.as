package com.tinychat.services.report
{
    import by.blooddy.crypto.image.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;
    import com.tinychat.services.*;
    import com.tinychat.ui.components.broadcast.containers.*;
    import flash.display.*;
    import flash.utils.*;

    public class BroadcastScreenshotService extends AbstractUrlLoaderService
    {
        private var roomInfo:RoomConnectInfo;
        public static const audioOnlyImage:Class = BroadcastScreenshotService_audioOnlyImage;
        private static var audioOnlyBytes:ByteArray;

        public function BroadcastScreenshotService(param1:RoomSettingsProxy)
        {
            super("https://upload.tinychat.com/img");
            this.roomInfo = param1;
            return;
        }// end function

        public function send(param1:BroadcastContainer) : void
        {
            var _loc_2:ByteArray = null;
            var _loc_5:BitmapData = null;
            var _loc_3:* = this.roomInfo.name + "-" + param1.com.tinychat.model.api:Named::name;
            var _loc_4:* = param1 as VideoBroadcastContainer;
            if (_loc_4)
            {
            }
            if (!_loc_4.audioOnly)
            {
                _loc_5 = new BitmapData(param1.width, param1.height);
                _loc_5.draw(param1);
                _loc_2 = JPEGEncoder.encode(_loc_5, 70);
            }
            else
            {
                if (!audioOnlyBytes)
                {
                    audioOnlyBytes = new audioOnlyImage();
                }
                _loc_2 = audioOnlyBytes;
            }
            setUrlParameters({filename:_loc_3});
            makePostRequest(_loc_2);
            return;
        }// end function

    }
}
