package nl.dpdk.specifications
{

    public interface ISpecification
    {

        public function ISpecification();

        function isSatisfiedBy(candidate) : Boolean;

        function and(specification:ISpecification) : ISpecification;

        function or(specification:ISpecification) : ISpecification;

        function not() : ISpecification;

    }
}
