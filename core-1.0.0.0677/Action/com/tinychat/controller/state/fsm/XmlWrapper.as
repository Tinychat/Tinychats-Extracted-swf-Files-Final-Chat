package com.tinychat.controller.state.fsm
{

    public class XmlWrapper extends Object
    {
        protected var xml:XML;

        public function XmlWrapper()
        {
            return;
        }// end function

        public function toXML() : XML
        {
            return this.xml.copy();
        }// end function

    }
}
