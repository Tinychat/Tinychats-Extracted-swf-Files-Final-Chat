package com.tinychat.model.greenroom
{
    import com.tinychat.model.cookie.*;
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.model.room.info.*;

    public class GreenRoomSettings extends RoomSettingsProxy
    {

        public function GreenRoomSettings(param1:FlashvarsProxy, param2:RoomServiceProxy, param3:GreenRoomConnection, param4:ApplicationJavascript, param5:FlashCookieProxy)
        {
            super(param1, param2, param3, param4, param5);
            return;
        }// end function

        override public function get account() : String
        {
            return "";
        }// end function

        override public function get autoop() : String
        {
            return "";
        }// end function

        override public function get namespace() : String
        {
            return "greenroom";
        }// end function

        override public function get password() : String
        {
            return "";
        }// end function

        override public function get type() : RoomType
        {
            return RoomType.SHOW;
        }// end function

    }
}
