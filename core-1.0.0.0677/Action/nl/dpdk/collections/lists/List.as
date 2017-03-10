package nl.dpdk.collections.lists
{
    import nl.dpdk.collections.core.*;
    import nl.dpdk.collections.iteration.*;
    import nl.dpdk.specifications.*;

    public class List extends Object implements ICollection, IList, IDeque, IQueue, IStack, ISortable, IFoldable, IMappable, ISelectable, IApplyable
    {
        var listSize:int = 0;

        public function List()
        {
            return;
        }// end function

        public function get(i:int)
        {
            return null;
        }// end function

        public function set(i:int, data) : void
        {
            return;
        }// end function

        public function removeAt(i:int) : Boolean
        {
            return false;
        }// end function

        public function insertAt(i:int, data) : void
        {
            return;
        }// end function

        public function indexOf(data) : int
        {
            return 0;
        }// end function

        public function lastIndexOf(data) : int
        {
            return 0;
        }// end function

        protected function addCollection(collection:ICollection) : void
        {
            if (collection)
            {
                this.addAll(collection);
            }
            return;
        }// end function

        public function addAll(collection:ICollection) : void
        {
            var _loc_2:* = collection.iterator();
            while (_loc_2.hasNext())
            {
                
                this.add(_loc_2.next());
            }
            return;
        }// end function

        public function subList(from:int, to:int) : List
        {
            return null;
        }// end function

        public function reverse() : void
        {
            return;
        }// end function

        public function iteratorExtended() : IIteratorExtended
        {
            return null;
        }// end function

        public function sort(comparator:Function, sortType:int = 0) : void
        {
            return;
        }// end function

        public function addFirst(data) : void
        {
            return;
        }// end function

        public function getFirst()
        {
            return null;
        }// end function

        public function addLast(data) : void
        {
            this.add(data);
            return;
        }// end function

        public function getLast()
        {
            return null;
        }// end function

        public function removeFirst()
        {
            return null;
        }// end function

        public function removeLast()
        {
            return null;
        }// end function

        public function peek()
        {
            return this.getFirst();
        }// end function

        public function enqueue(data) : void
        {
            return;
        }// end function

        public function dequeue()
        {
            return null;
        }// end function

        public function pop()
        {
            return null;
        }// end function

        public function push(data) : void
        {
            return;
        }// end function

        public function add(data) : void
        {
            return;
        }// end function

        public function clear() : void
        {
            return;
        }// end function

        public function contains(data) : Boolean
        {
            return false;
        }// end function

        public function isEmpty() : Boolean
        {
            return this.listSize == 0;
        }// end function

        public function remove(data) : Boolean
        {
            return false;
        }// end function

        public function size() : int
        {
            return this.listSize;
        }// end function

        public function toArray() : Array
        {
            return null;
        }// end function

        public function toString() : String
        {
            return null;
        }// end function

        public function iterator() : IIterator
        {
            return null;
        }// end function

        public function fold(folder:IFolder)
        {
            var _loc_2:* = this.iterator();
            while (_loc_2.hasNext())
            {
                
                folder.fold(_loc_2.next());
            }
            return folder.get();
        }// end function

        public function map(mapper:IMapper) : List
        {
            return null;
        }// end function

        public function selectBy(specification:ISpecification) : List
        {
            return null;
        }// end function

        public function apply(applyer:IApplyer) : void
        {
            var _loc_2:* = this.iterator();
            while (_loc_2.hasNext())
            {
                
                applyer.execute(_loc_2.next());
            }
            return;
        }// end function

    }
}
