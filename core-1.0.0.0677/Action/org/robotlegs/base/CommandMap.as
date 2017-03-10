package org.robotlegs.base
{
    import flash.events.*;
    import flash.utils.*;
    import org.robotlegs.core.*;

    public class CommandMap extends Object implements ICommandMap
    {
        protected var eventDispatcher:IEventDispatcher;
        protected var injector:IInjector;
        protected var reflector:IReflector;
        protected var eventTypeMap:Dictionary;
        protected var verifiedCommandClasses:Dictionary;
        protected var detainedCommands:Dictionary;

        public function CommandMap(eventDispatcher:IEventDispatcher, injector:IInjector, reflector:IReflector)
        {
            this.eventDispatcher = eventDispatcher;
            this.injector = injector;
            this.reflector = reflector;
            this.eventTypeMap = new Dictionary(false);
            this.verifiedCommandClasses = new Dictionary(false);
            this.detainedCommands = new Dictionary(false);
            return;
        }// end function

        public function mapEvent(eventType:String, commandClass:Class, eventClass:Class = null, oneshot:Boolean = false) : void
        {
            var eventType:* = eventType;
            var commandClass:* = commandClass;
            var eventClass:* = eventClass;
            var oneshot:* = oneshot;
            this.verifyCommandClass(commandClass);
            if (!eventClass)
            {
            }
            eventClass = Event;
            if (!this.eventTypeMap[eventType])
            {
            }
            var _loc_6:* = new Dictionary(false);
            this.eventTypeMap[eventType] = new Dictionary(false);
            var eventClassMap:* = _loc_6;
            if (!eventClassMap[eventClass])
            {
            }
            var _loc_6:* = new Dictionary(false);
            eventClassMap[eventClass] = new Dictionary(false);
            var callbacksByCommandClass:* = _loc_6;
            if (callbacksByCommandClass[commandClass] != null)
            {
                throw new ContextError(ContextError.E_COMMANDMAP_OVR + " - eventType (" + eventType + ") and Command (" + commandClass + ")");
            }
            var callback:* = function (event:Event) : void
            {
                routeEventToCommand(event, commandClass, oneshot, eventClass);
                return;
            }// end function
            ;
            this.eventDispatcher.addEventListener(eventType, callback, false, 0, true);
            callbacksByCommandClass[commandClass] = callback;
            return;
        }// end function

        public function unmapEvent(eventType:String, commandClass:Class, eventClass:Class = null) : void
        {
            var _loc_4:* = this.eventTypeMap[eventType];
            if (_loc_4 == null)
            {
                return;
            }
            if (!eventClass)
            {
            }
            var _loc_5:* = _loc_4[Event];
            if (_loc_5 == null)
            {
                return;
            }
            var _loc_6:* = _loc_5[commandClass];
            if (_loc_6 == null)
            {
                return;
            }
            this.eventDispatcher.removeEventListener(eventType, _loc_6, false);
            delete _loc_5[commandClass];
            return;
        }// end function

        public function unmapEvents() : void
        {
            var _loc_1:String = null;
            var _loc_2:Dictionary = null;
            var _loc_3:Dictionary = null;
            var _loc_4:Function = null;
            for (_loc_1 in this.eventTypeMap)
            {
                
                _loc_2 = this.eventTypeMap[_loc_1];
                for each (_loc_3 in _loc_2)
                {
                    
                    for each (_loc_4 in _loc_3)
                    {
                        
                        this.eventDispatcher.removeEventListener(_loc_1, _loc_4, false);
                    }
                }
            }
            this.eventTypeMap = new Dictionary(false);
            return;
        }// end function

        public function hasEventCommand(eventType:String, commandClass:Class, eventClass:Class = null) : Boolean
        {
            var _loc_4:* = this.eventTypeMap[eventType];
            if (_loc_4 == null)
            {
                return false;
            }
            if (!eventClass)
            {
            }
            var _loc_5:* = _loc_4[Event];
            if (_loc_5 == null)
            {
                return false;
            }
            return _loc_5[commandClass] != null;
        }// end function

        public function execute(commandClass:Class, payload:Object = null, payloadClass:Class = null, named:String = "") : void
        {
            this.verifyCommandClass(commandClass);
            if (payload == null)
            {
            }
            if (payloadClass != null)
            {
                if (!payloadClass)
                {
                }
                payloadClass = this.reflector.getClass(payload);
                this.injector.mapValue(payloadClass, payload, named);
            }
            var _loc_5:* = this.injector.instantiate(commandClass);
            if (payload === null)
            {
            }
            if (payloadClass != null)
            {
                this.injector.unmap(payloadClass, named);
            }
            _loc_5.execute();
            return;
        }// end function

        public function detain(command:Object) : void
        {
            this.detainedCommands[command] = true;
            return;
        }// end function

        public function release(command:Object) : void
        {
            if (this.detainedCommands[command])
            {
                delete this.detainedCommands[command];
            }
            return;
        }// end function

        protected function verifyCommandClass(commandClass:Class) : void
        {
            var commandClass:* = commandClass;
            if (!this.verifiedCommandClasses[commandClass])
            {
                var _loc_4:int = 0;
                var _loc_5:* = describeType(commandClass).factory.method;
                var _loc_3:* = new XMLList("");
                for each (_loc_6 in _loc_5)
                {
                    
                    var _loc_7:* = _loc_6;
                    with (_loc_6)
                    {
                        if (@name == "execute")
                        {
                            _loc_3[_loc_4] = _loc_6;
                        }
                    }
                }
                this.verifiedCommandClasses[commandClass] = _loc_3.length();
                if (!this.verifiedCommandClasses[commandClass])
                {
                    throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + " - " + commandClass);
                }
            }
            return;
        }// end function

        protected function routeEventToCommand(event:Event, commandClass:Class, oneshot:Boolean, originalEventClass:Class) : Boolean
        {
            if (!(event is originalEventClass))
            {
                return false;
            }
            this.execute(commandClass, event);
            if (oneshot)
            {
                this.unmapEvent(event.type, commandClass, originalEventClass);
            }
            return true;
        }// end function

    }
}
