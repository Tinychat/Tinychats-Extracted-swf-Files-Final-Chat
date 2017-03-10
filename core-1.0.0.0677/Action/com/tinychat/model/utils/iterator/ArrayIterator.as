package com.tinychat.model.utils.iterator
{

    public class ArrayIterator extends Object implements Iterator
    {
        private var list:Array;
        private var index:Number;

        public function ArrayIterator(param1:Array)
        {
            this.list = param1;
            this.reset();
            return;
        }// end function

        public function hasNext() : Boolean
        {
            return this.index < (this.list.length - 1);
        }// end function

        public function next()
        {
            var _loc_1:String = this;
            _loc_1.index = this.index + 1;
            return this.list[++this.index];
        }// end function

        public function reset() : void
        {
            this.index = -1;
            return;
        }// end function

    }
}
