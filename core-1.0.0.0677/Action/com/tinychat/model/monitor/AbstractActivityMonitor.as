package com.tinychat.model.monitor
{
    import flash.errors.*;
    import flash.events.*;
    import flash.utils.*;

    public class AbstractActivityMonitor extends Object implements ActivityMonitor
    {
        private var poller:Timer;
        private var callback:Function;

        public function AbstractActivityMonitor()
        {
            return;
        }// end function

        public function get activityLevel() : Number
        {
            throw new IllegalOperationError("Must be overriden in sub-class.");
        }// end function

        public function get polling() : Boolean
        {
            if (this.poller)
            {
            }
            return this.poller.running;
        }// end function

        public function get timePolling() : uint
        {
            if (this.poller)
            {
                return this.poller.delay * this.poller.currentCount;
            }
            return 0;
        }// end function

        public function startActivityPolling(param1:uint, param2:Function = null) : void
        {
            this.stopActivityPolling();
            this.callback = param2;
            this.poller = new Timer(param1);
            this.poller.addEventListener(TimerEvent.TIMER, this.pollerHandler);
            this.poller.start();
            return;
        }// end function

        public function stopActivityPolling() : void
        {
            if (this.poller)
            {
                this.poller.stop();
                this.poller.reset();
                this.poller.removeEventListener(TimerEvent.TIMER, this.pollerHandler);
                this.callback = null;
            }
            return;
        }// end function

        protected function get interval() : uint
        {
            return this.poller.delay;
        }// end function

        protected function pollerHandler(event:TimerEvent) : void
        {
            if (this.callback != null)
            {
                this.callback.call(null, this.activityLevel);
            }
            else
            {
                this.stopActivityPolling();
            }
            return;
        }// end function

    }
}
