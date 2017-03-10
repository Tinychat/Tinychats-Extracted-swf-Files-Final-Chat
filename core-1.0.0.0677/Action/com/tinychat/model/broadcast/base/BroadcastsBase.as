package com.tinychat.model.broadcast.base
{
    import com.tinychat.model.api.*;
    import com.tinychat.model.broadcast.signals.*;
    import com.tinychat.model.lists.*;
    import org.osflash.signals.*;

    public class BroadcastsBase extends Object implements Broadcasts
    {
        private var broadcasts:IdentityMap;
        private var _started:Signal;
        private var _stopped:Signal;

        public function BroadcastsBase()
        {
            this._started = new BroadcastStarted();
            this._stopped = new BroadcastStopped();
            this.broadcasts = new IdentityMap();
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
            return Broadcast(this.broadcasts.get(param1));
        }// end function

        public function has(param1:Identity) : Boolean
        {
            return this.broadcasts.has(param1);
        }// end function

        public function get all() : Array
        {
            return this.broadcasts.list;
        }// end function

        protected function _start(param1:Broadcast) : void
        {
            this.broadcasts.add(param1);
            param1.start();
            this._started.dispatch(param1);
            return;
        }// end function

        protected function _stop(param1:Broadcast, param2:Boolean = true) : void
        {
            if (param2)
            {
                param1.close();
            }
            param1.dispose();
            this.broadcasts.remove(param1);
            this._stopped.dispatch(param1);
            return;
        }// end function

    }
}
