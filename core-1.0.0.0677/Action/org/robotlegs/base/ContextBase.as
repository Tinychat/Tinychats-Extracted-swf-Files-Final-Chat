package org.robotlegs.base
{
    import flash.events.*;

    public class ContextBase extends Object implements IContext, IEventDispatcher
    {
        protected var _eventDispatcher:IEventDispatcher;

        public function ContextBase()
        {
            this._eventDispatcher = new EventDispatcher(this);
            return;
        }// end function

        public function get eventDispatcher() : IEventDispatcher
        {
            return this._eventDispatcher;
        }// end function

        public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
        {
            this.eventDispatcher.addEventListener(type, listener, useCapture, priority);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            if (this.eventDispatcher.hasEventListener(event.type))
            {
                return this.eventDispatcher.dispatchEvent(event);
            }
            return false;
        }// end function

        public function hasEventListener(type:String) : Boolean
        {
            return this.eventDispatcher.hasEventListener(type);
        }// end function

        public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
        {
            this.eventDispatcher.removeEventListener(type, listener, useCapture);
            return;
        }// end function

        public function willTrigger(type:String) : Boolean
        {
            return this.eventDispatcher.willTrigger(type);
        }// end function

    }
}
