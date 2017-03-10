package mx.core
{

    public interface IInvalidating
    {

        public function IInvalidating();

        function invalidateProperties() : void;

        function invalidateSize() : void;

        function invalidateDisplayList() : void;

        function validateNow() : void;

    }
}
