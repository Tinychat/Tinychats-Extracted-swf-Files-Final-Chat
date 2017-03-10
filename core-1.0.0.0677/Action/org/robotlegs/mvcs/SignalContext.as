package org.robotlegs.mvcs
{
    import flash.display.*;
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;

    public class SignalContext extends Context implements ISignalContext
    {
        protected var _signalCommandMap:ISignalCommandMap;

        public function SignalContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
        {
            super(contextView, autoStartup);
            return;
        }// end function

        public function get signalCommandMap() : ISignalCommandMap
        {
            if (!this._signalCommandMap)
            {
                var _loc_1:* = new SignalCommandMap(injector.createChild(injector.applicationDomain));
                this._signalCommandMap = new SignalCommandMap(injector.createChild(injector.applicationDomain));
            }
            return _loc_1;
        }// end function

        public function set signalCommandMap(value:ISignalCommandMap) : void
        {
            this._signalCommandMap = value;
            return;
        }// end function

        override protected function mapInjections() : void
        {
            super.mapInjections();
            injector.mapValue(ISignalCommandMap, this.signalCommandMap);
            return;
        }// end function

    }
}
