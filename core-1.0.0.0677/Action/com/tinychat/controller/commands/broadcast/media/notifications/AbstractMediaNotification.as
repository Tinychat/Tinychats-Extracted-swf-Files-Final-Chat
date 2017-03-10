package com.tinychat.controller.commands.broadcast.media.notifications
{
    import com.tinychat.model.media.*;
    import mx.utils.*;

    public class AbstractMediaNotification extends Object
    {
        protected var type:MediaType;
        private var message:String;
        private var substitutions:Array;

        public function AbstractMediaNotification(param1:MediaType, param2:String, param3:Array)
        {
            this.type = param1;
            this.message = param2;
            this.substitutions = param3;
            return;
        }// end function

        public function create() : String
        {
            return this.createMessage(this.message, this.substitutions);
        }// end function

        private function createMessage(param1:String, param2:Array) : String
        {
            return StringUtil.substitute.apply(null, [param1].concat(param2));
        }// end function

    }
}
