package org.robotlegs.base
{
    import flash.utils.*;
    import org.osflash.signals.*;
    import org.robotlegs.core.*;

    public class SignalCommandMap extends Object implements ISignalCommandMap
    {
        protected var injector:IInjector;
        protected var signalMap:Dictionary;
        protected var signalClassMap:Dictionary;
        protected var verifiedCommandClasses:Dictionary;

        public function SignalCommandMap(injector:IInjector)
        {
            this.injector = injector;
            this.signalMap = new Dictionary(false);
            this.signalClassMap = new Dictionary(false);
            this.verifiedCommandClasses = new Dictionary(false);
            return;
        }// end function

        public function mapSignal(signal:ISignal, commandClass:Class, oneShot:Boolean = false) : void
        {
            var signal:* = signal;
            var commandClass:* = commandClass;
            var oneShot:* = oneShot;
            this.verifyCommandClass(commandClass);
            if (this.hasSignalCommand(signal, commandClass))
            {
                return;
            }
            if (!this.signalMap[signal])
            {
            }
            var _loc_5:* = new Dictionary(false);
            this.signalMap[signal] = new Dictionary(false);
            var signalCommandMap:* = _loc_5;
            var callback:* = function (a = null, b = null, c = null, d = null, e = null, f = null, g = null) : void
            {
                routeSignalToCommand(signal, arguments, commandClass, oneShot);
                return;
            }// end function
            ;
            signalCommandMap[commandClass] = callback;
            signal.add(callback);
            return;
        }// end function

        public function mapSignalClass(signalClass:Class, commandClass:Class, oneShot:Boolean = false) : ISignal
        {
            var _loc_4:* = this.getSignalClassInstance(signalClass);
            this.mapSignal(_loc_4, commandClass, oneShot);
            return _loc_4;
        }// end function

        protected function getSignalClassInstance(signalClass:Class) : ISignal
        {
            if (!ISignal(this.signalClassMap[signalClass]))
            {
                ISignal(this.signalClassMap[signalClass]);
            }
            return this.createSignalClassInstance(signalClass);
        }// end function

        private function createSignalClassInstance(signalClass:Class) : ISignal
        {
            var _loc_3:ISignal = null;
            var _loc_2:* = this.injector;
            if (this.injector.hasMapping(IInjector))
            {
                _loc_2 = this.injector.getInstance(IInjector);
            }
            _loc_3 = _loc_2.instantiate(signalClass);
            _loc_2.mapValue(signalClass, _loc_3);
            this.signalClassMap[signalClass] = _loc_3;
            return _loc_3;
        }// end function

        public function hasSignalCommand(signal:ISignal, commandClass:Class) : Boolean
        {
            var _loc_3:* = this.signalMap[signal];
            if (_loc_3 == null)
            {
                return false;
            }
            var _loc_4:* = _loc_3[commandClass];
            return _loc_4 != null;
        }// end function

        public function unmapSignal(signal:ISignal, commandClass:Class) : void
        {
            var _loc_3:* = this.signalMap[signal];
            if (_loc_3 == null)
            {
                return;
            }
            var _loc_4:* = _loc_3[commandClass];
            if (_loc_4 == null)
            {
                return;
            }
            signal.remove(_loc_4);
            delete _loc_3[commandClass];
            return;
        }// end function

        public function unmapSignalClass(signalClass:Class, commandClass:Class) : void
        {
            this.unmapSignal(this.getSignalClassInstance(signalClass), commandClass);
            return;
        }// end function

        protected function routeSignalToCommand(signal:ISignal, valueObjects:Array, commandClass:Class, oneshot:Boolean) : void
        {
            this.mapSignalValues(signal.valueClasses, valueObjects);
            this.createCommandInstance(commandClass).execute();
            this.unmapSignalValues(signal.valueClasses, valueObjects);
            if (oneshot)
            {
                this.unmapSignal(signal, commandClass);
            }
            return;
        }// end function

        protected function createCommandInstance(commandClass:Class) : Object
        {
            return this.injector.instantiate(commandClass);
        }// end function

        protected function mapSignalValues(valueClasses:Array, valueObjects:Array) : void
        {
            var _loc_3:uint = 0;
            while (_loc_3 < valueClasses.length)
            {
                
                this.injector.mapValue(valueClasses[_loc_3], valueObjects[_loc_3]);
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        protected function unmapSignalValues(valueClasses:Array, valueObjects:Array) : void
        {
            var _loc_3:uint = 0;
            while (_loc_3 < valueClasses.length)
            {
                
                this.injector.unmap(valueClasses[_loc_3]);
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        protected function verifyCommandClass(commandClass:Class) : void
        {
            var commandClass:* = commandClass;
            if (this.verifiedCommandClasses[commandClass])
            {
                return;
            }
            var _loc_4:int = 0;
            var _loc_5:* = describeType(commandClass).factory.method;
            var _loc_3:* = new XMLList("");
            for each (_loc_6 in _loc_5)
            {
                
                var _loc_7:* = _loc_6;
                with (_loc_6)
                {
                    if (@name == "execute")
                    {
                        _loc_3[_loc_4] = _loc_6;
                    }
                }
            }
            if (_loc_3.length() != 1)
            {
                throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + " - " + commandClass);
            }
            this.verifiedCommandClasses[commandClass] = true;
            return;
        }// end function

    }
}
