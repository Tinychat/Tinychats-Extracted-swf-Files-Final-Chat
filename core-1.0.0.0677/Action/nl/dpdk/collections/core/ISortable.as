package nl.dpdk.collections.core
{

    public interface ISortable
    {

        public function ISortable();

        function sort(comparator:Function, sortType:int = 0) : void;

    }
}
