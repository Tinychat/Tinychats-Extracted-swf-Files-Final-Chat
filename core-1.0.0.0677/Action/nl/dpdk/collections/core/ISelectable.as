package nl.dpdk.collections.core
{
    import nl.dpdk.collections.lists.*;
    import nl.dpdk.specifications.*;

    public interface ISelectable
    {

        public function ISelectable();

        function selectBy(specification:ISpecification) : List;

    }
}
