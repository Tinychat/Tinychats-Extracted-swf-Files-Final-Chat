package com.tinychat.controller.commands.security
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.greenroom.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.*;
    import com.tinychat.services.*;
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.mvcs.*;

    public class AntiDdosCommand extends Command
    {
        public var roomSettings:RoomSettings;
        public var greenRoomSettings:GreenRoomSettings;
        public var flashvars:FlashvarsProxy;
        public var javascript:ApplicationJavascript;
        public var greenroomConnection:GreenRoomConnectionController;
        private var roomInfoService:RoomInfoService;
        private var greenRoomInfoService:RoomInfoService;
        private var timer:Timer;

        public function AntiDdosCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            this.timer = new Timer(300000);
            this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.start();
            return;
        }// end function

        private function timerHandler(event:TimerEvent) : void
        {
            if (!this.roomInfoService)
            {
                this.roomInfoService = injector.getInstance(RoomInfoService);
            }
            if (!this.greenRoomInfoService)
            {
                this.greenRoomInfoService = injector.getInstance(RoomInfoService);
            }
            if (this.greenroomConnection.connected)
            {
                this.greenRoomInfoService.load(this.flashvars.room, this.javascript.pageDomain, this.greenRoomSettings.namespace, this.greenRoomSettings.password);
            }
            this.roomInfoService.load(this.flashvars.room, this.javascript.pageDomain, this.roomSettings.namespace, this.roomSettings.password);
            return;
        }// end function

    }
}
