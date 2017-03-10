package org.osflash.statemachine
{
    import org.osflash.statemachine.core.*;

    public class FSMInjector extends Object implements IFSMInjector
    {
        protected var _stateDecoder:IStateDecoder;

        public function FSMInjector(stateDecoder:IStateDecoder)
        {
            _stateDecoder = stateDecoder;
            return;
        }// end function

        public function inject(statemachine:IStateMachine) : void
        {
            var _loc_3:IState = null;
            var _loc_2:* = _stateDecoder.getStateList();
            for each (_loc_3 in _loc_2)
            {
                
                statemachine.registerState(_loc_3, isInitial(_loc_3.name));
            }
            statemachine.onRegister();
            return;
        }// end function

        public function destroy() : void
        {
            _stateDecoder.destroy();
            _stateDecoder = null;
            return;
        }// end function

        protected function isInitial(stateName:String) : Boolean
        {
            return _stateDecoder.isInitial(stateName);
        }// end function

    }
}
