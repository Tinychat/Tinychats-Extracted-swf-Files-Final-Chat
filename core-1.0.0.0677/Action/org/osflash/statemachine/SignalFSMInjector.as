package org.osflash.statemachine
{
    import org.osflash.statemachine.core.*;
    import org.osflash.statemachine.decoding.*;
    import org.osflash.statemachine.transitioning.*;
    import org.robotlegs.core.*;

    public class SignalFSMInjector extends Object
    {
        private var _decoder:SignalXMLStateDecoder;
        private var _injector:IInjector;
        private var _stateMachine:IStateMachine;
        private var _transitionController:SignalTransitionController;
        private var _signalCommandMap:IGuardedSignalCommandMap;
        private var _fsmInjector:IFSMInjector;

        public function SignalFSMInjector(injector:IInjector, signalCommandMap:IGuardedSignalCommandMap)
        {
            _injector = injector;
            _signalCommandMap = signalCommandMap;
            return;
        }// end function

        public function destroy() : void
        {
            _fsmInjector.destroy();
            _fsmInjector = null;
            _decoder = null;
            _injector = null;
            _signalCommandMap = null;
            _stateMachine = null;
            _transitionController = null;
            return;
        }// end function

        public function initiate(stateDefinition:XML, logger:ILoggable = null) : void
        {
            _decoder = new SignalXMLStateDecoder(stateDefinition, _injector, _signalCommandMap);
            _fsmInjector = new FSMInjector(_decoder);
            _transitionController = new SignalTransitionController(null, logger);
            _stateMachine = new StateMachine(_transitionController, logger);
            return;
        }// end function

        public function inject() : void
        {
            _injector.mapValue(IStateMachine, _stateMachine);
            _injector.mapValue(IFSMController, _transitionController.fsmController);
            _fsmInjector.inject(_stateMachine);
            return;
        }// end function

        public function hasClass(name:Object) : Boolean
        {
            return _decoder.hasClass(name);
        }// end function

        public function addClass(commandClass:Class) : Boolean
        {
            return _decoder.addClass(commandClass);
        }// end function

    }
}
