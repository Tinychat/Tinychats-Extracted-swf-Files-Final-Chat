package mx.core
{
    import flash.system.*;

    public class RuntimeDPIProvider extends Object
    {

        public function RuntimeDPIProvider()
        {
            return;
        }// end function

        public function get runtimeDPI() : Number
        {
            return classifyDPI(Capabilities.screenDPI);
        }// end function

        static function classifyDPI(param1:Number) : Number
        {
            if (param1 < 200)
            {
                return DPIClassification.DPI_160;
            }
            if (param1 <= 280)
            {
                return DPIClassification.DPI_240;
            }
            return DPIClassification.DPI_320;
        }// end function

    }
}
