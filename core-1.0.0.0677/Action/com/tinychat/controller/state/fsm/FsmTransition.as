package com.tinychat.controller.state.fsm
{
    import com.tinychat.controller.state.*;

    public class FsmTransition extends XmlWrapper
    {

        public function FsmTransition(param1:StateAction, param2:State)
        {
            xml = new XML("<transition action=\'" + param1.toString() + "\' target=\'" + param2.toString() + "\' />");
            return;
        }// end function

    }
}
