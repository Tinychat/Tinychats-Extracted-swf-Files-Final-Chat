package com.tinychat.model.monitor
{
    import com.tinychat.model.api.*;

    public class DurationMonitor extends AbstractActivityMonitor
    {
        private var _source:Timed;

        public function DurationMonitor(param1:Timed)
        {
            this.source = param1;
            return;
        }// end function

        public function set source(param1:Timed) : void
        {
            this._source = param1;
            return;
        }// end function

        override public function get activityLevel() : Number
        {
            return this._source.currentTime;
        }// end function

    }
}
