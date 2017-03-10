package org.osflash.statemachine.states
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.base.*;
    import org.osflash.statemachine.signals.*;

    public class SignalState extends BaseState implements ISignalState
    {
        protected var _tearDown:Signal;
        protected var _cancelled:Signal;
        protected var _exitingGuard:Signal;
        protected var _enteringGuard:Signal;
        protected var _entered:Signal;

        public function SignalState(name:String) : void
        {
            super(name);
            return;
        }// end function

        public function get exitingGuard() : ISignal
        {
            if (_exitingGuard == null)
            {
                _exitingGuard = new ExitingGuard();
            }
            return _exitingGuard;
        }// end function

        public function get enteringGuard() : ISignal
        {
            if (_enteringGuard == null)
            {
                _enteringGuard = new EnteringGuard();
            }
            return _enteringGuard;
        }// end function

        public function get hasExitingGuard() : Boolean
        {
            return _exitingGuard != null;
        }// end function

        public function get entered() : ISignal
        {
            if (_entered == null)
            {
                _entered = new Entered();
            }
            return _entered;
        }// end function

        public function get hasEnteringGuard() : Boolean
        {
            return _enteringGuard != null;
        }// end function

        public function get hasCancelled() : Boolean
        {
            return _cancelled != null;
        }// end function

        public function get cancelled() : ISignal
        {
            if (_cancelled == null)
            {
                _cancelled = new Cancelled();
            }
            return _cancelled;
        }// end function

        public function dispatchExitingGuard(payload:Object) : void
        {
            if (_exitingGuard != null)
            {
            }
            if (_exitingGuard.numListeners < 0)
            {
                return;
            }
            _exitingGuard.dispatch(payload);
            return;
        }// end function

        public function dispatchEnteringGuard(payload:Object) : void
        {
            if (_enteringGuard != null)
            {
            }
            if (_enteringGuard.numListeners < 0)
            {
                return;
            }
            _enteringGuard.dispatch(payload);
            return;
        }// end function

        public function get hasTearDown() : Boolean
        {
            return _tearDown != null;
        }// end function

        public function get tearDown() : ISignal
        {
            if (_tearDown == null)
            {
                _tearDown = new TearDown();
            }
            return _tearDown;
        }// end function

        public function dispatchEntered(payload:Object) : void
        {
            if (_entered != null)
            {
            }
            if (_entered.numListeners < 0)
            {
                return;
            }
            _entered.dispatch(payload);
            return;
        }// end function

        public function dispatchCancelled(reason:String, payload:Object) : void
        {
            if (_cancelled != null)
            {
            }
            if (_cancelled.numListeners < 0)
            {
                return;
            }
            _cancelled.dispatch(reason, payload);
            return;
        }// end function

        override public function destroy() : void
        {
            if (_entered != null)
            {
                _entered.removeAll();
            }
            if (_enteringGuard != null)
            {
                _enteringGuard.removeAll();
            }
            if (_exitingGuard != null)
            {
                _exitingGuard.removeAll();
            }
            if (_tearDown != null)
            {
                _tearDown.removeAll();
            }
            if (_cancelled != null)
            {
                _cancelled.removeAll();
            }
            _entered = null;
            _enteringGuard = null;
            _exitingGuard = null;
            _tearDown = null;
            _cancelled = null;
            super.destroy();
            return;
        }// end function

        public function get hasEntered() : Boolean
        {
            return _entered != null;
        }// end function

        public function dispatchTearDown() : void
        {
            if (_tearDown != null)
            {
            }
            if (_tearDown.numListeners < 0)
            {
                return;
            }
            _tearDown.dispatch();
            return;
        }// end function

    }
}
