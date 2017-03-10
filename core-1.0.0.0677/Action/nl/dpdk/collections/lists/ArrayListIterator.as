package nl.dpdk.collections.lists
{

    class ArrayListIterator extends Object implements IIteratorExtended
    {
        private var theList:ArrayList;
        private var current:int = 0;
        private var collection:Array;

        function ArrayListIterator(list:ArrayList, collection:Array)
        {
            this.theList = list;
            this.collection = collection;
            this.begin();
            return;
        }// end function

        public function begin() : void
        {
            this.current = -1;
            return;
        }// end function

        public function set(data) : Boolean
        {
            if (this.current >= 0)
            {
            }
            if (this.current >= this.theList.size())
            {
                return false;
            }
            this.collection[this.current] = data;
            return true;
        }// end function

        public function end() : void
        {
            this.current = this.theList.size();
            return;
        }// end function

        public function hasPrevious() : Boolean
        {
            var _loc_1:* = this.theList.size();
            if (this.current <= 0)
            {
            }
            if (this.current <= -1)
            {
            }
            return _loc_1 > 0;
        }// end function

        public function previous()
        {
            var _loc_1:String = this;
            _loc_1.current = this.current - 1;
            if (--this.current < 0)
            {
                this.current = this.theList.size() - 1;
            }
            return this.collection[this.current];
        }// end function

        public function hasNext() : Boolean
        {
            var _loc_1:* = this.theList.size();
            if (this.current >= (_loc_1 - 1))
            {
            }
            if (this.current >= _loc_1)
            {
            }
            return _loc_1 >= 0;
        }// end function

        public function next()
        {
            var _loc_1:String = this;
            _loc_1.current = this.current + 1;
            if (++this.current >= this.theList.size())
            {
                this.current = 0;
            }
            return this.collection[this.current];
        }// end function

        public function insert(data) : void
        {
            if (this.theList.size() == 0)
            {
                this.theList.add(data);
                return;
            }
            var _loc_2:String = this;
            _loc_2.current = this.current + 1;
            this.theList.insertAt(this.current++, data);
            return;
        }// end function

        public function remove() : Boolean
        {
            var _loc_1:* = this.theList.removeAt(this.current);
            if (_loc_1)
            {
                var _loc_2:String = this;
                var _loc_3:* = this.current - 1;
                _loc_2.current = _loc_3;
            }
            return _loc_1;
        }// end function

    }
}
