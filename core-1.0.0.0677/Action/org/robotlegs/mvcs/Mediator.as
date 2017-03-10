package org.robotlegs.mvcs
{
    import flash.display.*;
    import flash.events.*;
    import org.robotlegs.base.*;
    import org.robotlegs.core.*;

    public class Mediator extends MediatorBase
    {
        public var contextView:DisplayObjectContainer;
        public var mediatorMap:IMediatorMap;
        protected var _eventDispatcher:IEventDispatcher;
        protected var _eventMap:IEventMap;

        public function Mediator()
        {
            return;
        }// end function

        override public function preRemove() : void
        {
            if (this._eventMap)
            {
                this._eventMap.unmapListeners();
            }
            super.preRemove();
            return;
        }// end function

        public function get eventDispatcher() : IEventDispatcher
        {
            return this._eventDispatcher;
        }// end function

        public function set eventDispatcher(value:IEventDispatcher) : void
        {
            this._eventDispatcher = value;
            return;
        }// end function

        protected function get eventMap() : IEventMap
        {
            if (!this._eventMap)
            {
                var _loc_1:* = new EventMap(this.eventDispatcher);
                this._eventMap = new EventMap(this.eventDispatcher);
            }
            return _loc_1;
        }// end function

        protected function dispatch(event:Event) : Boolean
        {
            if (this.eventDispatcher.hasEventListener(event.type))
            {
                return this.eventDispatcher.dispatchEvent(event);
            }
            return false;
        }// end function

        protected function addViewListener(type:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true) : void
        {
            this.eventMap.mapListener(IEventDispatcher(viewComponent), type, listener, eventClass, useCapture, priority, useWeakReference);
            return;
        }// end function

        protected function addContextListener(type:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true) : void
        {
            this.eventMap.mapListener(this.eventDispatcher, type, listener, eventClass, useCapture, priority, useWeakReference);
            return;
        }// end function

    }
}
