package com.tinychat.model.settings
{

    public class OpenGraphRemindMeApplicationSetting extends Object implements ApplicationSetting
    {
        private var _displayName:String;
        private var _value:Boolean;

        public function OpenGraphRemindMeApplicationSetting(param1:String)
        {
            this._displayName = param1;
            this._value = true;
            return;
        }// end function

        public function get displayName() : String
        {
            return this._displayName;
        }// end function

        public function get value() : Object
        {
            return this._value;
        }// end function

        public function set value(param1:Object) : void
        {
            this._value = param1;
            return;
        }// end function

    }
}
