package com.tinychat.model.room
{
    import com.tinychat.model.room.info.*;
    import com.tinychat.services.*;
    import org.osflash.signals.*;

    public class RoomServiceProxy extends Object
    {
        private var roomInfoService:RoomInfoService;
        private var loginRestrictionService:RoomRestrictionService;
        private var broadcastModeService:BroadcastModeService;

        public function RoomServiceProxy(param1:RoomInfoService, param2:RoomRestrictionService, param3:BroadcastModeService)
        {
            this.roomInfoService = param1;
            this.loginRestrictionService = param2;
            this.broadcastModeService = param3;
            return;
        }// end function

        public function get roomInfoLoaded() : ISignal
        {
            return this.roomInfoService.success;
        }// end function

        public function get roomInfoFailed() : ISignal
        {
            return this.roomInfoService.failure;
        }// end function

        public function get broadcastPasswordChanged() : ISignal
        {
            return this.broadcastModeService.success;
        }// end function

        public function loadRoomInfo(param1:String, param2:String, param3:String, param4:String = "") : void
        {
            this.roomInfoService.load(param1, param2, param3, param4);
            return;
        }// end function

        public function setRestriction(param1:String, param2:String, param3:RoomLoginRestriction) : void
        {
            this.loginRestrictionService.setRestriction(param1, param2, param3);
            return;
        }// end function

        public function setMode(param1:String, param2:String, param3:RoomBroadcastMode, param4:String) : void
        {
            this.broadcastModeService.setMode(param1, param2, param3, param4);
            return;
        }// end function

    }
}
