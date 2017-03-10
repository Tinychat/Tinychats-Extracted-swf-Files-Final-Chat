package com.adobe.serialization.json
{

    public class JSON extends Object
    {

        public function JSON()
        {
            return;
        }// end function

        public static function decode(s:String, strict:Boolean = true)
        {
            return new JSONDecoder(s, strict).getValue();
        }// end function

        public static function encode(o:Object) : String
        {
            return new JSONEncoder(o).getString();
        }// end function

    }
}
