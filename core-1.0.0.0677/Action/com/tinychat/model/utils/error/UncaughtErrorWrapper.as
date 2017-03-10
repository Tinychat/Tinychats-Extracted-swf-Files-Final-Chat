package com.tinychat.model.utils.error
{
    import __AS3__.vec.*;
    import flash.display.*;
    import flash.events.*;

    public class UncaughtErrorWrapper extends Object
    {
        private var target:EventDispatcher;
        private var handlers:Vector.<Function>;
        private static const EVENT_NAME:String = "uncaughtError";
        private static const LOADER_PROPERTY:String = "uncaughtErrorEvents";
        private static const EVENT_ERROR_PROPERTY:String = "error";

        public function UncaughtErrorWrapper(param1:EventDispatcher)
        {
            if (!(param1 is Loader))
            {
            }
            if (param1 is LoaderInfo)
            {
                this.target = param1;
                this.handlers = new Vector.<Function>;
            }
            else
            {
                throw new ArgumentError("Constructor argument must be Loader or LoaderInfo.");
            }
            return;
        }// end function

        public function addErrorHandler(param1:Function) : void
        {
            if (this.target.hasOwnProperty(LOADER_PROPERTY))
            {
                this.handlers.push(param1);
                this.target[LOADER_PROPERTY].addEventListener(EVENT_NAME, this.errorEventHandler);
            }
            return;
        }// end function

        public function removeErrorHandler(param1:Function) : void
        {
            var _loc_2:* = this.handlers.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.handlers.splice(_loc_2, 1);
            }
            return;
        }// end function

        private function errorEventHandler(event:Event) : void
        {
            var _loc_2:* = undefined;
            var _loc_3:Function = null;
            if (event.hasOwnProperty(EVENT_ERROR_PROPERTY))
            {
                _loc_2 = event[EVENT_ERROR_PROPERTY];
                for each (_loc_3 in this.handlers)
                {
                    
                    _loc_3.call(null, _loc_2);
                }
            }
            return;
        }// end function

    }
}
