package com.tinychat.model.guards
{
    import __AS3__.vec.*;
    import flash.errors.*;

    public class AbstractLiveGuard extends Object implements LiveGuard
    {
        private var lastValue:Boolean;
        private var listeners:Vector.<Function>;

        public function AbstractLiveGuard()
        {
            this.listeners = new Vector.<Function>;
            this.lastValue = this.approve();
            return;
        }// end function

        public function approve() : Boolean
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function addChangeListener(param1:Function) : void
        {
            if (this.listeners.indexOf(param1) == -1)
            {
                this.listeners.push(param1);
                if (this.listeners.length == 1)
                {
                    this.enableChangeListening();
                }
            }
            return;
        }// end function

        public function removeChangeListener(param1:Function) : void
        {
            var _loc_2:* = this.listeners.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.listeners.splice(_loc_2, 1);
                if (this.listeners.length == 0)
                {
                    this.disableChangeListening();
                }
            }
            return;
        }// end function

        protected function triggerChange() : void
        {
            var _loc_2:Function = null;
            var _loc_1:* = this.approve();
            if (this.lastValue != _loc_1)
            {
                this.lastValue = _loc_1;
                for each (_loc_2 in this.listeners)
                {
                    
                    _loc_2.call(null, this.approve());
                }
            }
            return;
        }// end function

        protected function enableChangeListening() : void
        {
            return;
        }// end function

        protected function disableChangeListening() : void
        {
            return;
        }// end function

    }
}
