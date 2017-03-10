package mx.events
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    public class RSLEvent extends ProgressEvent
    {
        public var errorText:String;
        public var isResourceModule:Boolean;
        public var loaderInfo:LoaderInfo;
        public var rslIndex:int;
        public var rslTotal:int;
        public var url:URLRequest;
        static const VERSION:String = "4.6.0.23201";
        public static const RSL_ADD_PRELOADED:String = "rslAddPreloaded";
        public static const RSL_COMPLETE:String = "rslComplete";
        public static const RSL_ERROR:String = "rslError";
        public static const RSL_PROGRESS:String = "rslProgress";

        public function RSLEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:int = -1, param7:int = -1, param8:URLRequest = null, param9:String = null, param10:Boolean = false, param11:LoaderInfo = null)
        {
            super(param1, param2, param3, param4, param5);
            this.rslIndex = param6;
            this.rslTotal = param7;
            this.url = param8;
            this.errorText = param9;
            this.isResourceModule = param10;
            this.loaderInfo = param11;
            return;
        }// end function

        override public function clone() : Event
        {
            return new RSLEvent(type, bubbles, cancelable, bytesLoaded, bytesTotal, this.rslIndex, this.rslTotal, this.url, this.errorText, this.isResourceModule, this.loaderInfo);
        }// end function

    }
}
