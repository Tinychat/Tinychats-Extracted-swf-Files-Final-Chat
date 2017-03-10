package com.tinychat.model.settings
{

    public interface ApplicationSetting
    {

        public function ApplicationSetting();

        function get displayName() : String;

        function get value() : Object;

        function set value(param1:Object) : void;

    }
}
