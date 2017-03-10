package com.tinychat.model.social.chat.captcha
{
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.calls.*;
    import org.osflash.signals.*;

    public class ChatCaptcha extends Object
    {
        public var guestId:String;
        private var _key:String;
        private var _keyChanged:Signal;
        private var javascript:ApplicationJavascript;
        private var connection:RoomConnection;
        private var roomInfo:RoomSettings;

        public function ChatCaptcha(param1:ApplicationJavascript, param2:RoomConnection, param3:RoomSettings)
        {
            this.javascript = param1;
            this.connection = param2;
            this.roomInfo = param3;
            param1.setChatHash.add(this.setChatHashHandler);
            this._keyChanged = new Signal();
            return;
        }// end function

        public function get key() : String
        {
            return this._key;
        }// end function

        public function set key(param1:String) : void
        {
            if (this._key != param1)
            {
                this._key = param1;
                if (this._key)
                {
                    this.connection.call(new RoomCallCauth(this._key));
                }
                this._keyChanged.dispatch();
            }
            return;
        }// end function

        public function get keyChanged() : ISignal
        {
            return this._keyChanged;
        }// end function

        public function prompt() : void
        {
            this.javascript.showCaptcha(this.roomInfo.name, this.roomInfo.namespace, this.guestId);
            return;
        }// end function

        private function setChatHashHandler(param1:String) : void
        {
            this.key = param1;
            return;
        }// end function

    }
}
