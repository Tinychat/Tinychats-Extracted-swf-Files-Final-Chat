package nl.dpdk.collections.core
{

    public interface IDeque extends ICollection
    {

        public function IDeque();

        function addFirst(data) : void;

        function getFirst();

        function addLast(data) : void;

        function getLast();

        function removeFirst();

        function removeLast();

    }
}
