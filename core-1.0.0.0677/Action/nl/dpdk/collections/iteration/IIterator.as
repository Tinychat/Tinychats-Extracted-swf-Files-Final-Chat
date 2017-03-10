package nl.dpdk.collections.iteration
{

    public interface IIterator
    {

        public function IIterator();

        function hasNext() : Boolean;

        function next();

        function remove() : Boolean;

    }
}
