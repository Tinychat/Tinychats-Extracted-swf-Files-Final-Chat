package com.tinychat.model.room.connection
{
    import __AS3__.vec.*;

    public class NetStreamCallbackMethodNames extends Object
    {
        public static const ON_PLAY_STATUS:String = "onPlayStatus";
        public static const ON_TEXT_STATUS:String = "onTextData";
        public static const ON_META_DATA:String = "onMetaData";
        public static const ON_CUE_POINT:String = "onCuePoint";
        public static const all:Vector.<String> = NetStreamCallbackMethodNames.Vector.<String>([ON_PLAY_STATUS, ON_TEXT_STATUS, ON_META_DATA, ON_CUE_POINT]);

        public function NetStreamCallbackMethodNames()
        {
            return;
        }// end function

    }
}
