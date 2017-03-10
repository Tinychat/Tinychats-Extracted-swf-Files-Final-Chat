package org.osflash.statemachine
{
    import org.osflash.statemachine.core.*;
    import org.osflash.statemachine.errors.*;

    public class StateMachine extends Object implements IStateMachine, ILoggable
    {
        protected var _initial:IState;
        protected var _states:Object;
        private var _logger:ILoggable;
        protected var _transitionController:ITransitionController;
        private static const NO_INITIAL_STATE_DECLARED:String = "Initial state not defined or is referring to a state that is not defined";

        public function StateMachine(controller:ITransitionController, logger:ILoggable = null) : void
        {
            _states = new Object();
            _transitionController = controller;
            _logger = logger;
            initiate();
            return;
        }// end function

        public function get currentStateName() : String
        {
            return _transitionController.currentState == null ? (null) : (_transitionController.currentState.name.valueOf());
        }// end function

        public function log(msg:String) : void
        {
            if (_logger != null)
            {
                _logger.log(msg);
            }
            return;
        }// end function

        private function initiate() : void
        {
            _transitionController.actionCallback = doAction;
            return;
        }// end function

        public function hasState(stateName:String) : Boolean
        {
            return _states[stateName] != null;
        }// end function

        public function onRegister() : void
        {
            if (_initial)
            {
                transitionTo(_initial, null);
            }
            else
            {
                throw new StateDecodeError(NO_INITIAL_STATE_DECLARED);
            }
            return;
        }// end function

        public function logPhase(phase:ITransitionPhase, stateName:String = "") : void
        {
            if (_logger != null)
            {
                _logger.logPhase(phase, stateName);
            }
            return;
        }// end function

        protected function doAction(action:String, payload:Object) : Boolean
        {
            if (_transitionController.currentState == null)
            {
                return false;
            }
            var _loc_3:* = _transitionController.currentState.getTarget(action);
            var _loc_4:* = IState(_states[_loc_3]);
            if (_loc_4 != null)
            {
                return transitionTo(_loc_4, payload);
            }
            if (_loc_3 != null)
            {
                throw new StateTransitionError(StateTransitionError.TARGET_DECLARATION_MISMATCH + _loc_3);
            }
            log("ACTION: " + action + "is not defined in STATE: " + currentStateName);
            return false;
        }// end function

        public function removeState(stateName:String) : Boolean
        {
            if (!hasState(stateName))
            {
                return false;
            }
            delete _states[stateName];
            return true;
        }// end function

        public function registerState(state:IState, initial:Boolean = false) : Boolean
        {
            if (state != null)
            {
            }
            if (hasState(state.name))
            {
                return false;
            }
            _states[state.name] = state;
            if (initial)
            {
                this._initial = IState(state);
            }
            return true;
        }// end function

        protected function transitionTo(targetState:IState, payload:Object = null) : Boolean
        {
            if (targetState == null)
            {
                return false;
            }
            if (_transitionController.isTransitioning)
            {
                throw new StateTransitionError(StateTransitionError.ALREADY_TRANSITIONING);
            }
            _transitionController.transition(targetState, payload);
            return true;
        }// end function

        public function destroy() : void
        {
            var _loc_1:IState = null;
            _transitionController.destroy();
            for each (_loc_1 in _states)
            {
                
                _loc_1.destroy();
            }
            _states = null;
            _initial = null;
            return;
        }// end function

    }
}
