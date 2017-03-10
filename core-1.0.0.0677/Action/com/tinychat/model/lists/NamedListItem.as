package com.tinychat.model.lists
{
    import flash.events.*;

    public class NamedListItem extends EventDispatcher implements Named
    {
        private var _name:String;

        public function NamedListItem(param1:String)
        {
            this._name = param1;
            return;
        }// end function

        public function get name() : String
        {
            return this._name;
        }// end function

    }
}
