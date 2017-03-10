package org.osflash.signals
{
    import flash.errors.*;
    import flash.utils.*;

    public class Signal extends Object implements ISignalOwner, IDispatcher
    {
        protected var _valueClasses:Array;
        protected var slots:Array;
        protected var slotsNeedCloning:Boolean = false;

        public function Signal(... args)
        {
            this.slots = [];
            if (args.length == 1)
            {
            }
            if (args[0] is Array)
            {
                args = args[0];
            }
            this.valueClasses = args;
            return;
        }// end function

        public function get valueClasses() : Array
        {
            return this._valueClasses;
        }// end function

        public function set valueClasses(value:Array) : void
        {
            this._valueClasses = value ? (value.slice()) : ([]);
            var _loc_2:* = this._valueClasses.length;
            while (_loc_2--)
            {
                
                if (!(this._valueClasses[_loc_2] is Class))
                {
                    throw new ArgumentError("Invalid valueClasses argument: item at index " + _loc_2 + " should be a Class but was:<" + this._valueClasses[_loc_2] + ">." + getQualifiedClassName(this._valueClasses[_loc_2]));
                }
            }
            return;
        }// end function

        public function get numListeners() : uint
        {
            return this.slots.length;
        }// end function

        public function add(listener:Function) : Function
        {
            this.registerListener(listener);
            return listener;
        }// end function

        public function addOnce(listener:Function) : Function
        {
            this.registerListener(listener, true);
            return listener;
        }// end function

        public function remove(listener:Function) : Function
        {
            if (this.indexOfListener(listener) == -1)
            {
                return listener;
            }
            if (this.slotsNeedCloning)
            {
                this.slots = this.slots.slice();
                this.slotsNeedCloning = false;
            }
            this.slots.splice(this.indexOfListener(listener), 1);
            return listener;
        }// end function

        public function removeAll() : void
        {
            var _loc_1:* = this.slots.length;
            while (_loc_1--)
            {
                
                this.remove(Slot(this.slots[_loc_1]).listener);
            }
            return;
        }// end function

        public function dispatch(... args) : void
        {
            args = null;
            var _loc_3:Class = null;
            var _loc_6:Slot = null;
            var _loc_7:Object = null;
            var _loc_8:Object = null;
            var _loc_9:Object = null;
            var _loc_4:* = this._valueClasses.length;
            if (args.length < _loc_4)
            {
                throw new ArgumentError("Incorrect number of arguments. Expected at least " + _loc_4 + " but received " + args.length + ".");
            }
            var _loc_5:int = 0;
            while (_loc_5 < _loc_4)
            {
                
                var _loc_10:* = args[_loc_5];
                args = args[_loc_5];
                if (_loc_10 !== null)
                {
                    var _loc_10:* = this._valueClasses[_loc_5];
                    _loc_3 = this._valueClasses[_loc_5];
                }
                if (args is _loc_10)
                {
                }
                else
                {
                    throw new ArgumentError("Value object <" + args + "> is not an instance of <" + _loc_3 + ">.");
                }
                _loc_5 = _loc_5 + 1;
            }
            if (this.slots.length)
            {
                this.slotsNeedCloning = true;
                switch(args.length)
                {
                    case 0:
                    {
                        for each (_loc_6 in this.slots)
                        {
                            
                            _loc_6.execute0();
                        }
                        break;
                    }
                    case 1:
                    {
                        _loc_7 = args[0];
                        for each (_loc_6 in this.slots)
                        {
                            
                            _loc_6.execute1(_loc_7);
                        }
                        break;
                    }
                    case 2:
                    {
                        _loc_8 = args[0];
                        _loc_9 = args[1];
                        for each (_loc_6 in this.slots)
                        {
                            
                            _loc_6.execute2(_loc_8, _loc_9);
                        }
                        break;
                    }
                    default:
                    {
                        for each (_loc_6 in this.slots)
                        {
                            
                            _loc_6.execute(args);
                        }
                        break;
                    }
                }
                this.slotsNeedCloning = false;
            }
            return;
        }// end function

        protected function indexOfListener(listener:Function) : int
        {
            var _loc_2:* = this.slots.length;
            while (_loc_2--)
            {
                
                if (Slot(this.slots[_loc_2]).listener == listener)
                {
                    return _loc_2;
                }
            }
            return -1;
        }// end function

        protected function registerListener(listener:Function, once:Boolean = false) : void
        {
            var _loc_5:String = null;
            var _loc_6:Slot = null;
            if (listener.length < this._valueClasses.length)
            {
                _loc_5 = listener.length == 1 ? ("argument") : ("arguments");
                throw new ArgumentError("Listener has " + listener.length + " " + _loc_5 + " but it needs at least " + this._valueClasses.length + " to match the given value classes.");
            }
            var _loc_3:* = new Slot(listener, once, this);
            if (!this.slots.length)
            {
                this.slots[0] = _loc_3;
                return;
            }
            var _loc_4:* = this.indexOfListener(listener);
            if (_loc_4 >= 0)
            {
                _loc_6 = Slot(this.slots[_loc_4]);
                if (_loc_6.once)
                {
                }
                if (!once)
                {
                    throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
                }
                if (!_loc_6.once)
                {
                }
                if (once)
                {
                    throw new IllegalOperationError("You cannot add() then addOnce() the same listener without removing the relationship first.");
                }
                return;
            }
            if (this.slotsNeedCloning)
            {
                this.slots = this.slots.slice();
                this.slotsNeedCloning = false;
            }
            this.slots[this.slots.length] = _loc_3;
            return;
        }// end function

    }
}
