package com.tinychat.model.monitor
{
    import flash.net.*;

    public class StreamVideoActivity extends Object implements Activity
    {
        private var _stream:NetStream;

        public function StreamVideoActivity(param1:NetStream)
        {
            this.stream = param1;
            return;
        }// end function

        public function set stream(param1:NetStream) : void
        {
            this._stream = param1;
            return;
        }// end function

        public function get activityLevel() : Number
        {
            return this._stream.currentFPS;
        }// end function

    }
}
