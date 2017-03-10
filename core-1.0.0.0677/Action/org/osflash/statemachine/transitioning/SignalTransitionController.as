package org.osflash.statemachine.transitioning
{
    import org.osflash.statemachine.base.*;
    import org.osflash.statemachine.core.*;
    import org.osflash.statemachine.states.*;

    public class SignalTransitionController extends BaseTransitionController
    {
        private var _controller:IFSMControllerOwner;

        public function SignalTransitionController(controller:IFSMControllerOwner = null, logger:ILoggable = null)
        {
            super(logger);
            if (!controller)
            {
            }
            _controller = new FSMController();
            _controller.addActionListener(handleAction);
            _controller.addCancelListener(handleCancel);
            return;
        }// end function

        override protected function setCurrentState(state:IState) : void
        {
            super.setCurrentState(state);
            _controller.setCurrentState(state);
            return;
        }// end function

        private function setReferringAction() : void
        {
            if (currentState == null)
            {
                return;
            }
            _controller.setReferringAction(currentState.referringAction);
            return;
        }// end function

        override protected function setIsTransitioning(value:Boolean) : void
        {
            super.setIsTransitioning(value);
            _controller.setIsTransition(value);
            return;
        }// end function

        override public function destroy() : void
        {
            _controller.destroy();
            super.destroy();
            return;
        }// end function

        protected function get currentSignalState() : SignalState
        {
            return SignalState(currentState);
        }// end function

        override protected function dispatchGeneralStateChanged() : void
        {
            if (_controller.hasChangedListener)
            {
                _controller.setTransitionPhase(TransitionPhase.GLOBAL_CHANGED);
                logPhase(TransitionPhase.GLOBAL_CHANGED);
                _controller.dispatchChanged(currentState.name);
            }
            _controller.setTransitionPhase(TransitionPhase.NONE);
            return;
        }// end function

        override protected function onTransition(target:IState, payload:Object) : void
        {
            var _loc_3:* = SignalState(target);
            setReferringAction();
            if (currentState != null)
            {
            }
            if (currentSignalState.hasExitingGuard)
            {
                _controller.setTransitionPhase(TransitionPhase.EXITING_GUARD);
                logPhase(TransitionPhase.EXITING_GUARD, currentState.name);
                currentSignalState.dispatchExitingGuard(payload);
            }
            if (isCanceled)
            {
                return;
            }
            if (_loc_3.hasEnteringGuard)
            {
                _controller.setTransitionPhase(TransitionPhase.ENTERING_GUARD);
                logPhase(TransitionPhase.ENTERING_GUARD, _loc_3.name);
                _loc_3.dispatchEnteringGuard(payload);
            }
            if (isCanceled)
            {
                return;
            }
            if (currentState != null)
            {
            }
            if (currentSignalState.hasTearDown)
            {
                _controller.setTransitionPhase(TransitionPhase.TEAR_DOWN);
                logPhase(TransitionPhase.TEAR_DOWN, currentState.name);
                currentSignalState.dispatchTearDown();
            }
            setCurrentState(_loc_3);
            log("CURRENT STATE CHANGED TO: " + currentState.name);
            if (currentSignalState.hasEntered)
            {
                _controller.setTransitionPhase(TransitionPhase.ENTERED);
                logPhase(TransitionPhase.ENTERED, currentState.name);
                currentSignalState.dispatchEntered(payload);
            }
            return;
        }// end function

        override protected function dispatchCancelled() : void
        {
            if (currentState != null)
            {
            }
            if (currentSignalState.hasCancelled)
            {
                _controller.setTransitionPhase(TransitionPhase.CANCELLED);
                logPhase(TransitionPhase.CANCELLED, currentState.name);
                currentSignalState.dispatchCancelled(cancellationReason, cachedPayload);
            }
            _controller.setTransitionPhase(TransitionPhase.NONE);
            return;
        }// end function

        public function get fsmController() : IFSMController
        {
            return IFSMController(_controller);
        }// end function

    }
}
