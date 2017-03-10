package com.tinychat.model.broadcast.base
{
    import __AS3__.vec.*;
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.signals.*;
    import org.osflash.signals.*;

    public class BroadcastsAggregator extends Object implements Broadcasts
    {
        private var broadcasts:Vector.<Broadcasts>;
        private var _started:BroadcastStarted;
        private var _stopped:BroadcastStopped;

        public function BroadcastsAggregator(param1:Vector.<Broadcasts>)
        {
            this.broadcasts = param1;
            this._started = new BroadcastStarted();
            this._stopped = new BroadcastStopped();
            this.addListeners();
            return;
        }// end function

        public function get started() : ISignal
        {
            return this._started;
        }// end function

        public function get stopped() : ISignal
        {
            return this._stopped;
        }// end function

        public function get(param1:Identity) : Broadcast
        {
            var _loc_2:Broadcast = null;
            var _loc_3:Broadcasts = null;
            for each (_loc_3 in this.broadcasts)
            {
                
                if (_loc_3.has(param1))
                {
                    _loc_2 = _loc_3.get(param1);
                    break;
                }
            }
            return _loc_2;
        }// end function

        public function has(param1:Identity) : Boolean
        {
            var _loc_2:Broadcasts = null;
            for each (_loc_2 in this.broadcasts)
            {
                
                if (_loc_2.has(param1))
                {
                    return true;
                }
            }
            return false;
        }// end function

        public function get all() : Array
        {
            var _loc_2:Broadcasts = null;
            var _loc_1:Array = [];
            for each (_loc_2 in this.broadcasts)
            {
                
                _loc_1 = _loc_1.concat(_loc_2.all);
            }
            return _loc_1;
        }// end function

        private function addListeners() : void
        {
            var _loc_1:Broadcasts = null;
            for each (_loc_1 in this.broadcasts)
            {
                
                _loc_1.started.add(this.startedHandler);
                _loc_1.stopped.add(this.stoppedHandler);
            }
            return;
        }// end function

        private function startedHandler(param1:Broadcast) : void
        {
            this._started.dispatch(param1);
            return;
        }// end function

        private function stoppedHandler(param1:Broadcast) : void
        {
            this._stopped.dispatch(param1);
            return;
        }// end function

    }
}
