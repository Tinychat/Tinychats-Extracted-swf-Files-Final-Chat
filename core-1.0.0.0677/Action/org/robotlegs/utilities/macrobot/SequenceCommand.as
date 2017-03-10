package org.robotlegs.utilities.macrobot
{
    import org.robotlegs.utilities.macrobot.core.*;

    public class SequenceCommand extends MacroBase
    {
        protected var executionIndex:uint;

        public function SequenceCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            super.execute();
            this.executionIndex = 0;
            this.executeNext();
            return;
        }// end function

        protected function executeNext() : void
        {
            if (commands)
            {
            }
            if (this.executionIndex < commands.length)
            {
                executeCommand(commands[this.executionIndex]);
            }
            else
            {
                dispatchComplete(success);
            }
            return;
        }// end function

        override protected function commandCompleteHandler(success:Boolean) : void
        {
            super.commandCompleteHandler(success);
            if (this.success)
            {
            }
            this.success = success;
            var _loc_2:String = this;
            var _loc_3:* = this.executionIndex + 1;
            _loc_2.executionIndex = _loc_3;
            if (!atomic)
            {
            }
            if (this.success)
            {
                this.executeNext();
            }
            else
            {
                dispatchComplete(false);
            }
            return;
        }// end function

    }
}
