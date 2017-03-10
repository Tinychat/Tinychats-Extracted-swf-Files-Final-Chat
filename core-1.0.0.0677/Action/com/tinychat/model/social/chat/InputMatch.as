package com.tinychat.model.social.chat
{
    import com.tinychat.model.user.*;

    public class InputMatch extends Object
    {
        private var _type:UserAction;
        private var _args:Array;

        public function InputMatch(param1:UserAction, param2:Array)
        {
            this._type = param1;
            this._args = param2;
            return;
        }// end function

        public function get type() : UserAction
        {
            return this._type;
        }// end function

        public function get args() : Array
        {
            return this._args;
        }// end function

    }
}
