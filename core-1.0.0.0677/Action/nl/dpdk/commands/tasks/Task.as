package nl.dpdk.commands.tasks
{
    import flash.events.*;

    public class Task extends EventDispatcher implements ICommand
    {
        private var executing:Boolean = false;

        public function Task()
        {
            return;
        }// end function

        final public function execute() : void
        {
            dispatchEvent(new TaskEvent(TaskEvent.START, this, "execute() called on the task"));
            this.executeTaskHook();
            return;
        }// end function

        final protected function setExecuting(boolean:Boolean) : void
        {
            this.executing = boolean;
            return;
        }// end function

        final protected function isExecuting() : Boolean
        {
            return this.executing;
        }// end function

        protected function executeTaskHook() : void
        {
            this.fail("The method executeTaskHook needs to be overriden in " + this.toString());
            if (this.isExecuting())
            {
            }
            else
            {
                this.setExecuting(true);
            }
            return;
        }// end function

        private function signalDone(message:String) : void
        {
            this.setExecuting(false);
            dispatchEvent(new TaskEvent(TaskEvent.DONE, this, message));
            return;
        }// end function

        final protected function done() : void
        {
            this.signalDone("normal ending of task: " + this.toString());
            return;
        }// end function

        final protected function fail(message:String) : void
        {
            this.signalError(message);
            return;
        }// end function

        private function signalError(message:String = "") : void
        {
            this.setExecuting(false);
            dispatchEvent(new TaskEvent(TaskEvent.ERROR, this, message));
            return;
        }// end function

        final public function destroy() : void
        {
            try
            {
                this.destroyTaskHook();
            }
            catch (e:Error)
            {
                trace("Error in " + toString() + ".destroyTaskHook(): " + e.message);
            }
            finally
            {
            }
            return;
        }// end function

        protected function destroyTaskHook() : void
        {
            return;
        }// end function

        override public function toString() : String
        {
            return "Task";
        }// end function

    }
}
