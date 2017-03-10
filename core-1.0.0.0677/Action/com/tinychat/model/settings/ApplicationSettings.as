package com.tinychat.model.settings
{

    public class ApplicationSettings extends Object
    {
        private var _settings:Array;

        public function ApplicationSettings()
        {
            this._settings = [];
            return;
        }// end function

        public function get settings() : Array
        {
            return this._settings.concat();
        }// end function

        public function add(param1:ApplicationSetting) : void
        {
            this._settings.push(param1);
            return;
        }// end function

    }
}
