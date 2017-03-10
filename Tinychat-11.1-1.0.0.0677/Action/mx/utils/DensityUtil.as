package mx.utils
{
    import mx.core.*;

    public class DensityUtil extends Object
    {
        private static var runtimeDPI:Number;

        public function DensityUtil()
        {
            return;
        }// end function

        public static function getRuntimeDPI() : Number
        {
            if (!isNaN(runtimeDPI))
            {
                return runtimeDPI;
            }
            var _loc_1:* = Singleton.getClass("mx.core::RuntimeDPIProvider");
            if (!_loc_1)
            {
                _loc_1 = RuntimeDPIProvider;
            }
            var _loc_2:* = RuntimeDPIProvider(new _loc_1);
            runtimeDPI = _loc_2.runtimeDPI;
            return runtimeDPI;
        }// end function

        public static function getDPIScale(param1:Number, param2:Number) : Number
        {
            if (param1 != DPIClassification.DPI_160 && param1 != DPIClassification.DPI_240 && param1 != DPIClassification.DPI_320 || param2 != DPIClassification.DPI_160 && param2 != DPIClassification.DPI_240 && param2 != DPIClassification.DPI_320)
            {
                return NaN;
            }
            return param2 / param1;
        }// end function

    }
}
