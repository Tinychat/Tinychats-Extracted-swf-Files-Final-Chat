package com.tinychat.controller.commands.utils
{
    import org.robotlegs.mvcs.*;

    public class DispatchSignalCommand extends SignalCommand
    {
        public var signalClass:Class;
        public var args:Array;

        public function DispatchSignalCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:* = injector.getInstance(this.signalClass);
            _loc_1.dispatch.apply(null, this.args);
            return;
        }// end function

    }
}
