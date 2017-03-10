package org.robotlegs.base
{
    import flash.events.*;

    public class EventMap extends Object implements IEventMap
    {
        protected var eventDispatcher:IEventDispatcher;
        protected var _dispatcherListeningEnabled:Boolean = true;
        protected var listeners:Array;

        public function EventMap(eventDispatcher:IEventDispatcher)
        {
            this.listeners = new Array();
            this.eventDispatcher = eventDispatcher;
            return;
        }// end function

        public function get dispatcherListeningEnabled() : Boolean
        {
            return this._dispatcherListeningEnabled;
        }// end function

        public function set dispatcherListeningEnabled(value:Boolean) : void
        {
            this._dispatcherListeningEnabled = value;
            return;
        }// end function

        public function mapListener(dispatcher:IEventDispatcher, type:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true) : void
        {
            var params:Object;
            var dispatcher:* = dispatcher;
            var type:* = type;
            var listener:* = listener;
            var eventClass:* = eventClass;
            var useCapture:* = useCapture;
            var priority:* = priority;
            var useWeakReference:* = useWeakReference;
            if (this.dispatcherListeningEnabled == false)
            {
            }
            if (dispatcher == this.eventDispatcher)
            {
                throw new ContextError(ContextError.E_EVENTMAP_NOSNOOPING);
            }
            if (!eventClass)
            {
            }
            eventClass = Event;
            var i:* = this.listeners.length;
            do
            {
                
                params = this.listeners[i];
                if (params.dispatcher == dispatcher)
                {
                }
                if (params.type == type)
                {
                }
                if (params.listener == listener)
                {
                }
                if (params.useCapture == useCapture)
                {
                }
                if (params.eventClass == eventClass)
                {
                    return;
                }
                i = (i - 1);
            }while (i)
            var callback:* = function (event:Event) : void
            {
                routeEventToListener(event, listener, eventClass);
                return;
            }// end function
            ;
            params;
            this.listeners.push(params);
            dispatcher.addEventListener(type, callback, useCapture, priority, useWeakReference);
            return;
        }// end function

        public function unmapListener(dispatcher:IEventDispatcher, type:String, listener:Function, eventClass:Class = null, useCapture:Boolean = false) : void
        {
            var _loc_6:Object = null;
            if (!eventClass)
            {
            }
            eventClass = Event;
            var _loc_7:* = this.listeners.length;
            while (_loc_7--)
            {
                
                _loc_6 = this.listeners[_loc_7];
                if (_loc_6.dispatcher == dispatcher)
                {
                }
                if (_loc_6.type == type)
                {
                }
                if (_loc_6.listener == listener)
                {
                }
                if (_loc_6.useCapture == useCapture)
                {
                }
                if (_loc_6.eventClass == eventClass)
                {
                    dispatcher.removeEventListener(type, _loc_6.callback, useCapture);
                    this.listeners.splice(_loc_7, 1);
                    return;
                }
            }
            return;
        }// end function

        public function unmapListeners() : void
        {
            var _loc_1:Object = null;
            var _loc_2:IEventDispatcher = null;
            do
            {
                
                _loc_2 = _loc_1.dispatcher;
                _loc_2.removeEventListener(_loc_1.type, _loc_1.callback, _loc_1.useCapture);
                var _loc_3:* = this.listeners.pop();
                _loc_1 = this.listeners.pop();
            }while (_loc_3)
            return;
        }// end function

        protected function routeEventToListener(event:Event, listener:Function, originalEventClass:Class) : void
        {
            if (event is originalEventClass)
            {
                this.listener(event);
            }
            return;
        }// end function

    }
}
