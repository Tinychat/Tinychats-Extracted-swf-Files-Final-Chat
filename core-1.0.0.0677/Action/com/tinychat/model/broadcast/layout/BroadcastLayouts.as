package com.tinychat.model.broadcast.layout
{

    public class BroadcastLayouts extends Object
    {
        private var _name:String;
        public static const PROMOTED:BroadcastLayouts = new BroadcastLayouts(PROMOTED, "broadcastLayoutPromoted");
        public static const ROWS:BroadcastLayouts = new BroadcastLayouts(ROWS, "broadcastLayoutRows");

        public function BroadcastLayouts(param1:BroadcastLayouts, param2:String)
        {
            this._name = param2;
            return;
        }// end function

        public function toString() : String
        {
            return this._name;
        }// end function

    }
}
