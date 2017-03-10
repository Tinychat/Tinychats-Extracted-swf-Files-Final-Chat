package com.codecatalyst.promise
{
    import com.codecatalyst.util.*;

    class Resolver extends Object
    {
        protected var _promise:Promise;
        protected var onResolved:Function;
        protected var onRejected:Function;
        protected var pendingResolvers:Array;
        protected var processed:Boolean;
        protected var completed:Boolean;
        protected var completionAction:String;
        protected var completionValue:Object;

        function Resolver(onResolved:Function = null, onRejected:Function = null)
        {
            var defaultRejectionHandler:Function;
            var onResolved:* = onResolved;
            var onRejected:* = onRejected;
            defaultRejectionHandler = function (error) : void
            {
                throw error;
            }// end function
            ;
            this.onResolved = onResolved;
            this.onRejected = onRejected;
            this._promise = new Promise(this);
            this.pendingResolvers = [];
            this.processed = false;
            this.completed = false;
            this.completionAction = null;
            this.completionValue = undefined;
            if (this.onRejected == null)
            {
                this.onRejected = defaultRejectionHandler;
            }
            return;
        }// end function

        public function get promise() : Promise
        {
            return this._promise;
        }// end function

        public function resolve(result) : void
        {
            if (!this.processed)
            {
                this.process(this.onResolved, result);
            }
            return;
        }// end function

        public function reject(error) : void
        {
            if (!this.processed)
            {
                this.process(this.onRejected, error);
            }
            return;
        }// end function

        public function then(onResolved:Function = null, onRejected:Function = null) : Promise
        {
            var pendingResolver:Resolver;
            var onResolved:* = onResolved;
            var onRejected:* = onRejected;
            if (onResolved == null)
            {
            }
            if (onRejected != null)
            {
                var schedulePendingResolver:* = function () : void
            {
                schedule(pendingResolver);
                return;
            }// end function
            ;
                pendingResolver = new Resolver(onResolved, onRejected);
                nextTick(schedulePendingResolver);
                return pendingResolver.promise;
            }
            return this.promise;
        }// end function

        protected function propagate() : void
        {
            var _loc_1:Resolver = null;
            for each (_loc_1 in this.pendingResolvers)
            {
                
                var _loc_4:* = _loc_1;
                _loc_4._loc_1[this.completionAction](this.completionValue);
            }
            return;
        }// end function

        protected function schedule(pendingResolver:Resolver) : void
        {
            this.pendingResolvers.push(pendingResolver);
            if (this.completed)
            {
                this.propagate();
            }
            return;
        }// end function

        protected function complete(action:String, value) : void
        {
            var _loc_3:String = null;
            this.onRejected = null;
            this.onResolved = _loc_3;
            this.completionAction = action;
            this.completionValue = value;
            this.completed = true;
            this.propagate();
            return;
        }// end function

        protected function completeResolved(result) : void
        {
            this.complete("resolve", result);
            return;
        }// end function

        protected function completeRejected(error) : void
        {
            this.complete("reject", error);
            return;
        }// end function

        protected function process(callback:Function, value) : void
        {
            var callback:* = callback;
            var value:* = value;
            this.processed = true;
            try
            {
                if (callback != null)
                {
                    value = this.callback(value);
                }
                if (value != null)
                {
                }
                if ("then" in value)
                {
                }
                if (value.then is Function)
                {
                    value.then(this.completeResolved, this.completeRejected);
                }
                else
                {
                    this.completeResolved(value);
                }
            }
            catch (error)
            {
                completeRejected(error);
            }
            return;
        }// end function

    }
}
