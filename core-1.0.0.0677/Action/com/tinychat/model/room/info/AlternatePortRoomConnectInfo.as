package com.tinychat.model.room.info
{
    import com.tinychat.model.utils.url.*;

    public class AlternatePortRoomConnectInfo extends Object implements RoomConnectInfo
    {
        private var decorated:RoomConnectInfo;
        private static const portMap:Object = {08:55451, 4:55452, 93:55453};

        public function AlternatePortRoomConnectInfo(param1:RoomConnectInfo)
        {
            this.decorated = param1;
            return;
        }// end function

        public function get account() : String
        {
            return this.decorated.account;
        }// end function

        public function get autoop() : String
        {
            return this.decorated.autoop;
        }// end function

        public function get name() : String
        {
            return this.decorated.name;
        }// end function

        public function get cookie() : String
        {
            return this.decorated.cookie;
        }// end function

        public function get version() : String
        {
            return this.decorated.version;
        }// end function

        public function get namespace() : String
        {
            return this.decorated.namespace;
        }// end function

        public function get rtmp() : String
        {
            var _loc_1:* = new Url(this.decorated.rtmp, false);
            var _loc_2:* = portMap[_loc_1.port];
            if (_loc_2)
            {
                _loc_1.port = _loc_2;
            }
            return _loc_1.toString();
        }// end function

        public function get type() : RoomType
        {
            return this.decorated.type;
        }// end function

    }
}
