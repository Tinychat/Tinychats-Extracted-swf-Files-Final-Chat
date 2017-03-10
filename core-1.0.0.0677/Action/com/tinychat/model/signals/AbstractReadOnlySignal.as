package com.tinychat.model.signals
{
    import org.osflash.signals.*;

    public class AbstractReadOnlySignal extends Object implements ISignal
    {
        protected var signal:Signal;

        public function AbstractReadOnlySignal(... args)
        {
            this.signal = new Signal(args);
            return;
        }// end function

        public function get valueClasses() : Array
        {
            return this.signal.valueClasses;
        }// end function

        public function set valueClasses(param1:Array) : void
        {
            this.signal.valueClasses = param1;
            return;
        }// end function

        public function get numListeners() : uint
        {
            return this.signal.numListeners;
        }// end function

        public function add(param1:Function) : Function
        {
            return this.signal.add(param1);
        }// end function

        public function addOnce(param1:Function) : Function
        {
            return this.signal.addOnce(param1);
        }// end function

        public function remove(param1:Function) : Function
        {
            return this.signal.remove(param1);
        }// end function

    }
}
