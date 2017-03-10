package com.tinychat.model.social.chat.captcha
{
    import com.tinychat.model.javascript.*;
    import org.osflash.signals.*;

    public class RoomCaptcha extends Object
    {
        public var guestId:String;
        private var _keyChanged:Signal;
        private var _roomCommand:Function;
        private var javascript:ApplicationJavascript;
        private var _token:String;
        private var _url:String;
        private var _key:String;

        public function RoomCaptcha(param1:ApplicationJavascript)
        {
            this.javascript = param1;
            param1.setRoomHash.add(this.setRoomHashHandler);
            this._keyChanged = new Signal();
            return;
        }// end function

        public function get key() : String
        {
            return this._key;
        }// end function

        public function get keyChanged() : ISignal
        {
            return this._keyChanged;
        }// end function

        public function update(param1:String, param2:String = "", param3:String = "") : void
        {
            if (this._key != param1)
            {
                if (!param1)
                {
                }
                this._key = "";
                if (!param2)
                {
                }
                this._token = "";
                if (!param3)
                {
                }
                this._url = "";
                this._keyChanged.dispatch();
            }
            return;
        }// end function

        public function prompt(param1:Function) : void
        {
            this._roomCommand = param1;
            this.javascript.openCaptchPanel(this._token);
            return;
        }// end function

        private function setRoomHashHandler() : void
        {
            this._roomCommand();
            return;
        }// end function

    }
}
