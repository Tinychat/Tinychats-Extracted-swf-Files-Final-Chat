package nl.dpdk.collections.iteration
{

    public interface IIteratorExtended extends IIterator
    {

        public function IIteratorExtended();

        function insert(data) : void;

        function begin() : void;

        function end() : void;

        function hasPrevious() : Boolean;

        function previous();

        function set(data) : Boolean;

    }
}
