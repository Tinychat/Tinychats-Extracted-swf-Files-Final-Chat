package com.tinychat.model.settings
{
    import com.tinychat.model.cookie.*;
    import flash.errors.*;

    public class AbstractFlashCookieApplicationSetting extends Object implements ApplicationSetting
    {
        protected var flashCookie:FlashCookieProxy;
        private var _displayName:String;

        public function AbstractFlashCookieApplicationSetting(param1:FlashCookieProxy, param2:String)
        {
            this.flashCookie = param1;
            this._displayName = param2;
            return;
        }// end function

        public function get displayName() : String
        {
            return this._displayName;
        }// end function

        public function get value() : Object
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

        public function set value(param1:Object) : void
        {
            throw new IllegalOperationError("Must be overridden in sub-class.");
        }// end function

    }
}
