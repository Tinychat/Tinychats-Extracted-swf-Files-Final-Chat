package org.osflash.statemachine.base
{
    import org.osflash.statemachine.core.*;

    public class BaseXMLStateDecoder extends Object implements IStateDecoder
    {
        private var _fsm:XML;

        public function BaseXMLStateDecoder(fsm:XML)
        {
            setData(fsm);
            return;
        }// end function

        protected function getData() : XML
        {
            return _fsm;
        }// end function

        public function getStateList() : Array
        {
            var _loc_3:int = 0;
            var _loc_4:XML = null;
            var _loc_5:IState = null;
            var _loc_1:Array = [];
            var _loc_2:* = _fsm..state;
            while (_loc_3 < _loc_2.length())
            {
                
                _loc_4 = _loc_2[_loc_3];
                _loc_5 = decodeState(_loc_4);
                _loc_1.push(_loc_5);
                _loc_3 = _loc_3 + 1;
            }
            return _loc_1;
        }// end function

        public function decodeState(stateDef:Object) : IState
        {
            return null;
        }// end function

        public function destroy() : void
        {
            _fsm = null;
            return;
        }// end function

        public function isInitial(stateName:String) : Boolean
        {
            var _loc_2:* = _fsm.@initial.toString();
            return stateName == _loc_2;
        }// end function

        public function setData(value:Object) : void
        {
            _fsm = XML(value);
            return;
        }// end function

    }
}
