package com.tinychat.model.room
{
    import com.tinychat.model.room.info.*;
    import org.osflash.signals.*;

    public interface RoomSettings
    {

        public function RoomSettings();

        function get name() : String;

        function get namespace() : String;

        function get password() : String;

        function get promoted() : Boolean;

        function get pro() : uint;

        function get roomInfoChanged() : ISignal;

        function get type() : RoomType;

        function get url() : String;

    }
}
