package org.osflash.statemachine.base
{
    import org.osflash.statemachine.core.*;

    public class BaseTransitionController extends Object implements ITransitionController, ILoggable
    {
        private var _cancellationReason:String;
        private var _cachedPayload:Object;
        private var _isTransitioning:Boolean;
        private var _logger:ILoggable;
        private var _currentState:IState;
        private var _canceled:Boolean;
        private var _actionCallback:Function;

        public function BaseTransitionController(logger:ILoggable = null)
        {
            _logger = logger;
            return;
        }// end function

        public function destroy() : void
        {
            reset();
            _currentState = null;
            _actionCallback = null;
            return;
        }// end function

        protected function handleCancel(reason:String = null, payload:Object = null) : void
        {
            _canceled = true;
            _cancellationReason = reason;
            _cachedPayload = payload;
            return;
        }// end function

        public function log(msg:String) : void
        {
            if (_logger != null)
            {
                _logger.log(msg);
            }
            return;
        }// end function

        protected function handleAction(action:String, payload:Object) : Boolean
        {
            if (_actionCallback == null)
            {
                return false;
            }
            _actionCallback(action, payload);
            return true;
        }// end function

        protected function dispatchCancelled() : void
        {
            return;
        }// end function

        protected function dispatchGeneralStateChanged() : void
        {
            return;
        }// end function

        protected function get cachedPayload() : Object
        {
            return _cachedPayload;
        }// end function

        protected function onTransition(target:IState, payload:Object) : void
        {
            return;
        }// end function

        final public function transition(target:IState, payload:Object = null) : void
        {
            setIsTransitioning(true);
            onTransition(target, payload);
            setIsTransitioning(false);
            if (isCanceled)
            {
                cancelTransition();
            }
            else
            {
                dispatchGeneralStateChanged();
            }
            reset();
            return;
        }// end function

        protected function reset() : void
        {
            _cancellationReason = null;
            _cachedPayload = null;
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

        public function get currentState() : IState
        {
            return _currentState;
        }// end function

        protected function setCurrentState(state:IState) : void
        {
            _currentState = state;
            return;
        }// end function

        public function get isTransitioning() : Boolean
        {
            return _isTransitioning;
        }// end function

        protected function get cancellationReason() : String
        {
            return _cancellationReason;
        }// end function

        protected function setIsTransitioning(value:Boolean) : void
        {
            _isTransitioning = value;
            return;
        }// end function

        protected function get isCanceled() : Boolean
        {
            return _canceled;
        }// end function

        public function set actionCallback(value:Function) : void
        {
            _actionCallback = value;
            return;
        }// end function

        final protected function cancelTransition() : void
        {
            _canceled = false;
            log("Transtition has been cancelled");
            dispatchCancelled();
            return;
        }// end function

    }
}
