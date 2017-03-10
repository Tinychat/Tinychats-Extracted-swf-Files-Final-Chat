package com.tinychat.controller.state.fsm
{
    import com.tinychat.controller.state.*;

    public class Fsm extends XmlWrapper
    {

        public function Fsm(param1:State)
        {
            xml = new XML("<fsm initial=\'" + param1.toString() + "\'></fsm>");
            return;
        }// end function

        public function addState(param1:FsmState) : void
        {
            xml.appendChild(param1.toXML());
            return;
        }// end function

        public function addStates(... args) : void
        {
            args = null;
            for each (args in args)
            {
                
                xml.appendChild(args.toXML());
            }
            return;
        }// end function

    }
}
