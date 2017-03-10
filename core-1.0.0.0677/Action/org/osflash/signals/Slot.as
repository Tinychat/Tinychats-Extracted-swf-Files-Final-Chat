package org.osflash.signals
{

    public class Slot extends Object
    {
        public var listener:Function;
        public var once:Boolean;
        public var priority:int;
        private var signal:ISignal;

        public function Slot(listener:Function, once:Boolean = false, signal:ISignal = null, priority:int = 0)
        {
            this.listener = listener;
            this.once = once;
            this.signal = signal;
            this.priority = priority;
            return;
        }// end function

        public function execute(valueObjects:Array) : void
        {
            if (this.once)
            {
                this.signal.remove(this.listener);
            }
            this.listener.apply(null, valueObjects);
            return;
        }// end function

        public function execute0() : void
        {
            if (this.once)
            {
                this.signal.remove(this.listener);
            }
            this.listener();
            return;
        }// end function

        public function execute1(value1:Object) : void
        {
            if (this.once)
            {
                this.signal.remove(this.listener);
            }
            this.listener(value1);
            return;
        }// end function

        public function execute2(value1:Object, value2:Object) : void
        {
            if (this.once)
            {
                this.signal.remove(this.listener);
            }
            this.listener(value1, value2);
            return;
        }// end function

    }
}
