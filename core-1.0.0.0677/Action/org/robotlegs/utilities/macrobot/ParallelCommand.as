package org.robotlegs.utilities.macrobot
{
    import org.robotlegs.utilities.macrobot.core.*;

    public class ParallelCommand extends MacroBase
    {
        protected var numCommandsExecuting:uint = 0;

        public function ParallelCommand()
        {
            return;
        }// end function

        override public function execute() : void
        {
            var _loc_1:Object = null;
            super.execute();
            if (commands)
            {
            }
            if (commands.length > 0)
            {
                this.numCommandsExecuting = commands.length;
                for each (_loc_1 in commands)
                {
                    
                    if (!atomic)
                    {
                    }
                    if (success)
                    {
                        executeCommand(_loc_1);
                        continue;
                    }
                    dispatchComplete(false);
                }
            }
            else
            {
                dispatchComplete(true);
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
            var _loc_3:* = this.numCommandsExecuting - 1;
            _loc_2.numCommandsExecuting = _loc_3;
            if (this.numCommandsExecuting == 0)
            {
                dispatchComplete(this.success);
            }
            return;
        }// end function

    }
}
