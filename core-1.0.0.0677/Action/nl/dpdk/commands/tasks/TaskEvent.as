package nl.dpdk.commands.tasks
{
    import flash.events.*;

    public class TaskEvent extends Event
    {
        private var task:Task;
        private var message:String;
        public static const DONE:String = "task done";
        public static const START:String = "task started";
        public static const ERROR:String = "task error";

        public function TaskEvent(type:String, task:Task, message:String = "")
        {
            super(type, false);
            this.task = task;
            this.message = message;
            return;
        }// end function

        public function getTask() : Task
        {
            return this.task;
        }// end function

        public function getMessage() : String
        {
            return this.message;
        }// end function

        override public function toString() : String
        {
            return "TaskEvent of type: " + type;
        }// end function

    }
}
