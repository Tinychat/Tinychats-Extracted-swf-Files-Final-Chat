package com.tinychat.model.broadcast.base
{

    public class BroadcastPlatform extends Object
    {
        private var value:String;
        private static var valueToTypeLookup:Object = {};
        public static const ANDROID:BroadcastPlatform = new BroadcastPlatform(ANDROID, "android");
        public static const DESKTOP:BroadcastPlatform = new BroadcastPlatform(DESKTOP, "desktop");
        public static const IOS:BroadcastPlatform = new BroadcastPlatform(IOS, "ios");

        public function BroadcastPlatform(param1:BroadcastPlatform, param2:String)
        {
            this.value = param2;
            valueToTypeLookup[param2] = this;
            return;
        }// end function

        public function toString() : String
        {
            return this.value;
        }// end function

        public static function fromString(param1:String) : BroadcastPlatform
        {
            return valueToTypeLookup[param1];
        }// end function

    }
}
