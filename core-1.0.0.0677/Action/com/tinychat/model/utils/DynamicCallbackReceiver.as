package com.tinychat.model.utils
{
    import __AS3__.vec.*;

    dynamic public class DynamicCallbackReceiver extends Object
    {
        private var callback:Function;

        public function DynamicCallbackReceiver(param1:Function, param2:Vector.<String>)
        {
            var _loc_3:String = null;
            this.callback = param1;
            for each (_loc_3 in param2)
            {
                
                this[_loc_3] = this.createHandlerForCallbackMethod(_loc_3);
            }
            return;
        }// end function

        private function createHandlerForCallbackMethod(param1:String) : Function
        {
            var name:* = param1;
            return function (... args) : void
            {
                callback(name, args);
                return;
            }// end function
            ;
        }// end function

    }
}
