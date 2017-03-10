package nl.dpdk.collections.lists
{
    import nl.dpdk.collections.core.*;
    import nl.dpdk.collections.iteration.*;
    import nl.dpdk.collections.sorting.*;
    import nl.dpdk.specifications.*;

    public class ArrayList extends List
    {
        var collection:Array;

        public function ArrayList(collection:ICollection = null)
        {
            this.collection = new Array();
            addCollection(collection);
            return;
        }// end function

        override public function map(mapper:IMapper) : List
        {
            var _loc_2:* = this.iterator();
            var _loc_3:* = new ArrayList();
            while (_loc_2.hasNext())
            {
                
                _loc_3.add(mapper.map(_loc_2.next()));
            }
            return _loc_3;
        }// end function

        override public function addFirst(item) : void
        {
            this.collection.unshift(item);
            var _loc_3:* = listSize + 1;
            listSize = _loc_3;
            return;
        }// end function

        override public function getFirst()
        {
            return this.collection[0];
        }// end function

        override public function getLast()
        {
            return this.collection[(listSize - 1)];
        }// end function

        override public function removeFirst()
        {
            if (listSize == 0)
            {
                return null;
            }
            var _loc_2:* = listSize - 1;
            listSize = _loc_2;
            return this.collection.shift();
        }// end function

        override public function removeLast()
        {
            if (listSize == 0)
            {
                return null;
            }
            var _loc_2:* = listSize - 1;
            listSize = _loc_2;
            return this.collection.pop();
        }// end function

        override public function add(data) : void
        {
            var _loc_3:* = listSize + 1;
            listSize = _loc_3;
            this.collection.push(data);
            return;
        }// end function

        override public function clear() : void
        {
            this.collection = new Array();
            listSize = 0;
            return;
        }// end function

        override public function contains(data) : Boolean
        {
            var _loc_2:int = 0;
            while (_loc_2 < listSize)
            {
                
                if (this.collection[_loc_2] == data)
                {
                    return true;
                }
                _loc_2 = _loc_2 + 1;
            }
            return false;
        }// end function

        override public function remove(data) : Boolean
        {
            var _loc_2:int = 0;
            while (_loc_2 < listSize)
            {
                
                if (this.collection[_loc_2] == data)
                {
                    this.collection.splice(_loc_2, 1);
                    var _loc_4:* = listSize - 1;
                    listSize = _loc_4;
                    return true;
                }
                _loc_2 = _loc_2 + 1;
            }
            return false;
        }// end function

        private function getListSize() : int
        {
            return listSize;
        }// end function

        override public function toArray() : Array
        {
            return this.collection.concat();
        }// end function

        override public function toString() : String
        {
            return "ArrayList of size " + size();
        }// end function

        override public function iterator() : IIterator
        {
            return new ArrayListIterator(this, this.collection);
        }// end function

        override public function enqueue(data) : void
        {
            var _loc_3:* = listSize + 1;
            listSize = _loc_3;
            this.collection.push(data);
            return;
        }// end function

        override public function dequeue()
        {
            if (listSize == 0)
            {
                return null;
            }
            var _loc_2:* = listSize - 1;
            listSize = _loc_2;
            return this.collection.shift();
        }// end function

        override public function pop()
        {
            if (listSize == 0)
            {
                return null;
            }
            var _loc_2:* = listSize - 1;
            listSize = _loc_2;
            return this.collection.pop();
        }// end function

        override public function push(data) : void
        {
            var _loc_3:* = listSize + 1;
            listSize = _loc_3;
            this.collection.push(data);
            return;
        }// end function

        override public function get(i:int)
        {
            return this.collection[i];
        }// end function

        override public function set(i:int, data) : void
        {
            if (i <= listSize)
            {
            }
            if (i < 0)
            {
                this.add(data);
                return;
            }
            this.collection[i] = data;
            return;
        }// end function

        override public function removeAt(i:int) : Boolean
        {
            if (i < listSize)
            {
            }
            if (i < 0)
            {
                return false;
            }
            this.collection.splice(i, 1);
            var _loc_3:* = listSize - 1;
            listSize = _loc_3;
            return true;
        }// end function

        override public function insertAt(i:int, data) : void
        {
            if (i >= 0)
            {
            }
            if (i > listSize)
            {
                this.add(data);
                return;
            }
            this.collection.splice(i, 0, data);
            var _loc_4:* = listSize + 1;
            listSize = _loc_4;
            return;
        }// end function

        override public function indexOf(data) : int
        {
            return this.collection.indexOf(data);
        }// end function

        override public function lastIndexOf(data) : int
        {
            return this.collection.lastIndexOf(data);
        }// end function

        override public function subList(from:int, to:int) : List
        {
            var _loc_3:* = new ArrayList();
            if (from >= 0)
            {
            }
            if (from < this.getListSize())
            {
            }
            if (this.getListSize() != 0)
            {
            }
            if (to <= from)
            {
                return _loc_3;
            }
            var _loc_4:* = this.collection.slice(from, to);
            var _loc_5:* = _loc_4.length;
            var _loc_6:int = 0;
            while (_loc_6 < _loc_5)
            {
                
                _loc_3.add(_loc_4[_loc_6]);
                _loc_6 = _loc_6 + 1;
            }
            return _loc_3;
        }// end function

        override public function reverse() : void
        {
            this.collection = this.collection.reverse();
            return;
        }// end function

        override public function iteratorExtended() : IIteratorExtended
        {
            return new ArrayListIterator(this, this.collection);
        }// end function

        override public function selectBy(specification:ISpecification) : List
        {
            var _loc_2:* = new ArrayList();
            var _loc_3:* = this.getListSize();
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                if (specification.isSatisfiedBy(this.collection[_loc_4]))
                {
                    _loc_2.add(this.collection[_loc_4]);
                }
                _loc_4 = _loc_4 + 1;
            }
            return _loc_2;
        }// end function

        override public function sort(comparator:Function, sortType:int = 5) : void
        {
            switch(sortType)
            {
                case SortTypes.SELECTION:
                {
                    this.selectionSort(comparator);
                    break;
                }
                case SortTypes.BUBBLE:
                {
                    this.bubbleSort(comparator);
                    break;
                }
                case SortTypes.BINARY_INSERTION:
                {
                    this.binaryInsertionSort(comparator);
                    break;
                }
                case SortTypes.INSERTION:
                {
                    this.insertionSort(comparator);
                    break;
                }
                case SortTypes.SHELL:
                {
                    this.shellSort(comparator);
                    break;
                }
                case SortTypes.MERGE:
                {
                    this.doMergeSort(comparator);
                    break;
                }
                case SortTypes.QUICK:
                {
                    this.quickSort(0, (this.getListSize() - 1), comparator);
                    break;
                }
                case SortTypes.NATIVE:
                {
                }
                default:
                {
                    this.collection.sort(comparator);
                    break;
                    break;
                }
            }
            return;
        }// end function

        private function shellSort(comparator:Function) : void
        {
            var _loc_6:int = 0;
            var _loc_7:int = 0;
            var _loc_8:* = undefined;
            var _loc_9:int = 0;
            var _loc_2:* = new Array();
            var _loc_3:int = 0;
            var _loc_4:* = this.getListSize();
            _loc_2.push(1);
            var _loc_5:int = 1;
            while (_loc_5 <= 10)
            {
                
                _loc_2[_loc_5] = Math.pow(4, (_loc_5 + 1)) + 3 * Math.pow(2, _loc_5) + 1;
                if (_loc_2[_loc_5] < _loc_4)
                {
                    _loc_3 = _loc_5;
                }
                else
                {
                    break;
                }
                _loc_5 = _loc_5 + 1;
            }
            while (_loc_3 >= 0)
            {
                
                _loc_6 = _loc_2[_loc_3];
                _loc_9 = _loc_6;
                while (_loc_9 < _loc_4)
                {
                    
                    _loc_7 = _loc_9;
                    _loc_8 = this.collection[_loc_9];
                    do
                    {
                        
                        this.collection[_loc_7] = this.collection[_loc_7 - _loc_6];
                        _loc_7 = _loc_7 - _loc_6;
                        if (_loc_7 >= _loc_6)
                        {
                        }
                    }while (this.comparator(_loc_8, this.collection[_loc_7 - _loc_6]) == SortOrder.LESS)
                    this.collection[_loc_7] = _loc_8;
                    _loc_9 = _loc_9 + 1;
                }
                _loc_3 = _loc_3 - 1;
            }
            return;
        }// end function

        private function quickSort(left:int, right:int, comparator:Function) : void
        {
            if (right <= left)
            {
                return;
            }
            var _loc_4:* = this.partition(left, right, comparator);
            this.quickSort(left, (_loc_4 - 1), comparator);
            this.quickSort((_loc_4 + 1), right, comparator);
            return;
        }// end function

        private function partition(left:int, right:int, comparator:Function) : int
        {
            var _loc_4:* = left - 1;
            var _loc_5:* = right;
            var _loc_6:* = this.collection[right];
            while (true)
            {
                
                while (this.comparator(this.collection[++_loc_4], _loc_6) == SortOrder.LESS)
                {
                    
                }
                while (this.comparator(_loc_6, this.collection[--_loc_5]) == SortOrder.LESS)
                {
                    
                    if (_loc_5 == left)
                    {
                        break;
                    }
                }
                if (++_loc_4 >= --_loc_5)
                {
                    break;
                }
                this.exchange(_loc_4, _loc_5);
            }
            this.exchange(_loc_4, right);
            return _loc_4;
        }// end function

        private function mergeSort(array:Array, comparator:Function) : Array
        {
            if (array.length <= 1)
            {
                return array;
            }
            var _loc_3:* = array.length >> 1;
            return this.merge(this.mergeSort(array.slice(0, _loc_3), comparator), this.mergeSort(array.slice(_loc_3, array.length), comparator), comparator);
        }// end function

        private function merge(a:Array, b:Array, comparator:Function) : Array
        {
            var _loc_4:* = new Array();
            var _loc_5:* = a.length;
            var _loc_6:* = b.length;
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_9:* = _loc_5 + _loc_6;
            var _loc_10:int = 0;
            while (_loc_10 < _loc_9)
            {
                
                if (_loc_7 >= _loc_5)
                {
                    _loc_4[_loc_10] = b[_loc_8++];
                }
                else if (_loc_8 >= _loc_6)
                {
                    _loc_4[_loc_10] = a[_loc_7++];
                }
                else
                {
                    _loc_4[_loc_10] = this.comparator(a[_loc_7], b[_loc_8]) == SortOrder.LESS ? (a[_loc_7++]) : (b[_loc_8++]);
                }
                _loc_10 = _loc_10 + 1;
            }
            return _loc_4;
        }// end function

        private function doMergeSort(comparator:Function) : void
        {
            this.collection = this.mergeSort(this.collection, comparator);
            return;
        }// end function

        private function selectionSort(comparator:Function) : void
        {
            var _loc_3:int = 0;
            var _loc_5:int = 0;
            var _loc_2:* = this.getListSize();
            var _loc_4:int = 0;
            while (_loc_4 < (_loc_2 - 1))
            {
                
                _loc_3 = _loc_4;
                _loc_5 = _loc_4 + 1;
                while (_loc_5 < _loc_2)
                {
                    
                    if (this.comparator(this.collection[_loc_5], this.collection[_loc_3]) == SortOrder.LESS)
                    {
                        _loc_3 = _loc_5;
                    }
                    _loc_5 = _loc_5 + 1;
                }
                this.exchange(_loc_3, _loc_4);
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        private function insertionSort(comparator:Function) : void
        {
            var _loc_2:* = undefined;
            var _loc_3:int = 0;
            var _loc_4:int = 1;
            while (_loc_4 < listSize)
            {
                
                _loc_3 = _loc_4;
                _loc_2 = this.collection[_loc_4];
                do
                {
                    
                    this.collection[_loc_3] = this.collection[(_loc_3 - 1)];
                    _loc_3 = _loc_3 - 1;
                    if (_loc_3 > 0)
                    {
                    }
                }while (this.comparator(_loc_2, this.collection[(_loc_3 - 1)]) == SortOrder.LESS)
                this.collection[_loc_3] = _loc_2;
                _loc_4 = _loc_4 + 1;
            }
            return;
        }// end function

        private function binaryInsertionSort(comparator:Function) : void
        {
            var _loc_2:* = undefined;
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_7:int = 0;
            if (listSize <= 1)
            {
                return;
            }
            var _loc_6:int = 1;
            while (_loc_6 < listSize)
            {
                
                _loc_3 = _loc_6;
                _loc_4 = 0;
                while (_loc_3 >= _loc_4)
                {
                    
                    _loc_5 = _loc_4 + _loc_3 >> 1;
                    trace("i: " + _loc_6 + ", m: " + _loc_5 + ", l: " + _loc_4 + ", r: " + _loc_3 + ", c: " + this.collection.toString());
                    if (this.comparator(this.collection[_loc_6], this.collection[_loc_5]) == SortOrder.LESS)
                    {
                        _loc_3 = _loc_5 - 1;
                        continue;
                    }
                    if (this.comparator(this.collection[_loc_6], this.collection[_loc_5]) == SortOrder.LARGER)
                    {
                        _loc_4 = _loc_5 + 1;
                        continue;
                    }
                    break;
                }
                _loc_2 = this.collection[_loc_6];
                _loc_7 = _loc_6;
                while (_loc_7 > _loc_5)
                {
                    
                    this.collection[_loc_7] = this.collection[(_loc_7 - 1)];
                    _loc_7 = _loc_7 - 1;
                }
                this.collection[(_loc_5 + 1)] = _loc_2;
                _loc_6 = _loc_6 + 1;
            }
            return;
        }// end function

        private function bubbleSort(comparator:Function) : void
        {
            var _loc_4:int = 0;
            var _loc_2:* = this.getListSize();
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = _loc_2 - 1;
                while (_loc_4 > _loc_3)
                {
                    
                    this.compareAndExchange(comparator, _loc_4, (_loc_4 - 1));
                    _loc_4 = _loc_4 - 1;
                }
                _loc_3 = _loc_3 + 1;
            }
            return;
        }// end function

        private function compareAndExchange(comparator:Function, changeWhenLess:int, changeWhenMore:int) : void
        {
            if (this.comparator(this.collection[changeWhenLess], this.collection[changeWhenMore]) == SortOrder.LESS)
            {
                this.exchange(changeWhenLess, changeWhenMore);
            }
            return;
        }// end function

        private function exchange(a:int, b:int) : void
        {
            var _loc_3:* = this.collection[a];
            this.collection[a] = this.collection[b];
            this.collection[b] = _loc_3;
            return;
        }// end function

    }
}
