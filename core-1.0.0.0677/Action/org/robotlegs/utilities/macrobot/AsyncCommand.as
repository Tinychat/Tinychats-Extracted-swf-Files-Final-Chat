package org.robotlegs.utilities.macrobot
{
    import org.robotlegs.mvcs.*;

    public class AsyncCommand extends Command implements IAsyncCommand
    {
        protected var listeners:Array;
        protected var complete:Boolean = false;

        public function AsyncCommand()
        {
            return;
        }// end function

        public function addCompletionListener(listener:Function) : void
        {
            if (!this.listeners)
            {
            }
            this.listeners = [];
            this.listeners.push(listener);
            return;
        }// end function

        override public function execute() : void
        {
            this.complete = false;
            super.execute();
            if (!this.complete)
            {
                commandMap.detain(this);
            }
            return;
        }// end function

        protected function dispatchComplete(success:Boolean) : void
        {
            var _loc_2:Function = null;
            this.complete = true;
            commandMap.release(this);
            for each (_loc_2 in this.listeners)
            {
                
                this._loc_2(success);
            }
            return;
        }// end function

    }
}
