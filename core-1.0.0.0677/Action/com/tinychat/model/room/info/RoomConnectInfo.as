package com.tinychat.model.room.info
{

    public interface RoomConnectInfo
    {

        public function RoomConnectInfo();

        function get autoop() : String;

        function get name() : String;

        function get namespace() : String;

        function get rtmp() : String;

        function get type() : RoomType;

        function get account() : String;

        function get cookie() : String;

        function get version() : String;

    }
}
