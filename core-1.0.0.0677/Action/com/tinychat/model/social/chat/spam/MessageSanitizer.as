package com.tinychat.model.social.chat.spam
{

    public class MessageSanitizer extends Object
    {
        private static var disallowedInputs:Array = ["\b", "\f", "\n", "\r", "\t", "\x0b"];

        public function MessageSanitizer()
        {
            return;
        }// end function

        public static function sanitize(param1:String) : String
        {
            var _loc_2:String = null;
            var _loc_3:Array = null;
            for each (_loc_2 in disallowedInputs)
            {
                
                _loc_3 = param1.split(_loc_2);
                param1 = _loc_3.join("");
            }
            return param1;
        }// end function

    }
}
