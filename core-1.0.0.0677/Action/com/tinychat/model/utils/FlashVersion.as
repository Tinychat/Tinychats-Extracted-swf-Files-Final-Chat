package com.tinychat.model.utils
{

    public class FlashVersion extends Object
    {
        private static var versionMatcher:RegExp = /([A-Z]+)\s(\d+),(\d+),(\d+),(\d+)/;
        private static var result:Object;

        public function FlashVersion(param1:String)
        {
            result = versionMatcher.exec(param1);
            return;
        }// end function

        public function get os() : String
        {
            return result[1];
        }// end function

        public function get majorVersion() : int
        {
            return parseInt(result[2]);
        }// end function

        public function get minorVersion() : int
        {
            return parseInt(result[3]);
        }// end function

        public function get buildNumber() : int
        {
            return parseInt(result[4]);
        }// end function

        public function get internalBuildNumber() : int
        {
            return parseInt(result[5]);
        }// end function

        public function isEqualToOrGreaterThan(param1:int, param2:int = -1, param3:int = -1, param4:int = -1) : Boolean
        {
            if (this.majorVersion <= param1)
            {
                if (this.majorVersion == param1)
                {
                    if (this.minorVersion <= param2)
                    {
                        if (this.minorVersion == param2)
                        {
                            if (this.buildNumber <= param3)
                            {
                                if (this.buildNumber == param3)
                                {
                                }
                            }
                        }
                    }
                }
            }
            return this.internalBuildNumber >= param4;
        }// end function

    }
}
