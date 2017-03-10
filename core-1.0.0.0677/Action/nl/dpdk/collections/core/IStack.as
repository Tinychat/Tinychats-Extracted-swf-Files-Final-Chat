package nl.dpdk.collections.core
{

    public interface IStack extends ICollection
    {

        public function IStack();

        function pop();

        function push(data) : void;

    }
}
