package org.osflash.statemachine.base
{

    public class BaseState extends Object implements IState
    {
        private var _referringAction:String;
        private var _name:String;
        private var _numberOfTransitions:int;
        protected var _transitions:Object;

        public function BaseState(name:String) : void
        {
            _transitions = new Object();
            _name = name;
            return;
        }// end function

        public function removeTrans(action:String) : Boolean
        {
            if (getTarget(action) == null)
            {
                return false;
            }
            delete _transitions[action];
            var _loc_3:* = _numberOfTransitions - 1;
            _numberOfTransitions = _loc_3;
            return true;
        }// end function

        public function get referringAction() : String
        {
            return _referringAction;
        }// end function

        public function get name() : String
        {
            return _name;
        }// end function

        public function get length() : int
        {
            return _numberOfTransitions;
        }// end function

        public function getTarget(action:String) : String
        {
            if (_transitions[action] != null)
            {
                _referringAction = action;
            }
            return _transitions[action];
        }// end function

        public function destroy() : void
        {
            _transitions = null;
            return;
        }// end function

        public function defineTrans(action:String, target:String) : Boolean
        {
            if (hasTrans(action))
            {
                return false;
            }
            _transitions[action] = target;
            var _loc_4:* = _numberOfTransitions + 1;
            _numberOfTransitions = _loc_4;
            return true;
        }// end function

        public function hasTrans(action:String) : Boolean
        {
            if (_transitions == null)
            {
                return false;
            }
            return _transitions[action] != null;
        }// end function

    }
}
