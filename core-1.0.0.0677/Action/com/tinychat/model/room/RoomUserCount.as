package com.tinychat.model.room
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.javascript.*;
    import com.tinychat.model.room.connection.*;
    import com.tinychat.model.room.connection.callbacks.arguments.*;
    import com.tinychat.model.user.*;
    import flash.events.*;
    import flash.utils.*;
    import org.osflash.signals.*;

    public class RoomUserCount extends Object
    {
        private var usersProxy:RoomUsers;
        private var roomConnectionProxy:RoomConnection;
        private var javascript:ApplicationJavascript;
        private var _count:uint;
        private var _changed:Signal;
        private var updateThrottlingTimer:Timer;
        private static const UPDATE_THROTTLING_TIMEOUT:Number = 1000;

        public function RoomUserCount(param1:RoomUsers, param2:RoomConnection, param3:ApplicationJavascript)
        {
            this._changed = new Signal(uint);
            this.usersProxy = param1;
            this.roomConnectionProxy = param2;
            this.javascript = param3;
            this.updateThrottlingTimer = new Timer(UPDATE_THROTTLING_TIMEOUT, 1);
            this.updateThrottlingTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.updateThrottlingTimerComplete);
            this._count = 0;
            param2.viewcount.add(this.viewcountHandler);
            param1.added.add(this.userAddedHandler);
            param1.removed.add(this.userRemovedHandler);
            return;
        }// end function

        public function get changed() : ISignal
        {
            return this._changed;
        }// end function

        public function get count() : uint
        {
            if (this._count == 0)
            {
                return this.usersProxy.all.length;
            }
            return this._count;
        }// end function

        private function viewcountHandler(param1:RoomCallbackViewCountArguments) : void
        {
            this._count = param1.count;
            this.userCountChanged();
            return;
        }// end function

        private function userAddedHandler(param1:User) : void
        {
            this.userCountChanged();
            return;
        }// end function

        private function userRemovedHandler(param1:User) : void
        {
            this.userCountChanged();
            return;
        }// end function

        private function userCountChanged() : void
        {
            if (!this.updateThrottlingTimer.running)
            {
                this.updateThrottlingTimer.reset();
                this.updateThrottlingTimer.start();
            }
            return;
        }// end function

        private function updateThrottlingTimerComplete(event:TimerEvent) : void
        {
            this.javascript.liveViewers(this.count);
            this._changed.dispatch(this.count);
            return;
        }// end function

    }
}
