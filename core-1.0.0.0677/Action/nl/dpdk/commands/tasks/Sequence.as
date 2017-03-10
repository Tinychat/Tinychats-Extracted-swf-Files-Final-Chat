package nl.dpdk.commands.tasks
{
    import flash.events.*;
    import nl.dpdk.collections.iteration.*;
    import nl.dpdk.collections.lists.*;

    public class Sequence extends EventDispatcher implements ICommand
    {
        private var tasks:ArrayList;
        private var abortOnError:Boolean = false;
        private var executing:Boolean = false;
        private var paused:Boolean = false;
        private var current:Task;
        private var firstTask:Boolean = true;

        public function Sequence(abortOnError:Boolean = false)
        {
            this.tasks = new ArrayList();
            this.abortOnError = abortOnError;
            return;
        }// end function

        final public function add(task:Task) : void
        {
            if (this.tasks)
            {
                this.tasks.add(task);
            }
            return;
        }// end function

        final public function remove(task:Task) : Boolean
        {
            return this.tasks ? (this.tasks.remove(task)) : (false);
        }// end function

        final public function execute() : void
        {
            if (this.isExecuting())
            {
                trace("Sequence has already started");
            }
            else
            {
                this.setExecuting(true);
                dispatchEvent(new SequenceEvent(SequenceEvent.START, null, "Sequence has started"));
                this.tryNextTask();
            }
            return;
        }// end function

        final public function size() : uint
        {
            return this.tasks ? (this.tasks.size()) : (0);
        }// end function

        final public function contains(task:Task) : Boolean
        {
            return this.tasks ? (this.tasks.contains(task)) : (false);
        }// end function

        private function setExecuting(boolean:Boolean) : void
        {
            this.executing = boolean;
            return;
        }// end function

        final public function isExecuting() : Boolean
        {
            return this.executing;
        }// end function

        private function executeNextTask() : void
        {
            var _loc_1:Task = null;
            if (!this.getPaused())
            {
            }
            if (this.tasks)
            {
            }
            if (this.tasks.size() != 0)
            {
                _loc_1 = this.tasks.dequeue() as Task;
                _loc_1.addEventListener(TaskEvent.DONE, this.onDone, false, -1);
                _loc_1.addEventListener(TaskEvent.ERROR, this.onError, false, -1);
                if (this.getCurrent())
                {
                    this.getCurrent().destroy();
                }
                this.setCurrent(_loc_1);
                _loc_1.execute();
            }
            return;
        }// end function

        private function setCurrent(task:Task) : void
        {
            this.current = task;
            return;
        }// end function

        private function finished() : void
        {
            this.setExecuting(false);
            dispatchEvent(new SequenceEvent(SequenceEvent.DONE, null, "all tasks finished"));
            return;
        }// end function

        public function getPaused() : Boolean
        {
            return this.paused;
        }// end function

        public function pause() : void
        {
            this.setPaused(true);
            return;
        }// end function

        private function setPaused(paused:Boolean) : void
        {
            this.paused = paused;
            return;
        }// end function

        public function resume() : void
        {
            this.setPaused(false);
            this.tryNextTask();
            return;
        }// end function

        private function onError(event:TaskEvent) : void
        {
            var _loc_2:* = event.getTask();
            _loc_2.removeEventListener(TaskEvent.DONE, this.onDone);
            _loc_2.removeEventListener(TaskEvent.ERROR, this.onError);
            var _loc_3:* = event.getMessage();
            if (this.abortOnError)
            {
                this.setExecuting(false);
                dispatchEvent(new SequenceEvent(SequenceEvent.ERROR, _loc_2, _loc_3));
                _loc_2.destroy();
            }
            else
            {
                dispatchEvent(new SequenceEvent(SequenceEvent.ERROR_NON_BLOCKING, _loc_2, _loc_3));
                this.tryNextTask();
            }
            return;
        }// end function

        private function tryNextTask() : void
        {
            if (!this.getPaused())
            {
                if (this.tasks.size() != 0)
                {
                    if (this.firstTask)
                    {
                        this.firstTask = false;
                    }
                    else
                    {
                        dispatchEvent(new SequenceEvent(SequenceEvent.NEXT, this.getCurrent()));
                    }
                    this.executeNextTask();
                }
                else
                {
                    dispatchEvent(new SequenceEvent(SequenceEvent.NEXT, null));
                    if (this.getCurrent())
                    {
                        this.getCurrent().destroy();
                    }
                    this.finished();
                }
            }
            return;
        }// end function

        private function onDone(event:TaskEvent) : void
        {
            var _loc_2:* = event.getTask();
            _loc_2.removeEventListener(TaskEvent.DONE, this.onDone);
            _loc_2.removeEventListener(TaskEvent.ERROR, this.onError);
            this.tryNextTask();
            return;
        }// end function

        public function destroy() : void
        {
            var task:Task;
            var iterator:IIterator;
            try
            {
                iterator = this.tasks.iterator();
                do
                {
                    
                    task = iterator.next() as Task;
                    try
                    {
                        iterator.remove();
                        task.removeEventListener(TaskEvent.DONE, this.onDone);
                        task.removeEventListener(TaskEvent.ERROR, this.onError);
                        task.destroy();
                    }
                    catch (e:Error)
                    {
                        trace("Error in Task.clear() when doing cleanup: " + e.message);
                    }
                }while (iterator.hasNext())
                this.tasks.clear();
            }
            catch (e:Error)
            {
                trace("Error in Sequence.clear(): " + e.message);
            }
            return;
        }// end function

        override public function toString() : String
        {
            return "Sequence";
        }// end function

        public function getCurrent() : Task
        {
            return this.current;
        }// end function

        public function getTasks() : List
        {
            return this.tasks;
        }// end function

    }
}
