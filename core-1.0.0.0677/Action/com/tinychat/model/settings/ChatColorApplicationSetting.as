package com.tinychat.model.settings
{
    import __AS3__.vec.*;
    import com.tinychat.model.social.chat.*;

    public class ChatColorApplicationSetting extends Object implements ApplicationSetting
    {
        private var colors:ChatColors;
        private var _displayName:String;

        public function ChatColorApplicationSetting(param1:ChatColors, param2:String)
        {
            this.colors = param1;
            this._displayName = param2;
            return;
        }// end function

        public function get displayName() : String
        {
            return this._displayName;
        }// end function

        public function get value() : Object
        {
            return this.colors.current;
        }// end function

        public function set value(param1:Object) : void
        {
            this.colors.current = uint(param1);
            return;
        }// end function

        public function get all() : Vector.<uint>
        {
            return this.colors.all;
        }// end function

    }
}
