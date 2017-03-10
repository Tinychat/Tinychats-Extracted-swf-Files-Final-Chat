package com.codecatalyst.promise
{

    public class Deferred extends Object
    {
        protected var resolver:Resolver;

        public function Deferred()
        {
            this.resolver = new Resolver();
            return;
        }// end function

        public function get promise() : Promise
        {
            return this.resolver.promise;
        }// end function

        public function resolve(value) : void
        {
            this.resolver.resolve(value);
            return;
        }// end function

        public function reject(error) : void
        {
            this.resolver.reject(error);
            return;
        }// end function

    }
}
