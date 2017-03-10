package nl.dpdk.commands.tasks
{
    import flash.events.*;

    public class SequenceEvent extends Event
    {
        private var task:Task;
        private var message:String;
        public static const ERROR:String = "sequence error, abort sequence";
        public static const ERROR_NON_BLOCKING:String = "task error, do not abort sequence";
        public static const DONE:String = "sequence is done";
        public static const NEXT:String = "ready for the next task in sequence";
        public static const START:String = "sequence started";

        public function SequenceEvent(type:String, task:Task, message:String = "")
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
            return "SequenceEvent of type: " + type;
        }// end function

    }
}
