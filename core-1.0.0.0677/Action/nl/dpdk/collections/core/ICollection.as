package nl.dpdk.collections.core
{

    public interface ICollection extends IIterable
    {

        public function ICollection();

        function add(data) : void;

        function clear() : void;

        function contains(data) : Boolean;

        function isEmpty() : Boolean;

        function remove(data) : Boolean;

        function size() : int;

        function toArray() : Array;

        function toString() : String;

    }
}
