package com.tinychat.model.monitor
{
    import com.tinychat.model.api.*;

    public class BroadcastVideoActivityMonitor extends AbstractActivityMonitor implements BroadcastActivityMonitor
    {
        private var _broadcast:UserBroadcast;

        public function BroadcastVideoActivityMonitor(param1:UserBroadcast)
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
            return this._broadcast.videoActivityLevel;
        }// end function

    }
}
