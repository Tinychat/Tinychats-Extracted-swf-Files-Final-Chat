package com.codecatalyst.promise
{

    public class Promise extends Object
    {
        protected var resolver:Resolver;

        public function Promise(resolver:Resolver)
        {
            this.resolver = resolver;
            return;
        }// end function

        public function then(onFullfilled:Function = null, onRejected:Function = null) : Promise
        {
            return this.resolver.then(onFullfilled, onRejected);
        }// end function

        public static function when(value) : Promise
        {
            var _loc_2:* = new Deferred();
            var _loc_3:Boolean = false;
            if (!_loc_3)
            {
                _loc_2.resolve(value);
            }
            return _loc_2.promise;
        }// end function

    }
}
