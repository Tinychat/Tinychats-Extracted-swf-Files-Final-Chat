package nl.dpdk.collections.lists
{
    import nl.dpdk.collections.core.*;
    import nl.dpdk.collections.iteration.*;

    public interface IList extends ICollection
    {

        public function IList();

        function get(i:int);

        function set(i:int, data) : void;

        function removeAt(i:int) : Boolean;

        function insertAt(i:int, data) : void;

        function indexOf(data) : int;

        function lastIndexOf(data) : int;

        function addAll(collection:ICollection) : void;

        function subList(from:int, to:int) : List;

        function reverse() : void;

        function iteratorExtended() : IIteratorExtended;

    }
}
