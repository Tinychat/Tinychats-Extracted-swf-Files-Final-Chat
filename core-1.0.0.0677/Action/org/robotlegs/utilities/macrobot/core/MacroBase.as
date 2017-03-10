package org.robotlegs.utilities.macrobot.core
{
    import MacroBase.as$7.*;
    import flash.events.*;
    import org.robotlegs.core.*;
    import org.robotlegs.utilities.macrobot.*;

    public class MacroBase extends AsyncCommand
    {
        public var atomic:Boolean = true;
        protected var success:Boolean = true;
        protected var commands:Array;

        public function MacroBase()
        {
            return;
        }// end function

        public function addCommand(commandClass:Class, payload:Object = null, payloadClass:Class = null, named:String = "") : void
        {
            if (!this.commands)
            {
            }
            this.commands = [];
            this.commands.push(new CommandDescriptor(commandClass, payload, payloadClass, named));
            return;
        }// end function

        public function addCommandInstance(command:Object) : void
        {
            if (!this.commands)
            {
            }
            this.commands = [];
            this.commands.push(command);
            return;
        }// end function

        override public function execute() : void
        {
            super.execute();
            this.success = true;
            return;
        }// end function

        protected function executeCommand(commandOrDescriptor:Object) : void
        {
            var _loc_2:* = this.prepareCommand(commandOrDescriptor);
            var _loc_3:* = _loc_2 is IAsyncCommand;
            if (_loc_3)
            {
                IAsyncCommand(_loc_2).addCompletionListener(this.commandCompleteHandler);
            }
            if (commandMap is IMacroCommandMap)
            {
                IMacroCommandMap(commandMap).executePrepared(_loc_2);
            }
            else
            {
                _loc_2.execute();
            }
            if (!_loc_3)
            {
                this.commandCompleteHandler(true);
            }
            return;
        }// end function

        protected function prepareCommand(commandOrDescriptor:Object) : Object
        {
            if (commandOrDescriptor is CommandDescriptor)
            {
                return this.prepareCommandFromDescriptor(CommandDescriptor(commandOrDescriptor));
            }
            injector.injectInto(commandOrDescriptor);
            return commandOrDescriptor;
        }// end function

        protected function prepareCommandFromDescriptor(descriptor:CommandDescriptor) : Object
        {
            var _loc_2:Object = null;
            var _loc_3:Class = null;
            var _loc_4:IReflector = null;
            if (commandMap is IMacroCommandMap)
            {
                _loc_2 = IMacroCommandMap(commandMap).prepare(descriptor.commandClass, descriptor.payload, descriptor.payloadClass, descriptor.named);
            }
            else if (descriptor.payload)
            {
                if (descriptor.payloadClass)
                {
                    _loc_3 = descriptor.payloadClass;
                }
                else
                {
                    _loc_4 = injector.getInstance(IReflector);
                    if (_loc_4)
                    {
                        _loc_3 = _loc_4.getClass(descriptor.payload);
                    }
                    else
                    {
                        _loc_3 = Event;
                    }
                }
                injector.mapValue(_loc_3, descriptor.payload, descriptor.named);
                _loc_2 = injector.instantiate(descriptor.commandClass);
                injector.unmap(_loc_3, descriptor.named);
            }
            else
            {
                _loc_2 = injector.instantiate(descriptor.commandClass);
            }
            return _loc_2;
        }// end function

        protected function commandCompleteHandler(success:Boolean) : void
        {
            return;
        }// end function

    }
}
