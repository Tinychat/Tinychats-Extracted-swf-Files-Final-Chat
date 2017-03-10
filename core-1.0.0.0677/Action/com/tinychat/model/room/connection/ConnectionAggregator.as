package com.tinychat.model.room.connection
{
    import __AS3__.vec.*;
    import org.osflash.signals.*;

    public class ConnectionAggregator extends Object implements ImmutableConnection
    {
        private var _sources:Vector.<MutableConnection>;
        private var _connectionAttemptSuccess:Signal;
        private var _connectionAttemptFailure:Signal;
        private var _connectionLost:Signal;
        private var _connectionClosed:Signal;

        public function ConnectionAggregator(param1:Vector.<MutableConnection> = null)
        {
            if (param1)
            {
                this.sources = param1;
            }
            else
            {
                this.sources = new Vector.<MutableConnection>;
            }
            this._connectionAttemptSuccess = new Signal();
            this._connectionAttemptFailure = new Signal();
            this._connectionLost = new Signal();
            this._connectionClosed = new Signal();
            return;
        }// end function

        public function get connecting() : Boolean
        {
            return !this.connected;
        }// end function

        public function get connected() : Boolean
        {
            var _loc_1:MutableConnection = null;
            for each (_loc_1 in this._sources)
            {
                
                if (!_loc_1.connected)
                {
                    return false;
                }
            }
            return true;
        }// end function

        public function get connectionAttemptSuccess() : ISignal
        {
            return this._connectionAttemptSuccess;
        }// end function

        public function get connectionAttemptFailed() : ISignal
        {
            return this._connectionAttemptFailure;
        }// end function

        public function get connectionLost() : ISignal
        {
            return this._connectionLost;
        }// end function

        public function get connectionClosed() : ISignal
        {
            return this._connectionClosed;
        }// end function

        public function disconnect() : void
        {
            var _loc_1:MutableConnection = null;
            for each (_loc_1 in this._sources)
            {
                
                _loc_1.disconnect();
            }
            return;
        }// end function

        public function addSource(param1:MutableConnection) : void
        {
            this.addListeners(param1);
            this._sources.push(param1);
            return;
        }// end function

        private function set sources(param1:Vector.<MutableConnection>) : void
        {
            var _loc_2:MutableConnection = null;
            this._sources = param1;
            for each (_loc_2 in this._sources)
            {
                
                this.addListeners(_loc_2);
            }
            return;
        }// end function

        private function addListeners(param1:MutableConnection) : void
        {
            param1.connectionAttemptSuccess.add(this.connectionAttemptSuccessHandler);
            param1.connectionAttemptFailed.add(this.connectionAttemptFailedHandler);
            param1.connectionLost.add(this.connectionLostHandler);
            param1.connectionClosed.add(this.connectionClosedHandler);
            return;
        }// end function

        private function connectionAttemptSuccessHandler() : void
        {
            if (this.connected)
            {
                this._connectionAttemptSuccess.dispatch();
            }
            return;
        }// end function

        private function connectionAttemptFailedHandler() : void
        {
            this.disconnect();
            this._connectionAttemptFailure.dispatch();
            return;
        }// end function

        private function connectionLostHandler() : void
        {
            this.disconnect();
            this._connectionLost.dispatch();
            return;
        }// end function

        private function connectionClosedHandler() : void
        {
            this.disconnect();
            this._connectionClosed.dispatch();
            return;
        }// end function

    }
}
