package org.osflash.statemachine.base
{
    import org.osflash.signals.*;
    import org.osflash.statemachine.core.*;
    import org.osflash.statemachine.errors.*;
    import org.osflash.statemachine.signals.*;
    import org.osflash.statemachine.transitioning.*;

    public class FSMController extends Object implements IFSMController, IFSMControllerOwner
    {
        private var _cachePayload:IPayload;
        protected var _cancel:Signal;
        private var _currentStateName:String;
        private var _isTransitioning:Boolean;
        private const ILLEGAL_CANCEL_ERROR:String = "A transition can only be cancelled from an enteringGuard or exitingGuard phase";
        private var _referringAction:String;
        private var _cacheActionName:String;
        protected var _action:Signal;
        private var _transitionPhase:ITransitionPhase;
        private const ILLEGAL_ACTION_ERROR:String = "An new transition can not be actioned from an enteringGuard, exitingGuard or a tearDown phase";
        protected var _changed:Signal;

        public function FSMController()
        {
            _transitionPhase = TransitionPhase.NONE;
            _action = new Action();
            _cancel = new Cancel();
            _changed = new Changed();
            return;
        }// end function

        public function destroy() : void
        {
            _action.removeAll();
            _cancel.removeAll();
            _changed.removeAll();
            _action = null;
            _cancel = null;
            _changed = null;
            return;
        }// end function

        private function instigateAction(actionName:String, payloadBody:Object = null) : void
        {
            var _loc_3:* = wrapPayload(payloadBody);
            if (isTransitioning)
            {
                _cacheActionName = actionName;
                _cachePayload = _loc_3;
                addChangedListenerOnce(dispatchActionLater);
            }
            else
            {
                _action.dispatch(actionName, _loc_3);
            }
            return;
        }// end function

        public function get referringAction() : String
        {
            return _referringAction;
        }// end function

        public function cancel(reason:String, payloadBody:Object = null) : void
        {
            var _loc_3:* = wrapPayload(payloadBody);
            if (_transitionPhase != TransitionPhase.ENTERING_GUARD)
            {
            }
            var _loc_4:* = _transitionPhase == TransitionPhase.EXITING_GUARD;
            if (_loc_4)
            {
                _cancel.dispatch(reason, _loc_3);
            }
            else
            {
                throw new StateTransitionError(ILLEGAL_CANCEL_ERROR);
            }
            return;
        }// end function

        public function addActionListener(listener:Function) : Function
        {
            return _action.add(listener);
        }// end function

        public function get hasChangedListener() : Boolean
        {
            return _changed == null ? (false) : (_changed.numListeners > 0);
        }// end function

        private function dispatchActionLater(stateName:String = null) : void
        {
            _action.dispatch(_cacheActionName, _cachePayload);
            _cacheActionName = null;
            _cachePayload = null;
            return;
        }// end function

        public function setCurrentState(state:IState) : void
        {
            _currentStateName = state.name;
            return;
        }// end function

        public function get transitionPhase() : String
        {
            return _transitionPhase.org.osflash.statemachine.core:ITransitionPhase::name;
        }// end function

        public function addChangedListener(listener:Function) : Function
        {
            return _changed.add(listener);
        }// end function

        public function setIsTransition(value:Boolean) : void
        {
            _isTransitioning = value;
            return;
        }// end function

        public function action(actionName:String, payload:Object = null) : void
        {
            if (_transitionPhase != TransitionPhase.TEAR_DOWN)
            {
            }
            if (_transitionPhase != TransitionPhase.ENTERING_GUARD)
            {
            }
            var _loc_3:* = _transitionPhase == TransitionPhase.EXITING_GUARD;
            if (_loc_3)
            {
                throw new StateTransitionError(ILLEGAL_ACTION_ERROR);
            }
            instigateAction(actionName, payload);
            return;
        }// end function

        public function get currentStateName() : String
        {
            return _currentStateName;
        }// end function

        public function setReferringAction(value:String) : void
        {
            _referringAction = value;
            return;
        }// end function

        public function addCancelListener(listener:Function) : Function
        {
            return _cancel.add(listener);
        }// end function

        public function addChangedListenerOnce(listener:Function) : Function
        {
            return _changed.addOnce(listener);
        }// end function

        public function dispatchChanged(stateName:String) : void
        {
            _changed.dispatch(stateName);
            return;
        }// end function

        public function get isTransitioning() : Boolean
        {
            return _isTransitioning;
        }// end function

        private function wrapPayload(body:Object) : IPayload
        {
            if (body is IPayload)
            {
                return IPayload(body);
            }
            return new Payload(body);
        }// end function

        public function removeChangedListener(listener:Function) : Function
        {
            return _changed.remove(listener);
        }// end function

        public function setTransitionPhase(value:ITransitionPhase) : void
        {
            _transitionPhase = value;
            return;
        }// end function

    }
}
