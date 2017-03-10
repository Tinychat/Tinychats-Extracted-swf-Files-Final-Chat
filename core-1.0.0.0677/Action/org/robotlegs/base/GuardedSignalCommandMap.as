package org.robotlegs.base
{
    import flash.utils.*;
    import org.osflash.signals.*;
    import org.robotlegs.core.*;

    public class GuardedSignalCommandMap extends SignalCommandMap implements IGuardedSignalCommandMap
    {
        protected var verifiedGuardClasses:Dictionary;
        public const E_GUARD_NOIMPL:String = "Guard Class does not implement an approve() method";

        public function GuardedSignalCommandMap(injector:IInjector)
        {
            super(injector);
            this.verifiedGuardClasses = new Dictionary(false);
            return;
        }// end function

        public function mapGuardedSignal(signal:ISignal, commandClass:Class, guards, oneShot:Boolean = false) : void
        {
            var signal:* = signal;
            var commandClass:* = commandClass;
            var guards:* = guards;
            var oneShot:* = oneShot;
            verifyCommandClass(commandClass);
            if (!(guards is Array))
            {
                guards;
            }
            this.verifyGuardClasses(guards);
            if (hasSignalCommand(signal, commandClass))
            {
                return;
            }
            if (!signalMap[signal])
            {
            }
            var _loc_6:* = new Dictionary(false);
            signalMap[signal] = new Dictionary(false);
            var signalCommandMap:* = _loc_6;
            var callback:* = function (a = null, b = null, c = null, d = null, e = null, f = null, g = null) : void
            {
                routeSignalToGuardedCommand(signal, arguments, commandClass, oneShot, guards);
                return;
            }// end function
            ;
            signalCommandMap[commandClass] = callback;
            signal.add(callback);
            return;
        }// end function

        public function mapGuardedSignalClass(signalClass:Class, commandClass:Class, guards, oneShot:Boolean = false) : ISignal
        {
            var _loc_5:* = getSignalClassInstance(signalClass);
            this.mapGuardedSignal(_loc_5, commandClass, guards, oneShot);
            return _loc_5;
        }// end function

        protected function routeSignalToGuardedCommand(signal:ISignal, valueObjects:Array, commandClass:Class, oneshot:Boolean, guardClasses:Array) : void
        {
            var _loc_6:Class = null;
            var _loc_10:Object = null;
            mapSignalValues(signal.valueClasses, valueObjects);
            var _loc_7:* = guardClasses.length;
            var _loc_8:int = 0;
            while (_loc_8 < _loc_7)
            {
                
                _loc_6 = guardClasses[_loc_8];
                _loc_10 = injector.instantiate(_loc_6);
                if (!_loc_10.approve())
                {
                    unmapSignalValues(signal.valueClasses, valueObjects);
                    return;
                }
                _loc_8 = _loc_8 + 1;
            }
            var _loc_9:* = injector.instantiate(commandClass);
            unmapSignalValues(signal.valueClasses, valueObjects);
            _loc_9.execute();
            if (oneshot)
            {
                unmapSignal(signal, commandClass);
            }
            return;
        }// end function

        protected function verifyGuardClasses(guardClasses:Array) : void
        {
            var guardClass:Class;
            var guardClasses:* = guardClasses;
            var iLength:* = guardClasses.length;
            var i:int;
            while (i < iLength)
            {
                
                guardClass = guardClasses[i];
                if (!this.verifiedGuardClasses[guardClass])
                {
                    var _loc_4:int = 0;
                    var _loc_5:* = describeType(guardClass).factory.method;
                    var _loc_3:* = new XMLList("");
                    for each (_loc_6 in _loc_5)
                    {
                        
                        var _loc_7:* = _loc_6;
                        with (_loc_6)
                        {
                            if (@name == "approve")
                            {
                                _loc_3[_loc_4] = _loc_6;
                            }
                        }
                    }
                    this.verifiedGuardClasses[guardClass] = _loc_3.length();
                    if (!this.verifiedGuardClasses[guardClass])
                    {
                        throw new ContextError(this.E_GUARD_NOIMPL + " - " + guardClass);
                    }
                }
                i = (i + 1);
            }
            return;
        }// end function

    }
}
