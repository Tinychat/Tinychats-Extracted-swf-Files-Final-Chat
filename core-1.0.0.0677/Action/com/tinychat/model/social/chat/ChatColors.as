package com.tinychat.model.social.chat
{
    import __AS3__.vec.*;

    public class ChatColors extends Object
    {
        private var colors:Vector.<uint>;
        private var index:uint;

        public function ChatColors(param1:Vector.<uint>)
        {
            this.colors = param1;
            this.index = Math.round(Math.random() * (param1.length - 1));
            return;
        }// end function

        public function add(param1:Vector.<uint>) : void
        {
            var _loc_2:uint = 0;
            var _loc_3:int = 0;
            for each (_loc_2 in param1)
            {
                
                _loc_3 = this.colors.indexOf(_loc_2);
                if (_loc_3 == -1)
                {
                    this.colors.push(_loc_2);
                }
            }
            return;
        }// end function

        public function remove(param1:Vector.<uint>) : void
        {
            var _loc_2:uint = 0;
            var _loc_3:int = 0;
            for each (_loc_2 in param1)
            {
                
                _loc_3 = this.colors.indexOf(_loc_2);
                if (_loc_3 != -1)
                {
                    this.colors.splice(_loc_3, 1);
                }
            }
            return;
        }// end function

        public function next() : void
        {
            this.index = (this.index + 1) % this.colors.length;
            return;
        }// end function

        public function get current() : uint
        {
            return this.colors[this.index];
        }// end function

        public function set current(param1:uint) : void
        {
            var _loc_2:* = this.colors.indexOf(param1);
            if (_loc_2 != -1)
            {
                this.index = _loc_2;
            }
            return;
        }// end function

        public function get all() : Vector.<uint>
        {
            return this.colors.concat();
        }// end function

        public function contains(param1:uint) : Boolean
        {
            return this.colors.indexOf(param1) != -1;
        }// end function

    }
}
