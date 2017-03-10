package nl.dpdk.collections.core
{

    public interface IQueue extends ICollection
    {

        public function IQueue();

        function peek();

        function enqueue(data) : void;

        function dequeue();

    }
}
