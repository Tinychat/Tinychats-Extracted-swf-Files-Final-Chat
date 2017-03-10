package com.tinychat.model.monitor
{
    import com.tinychat.model.api.*;
    import flash.events.*;

    public class StreamBroadcastAudioActivityMonitor extends AbstractActivityMonitor implements BroadcastActivityMonitor
    {
        private var _broadcast:UserBroadcast;
        private var totalActivityLevel:Number;

        public function StreamBroadcastAudioActivityMonitor(param1:UserBroadcast)
        {
            this.broadcast = param1;
            return;
        }// end function

        public function set broadcast(param1:UserBroadcast) : void
        {
            this._broadcast = param1;
            return;
        }// end function

        override public function get activityLevel() : Number
        {
            var _loc_1:* = (this._broadcast.audioActivityLevel - this.totalActivityLevel) / (10 * interval);
            return Math.max(0, Math.min(_loc_1, 1));
        }// end function

        override public function startActivityPolling(param1:uint, param2:Function = null) : void
        {
            this.totalActivityLevel = 0;
            super.startActivityPolling(param1, param2);
            return;
        }// end function

        override protected function pollerHandler(event:TimerEvent) : void
        {
            super.pollerHandler(event);
            this.totalActivityLevel = this._broadcast.audioActivityLevel;
            return;
        }// end function

    }
}
