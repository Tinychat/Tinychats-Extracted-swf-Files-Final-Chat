package com.tinychat.model.utils.iterator
{
    import mx.collections.*;

    public class IListIterator extends Object implements Iterator
    {
        private var list:IList;
        private var index:Number;

        public function IListIterator(param1:IList)
        {
            this.list = param1;
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
            return this.list.getItemAt(++this.index);
        }// end function

        public function reset() : void
        {
            this.index = -1;
            return;
        }// end function

    }
}
