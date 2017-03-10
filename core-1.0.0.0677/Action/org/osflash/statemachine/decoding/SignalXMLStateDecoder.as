package org.osflash.statemachine.decoding
{
    import SignalXMLStateDecoder.as$22.*;
    import org.osflash.signals.*;
    import org.osflash.statemachine.base.*;
    import org.osflash.statemachine.core.*;
    import org.osflash.statemachine.errors.*;
    import org.osflash.statemachine.states.*;
    import org.osflash.statemachine.transitioning.*;
    import org.robotlegs.core.*;

    public class SignalXMLStateDecoder extends BaseXMLStateDecoder
    {
        protected var errors:Array;
        protected var classBagMap:Array;
        protected var injector:IInjector;
        protected var signalCommandMap:IGuardedSignalCommandMap;
        public static const COMMAND_CLASS_NOT_REGISTERED:String = "These commands need to be added to the StateDecoder: ";
        public static const COMMAND_CLASS_CAN_BE_MAPPED_ONCE_ONLY_TO_SAME_SIGNAL:String = "A command class can be mapped once only to the same signal: ";

        public function SignalXMLStateDecoder(fsm:XML, injector:IInjector, signalCommandMap:IGuardedSignalCommandMap) : void
        {
            this.injector = injector;
            this.signalCommandMap = signalCommandMap;
            errors = [];
            super(fsm);
            return;
        }// end function

        protected function injectState(state:IState, stateDef:Object) : void
        {
            var _loc_3:* = stateDef.@inject.toString() == "true";
            if (_loc_3)
            {
                injector.mapValue(ISignalState, state, state.name);
            }
            return;
        }// end function

        public function getClass(name:Object) : Class
        {
            var _loc_2:ClassBag = null;
            for each (_loc_2 in classBagMap)
            {
                
                if (_loc_2.equals(name))
                {
                    return _loc_2.payload;
                }
            }
            return null;
        }// end function

        private function doesNotHaveMapping(signal:ISignal, commandClass:Class) : Boolean
        {
            if (signalCommandMap.hasSignalCommand(signal, commandClass))
            {
                throw new StateDecodeError(COMMAND_CLASS_CAN_BE_MAPPED_ONCE_ONLY_TO_SAME_SIGNAL);
            }
            return true;
        }// end function

        private function mapSignalCommand(signal:ISignal, phaseDecoder:PhaseDecoder) : void
        {
            var _loc_3:PhaseDecoderItem = null;
            var _loc_4:Class = null;
            for each (_loc_3 in phaseDecoder.decodedItems)
            {
                
                if (_loc_3.isError)
                {
                    throw new StateDecodeError(_loc_3.error);
                }
                if (_loc_3.guardCommandClassNames == null)
                {
                    _loc_4 = getAndValidateClass(_loc_3.commandClassName);
                    if (_loc_4 != null)
                    {
                    }
                    if (doesNotHaveMapping(signal, _loc_4))
                    {
                        signalCommandMap.mapSignal(signal, _loc_4);
                    }
                    continue;
                }
                mapGuardedSignalCommand(signal, _loc_3);
            }
            return;
        }// end function

        final override public function decodeState(stateDef:Object) : IState
        {
            var _loc_2:* = getState(stateDef);
            decodeTransitions(_loc_2, stateDef);
            injectState(_loc_2, stateDef);
            mapSignals(_loc_2, stateDef);
            return _loc_2;
        }// end function

        private function getAndValidateClass(name:Object) : Class
        {
            var _loc_2:* = getClass(name);
            if (_loc_2 == null)
            {
                errors.push(name.toString());
            }
            return _loc_2;
        }// end function

        protected function mapSignals(signalState:ISignalState, stateDef:Object) : void
        {
            var _loc_3:* = new PhaseDecoder(TransitionPhase.ENTERED, stateDef.entered);
            var _loc_4:* = new PhaseDecoder(TransitionPhase.ENTERING_GUARD, stateDef.enteringGuard);
            var _loc_5:* = new PhaseDecoder(TransitionPhase.EXITING_GUARD, stateDef.exitingGuard);
            var _loc_6:* = new PhaseDecoder(TransitionPhase.TEAR_DOWN, stateDef.tearDown);
            var _loc_7:* = new PhaseDecoder(TransitionPhase.CANCELLED, stateDef.cancelled);
            if (!_loc_3.isNull)
            {
                mapSignalCommand(signalState.entered, _loc_3);
            }
            if (!_loc_4.isNull)
            {
                mapSignalCommand(signalState.enteringGuard, _loc_4);
            }
            if (!_loc_5.isNull)
            {
                mapSignalCommand(signalState.exitingGuard, _loc_5);
            }
            if (!_loc_6.isNull)
            {
                mapSignalCommand(signalState.tearDown, _loc_6);
            }
            if (!_loc_7.isNull)
            {
                mapSignalCommand(signalState.cancelled, _loc_7);
            }
            if (errors.length > 0)
            {
                throw new StateDecodeError(COMMAND_CLASS_NOT_REGISTERED + errors.toString());
            }
            return;
        }// end function

        protected function decodeTransitions(state:IState, stateDef:Object) : void
        {
            var _loc_4:int = 0;
            var _loc_5:XML = null;
            var _loc_3:* = stateDef..transition as XMLList;
            while (_loc_4 < _loc_3.length())
            {
                
                _loc_5 = _loc_3[_loc_4];
                state.defineTrans(String(_loc_5.@action), String(_loc_5.@target));
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        public function addClass(value:Class) : Boolean
        {
            if (classBagMap == null)
            {
                classBagMap = [];
            }
            if (hasClass(value))
            {
                return false;
            }
            classBagMap.push(new ClassBag(value));
            return true;
        }// end function

        override public function destroy() : void
        {
            var _loc_1:ClassBag = null;
            errors = null;
            injector = null;
            signalCommandMap = null;
            if (classBagMap != null)
            {
                for each (_loc_1 in classBagMap)
                {
                    
                    _loc_1.destroy();
                }
            }
            classBagMap = null;
            super.destroy();
            return;
        }// end function

        protected function getState(stateDef:Object) : ISignalState
        {
            return new SignalState(stateDef.@name.toString());
        }// end function

        private function mapGuardedSignalCommand(signal:ISignal, item:PhaseDecoderItem) : void
        {
            var _loc_6:String = null;
            var _loc_7:Class = null;
            var _loc_3:Array = [];
            var _loc_4:* = getAndValidateClass(item.commandClassName);
            var _loc_5:* = item.hasFallback ? (getAndValidateClass(item.fallbackCommandClassName)) : (null);
            for each (_loc_6 in item.guardCommandClassNames)
            {
                
                _loc_7 = getAndValidateClass(_loc_6);
                if (_loc_7 != null)
                {
                    _loc_3.push(_loc_7);
                }
            }
            if (_loc_3.length == item.guardCommandClassNames.length)
            {
            }
            if (_loc_4 != null)
            {
            }
            if (!doesNotHaveMapping(signal, _loc_4))
            {
                return;
            }
            if (_loc_5 == null)
            {
                signalCommandMap.mapGuardedSignal(signal, _loc_4, _loc_3);
            }
            else
            {
                signalCommandMap.mapGuardedSignalWithFallback(signal, _loc_4, _loc_5, _loc_3);
            }
            return;
        }// end function

        public function hasClass(name:Object) : Boolean
        {
            return getClass(name) != null;
        }// end function

    }
}
