package org.robotlegs.base
{
    import flash.events.*;

    public class ContextEvent extends Event
    {
        protected var _body:Object;
        public static const STARTUP:String = "startup";
        public static const STARTUP_COMPLETE:String = "startupComplete";
        public static const SHUTDOWN:String = "shutdown";
        public static const SHUTDOWN_COMPLETE:String = "shutdownComplete";

        public function ContextEvent(type:String, body = null)
        {
            super(type);
            this._body = body;
            return;
        }// end function

        public function get body()
        {
            return this._body;
        }// end function

        override public function clone() : Event
        {
            return new ContextEvent(type, this.body);
        }// end function

    }
}
