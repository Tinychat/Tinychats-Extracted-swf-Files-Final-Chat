package nl.dpdk.collections.core
{
    import nl.dpdk.collections.lists.*;

    public interface IMappable
    {

        public function IMappable();

        function map(mapper:IMapper) : List;

    }
}
