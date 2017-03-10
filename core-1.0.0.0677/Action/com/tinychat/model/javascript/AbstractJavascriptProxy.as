package com.tinychat.model.javascript
{
    import com.tinychat.model.flashvars.*;
    import com.tinychat.model.utils.*;
    import flash.external.*;
    import org.osflash.signals.*;

    public class AbstractJavascriptProxy extends Object
    {
        private var targetObject:String;
        private var targetContainer:String;
        private var registeredCallbacks:Object;

        public function AbstractJavascriptProxy(param1:FlashvarsProxy, param2:String = "this")
        {
            this.targetObject = param2;
            this.targetContainer = param1.target;
            this.registeredCallbacks = {};
            return;
        }// end function

        protected function callApi(param1:String, ... args)
        {
            args.unshift(this.targetObject + ".instance[\'" + this.targetContainer + "\']." + param1);
            return ExternalInterface.call.apply(null, args);
        }// end function

        protected function registerCallback(param1:String, param2:Function) : void
        {
            ExternalInterface.addCallback(param1, param2);
            return;
        }// end function

        protected function dispatchSignal(param1:Signal, param2:Class = null) : Function
        {
            var signal:* = param1;
            var argumentsWrapper:* = param2;
            return function (... args) : void
            {
                if (args.length > 0)
                {
                    if (argumentsWrapper)
                    {
                        signal.dispatch(makeConstructorFunction(argumentsWrapper).apply(null, args));
                    }
                    else
                    {
                        signal.dispatch.apply(null, args);
                    }
                }
                else
                {
                    signal.dispatch();
                }
                return;
            }// end function
            ;
        }// end function

    }
}
