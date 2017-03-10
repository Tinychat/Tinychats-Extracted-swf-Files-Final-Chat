package com.tinychat.services.snapshot
{
    import by.blooddy.crypto.image.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.user.*;
    import com.tinychat.services.*;
    import flash.display.*;
    import flash.utils.*;
    import mx.formatters.*;
    import org.osflash.signals.*;

    public class UploadSnapshotService extends AbstractUrlLoaderService
    {
        private var roomInfo:RoomSettingsProxy;
        private var usersProxy:RoomUsers;
        private var _success:Signal;

        public function UploadSnapshotService(param1:RoomSettingsProxy, param2:RoomUsers)
        {
            super("https://upload.tinychat.com/savess");
            this.roomInfo = param1;
            this.usersProxy = param2;
            this._success = new Signal(String);
            return;
        }// end function

        override public function get success() : ISignal
        {
            return this._success;
        }// end function

        public function send(param1:BitmapData) : void
        {
            var _loc_4:String = null;
            var _loc_2:* = new Date();
            var _loc_3:* = new DateFormatter();
            var _loc_5:* = JPEGEncoder.encode(param1, 70);
            _loc_3.formatString = "MM-DD-YYYY";
            _loc_4 = this.usersProxy.currentUser.name + "+" + this.roomInfo.name + "+" + _loc_3.format(_loc_2) + ".jpg";
            setUrlParameters({file:_loc_4});
            makePostRequest(_loc_5, "multipart/form-data");
            return;
        }// end function

        override protected function successHandler(param1:Object) : void
        {
            this._success.dispatch(param1);
            return;
        }// end function

    }
}
