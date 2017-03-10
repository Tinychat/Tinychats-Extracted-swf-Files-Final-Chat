package com.tinychat.controller.state.fsm
{
    import com.tinychat.controller.state.*;
    import flash.utils.*;

    public class FsmState extends XmlWrapper
    {

        public function FsmState(param1:State)
        {
            xml = new XML("<state name=\'" + param1.toString() + "\'><entered /><tearDown /></state>");
            return;
        }// end function

        public function set state(param1:State) : void
        {
            xml.@name = param1.toString();
            return;
        }// end function

        public function addEnteredCommand(param1:Class) : void
        {
            xml.entered[0].appendChild(this.createCommandClass(param1));
            return;
        }// end function

        public function addExitingCommand(param1:Class) : void
        {
            xml.tearDown[0].appendChild(this.createCommandClass(param1));
            return;
        }// end function

        public function addTransition(param1:FsmTransition) : void
        {
            xml.appendChild(param1.toXML());
            return;
        }// end function

        private function createCommandClass(param1:Class) : XML
        {
            return new XML("<commandClass classPath=\'" + getQualifiedClassName(param1) + "\' />");
        }// end function

    }
}
